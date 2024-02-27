FROM oraclelinux:8.9 AS buildenv
ARG arch=x

# Install build tools
RUN yum groupinstall "Development Tools"
RUN yum install alsa-lib-devel cups-devel fontconfig-devel  \
    libXtst-devel libXt-devel libXrender-devel libXrandr-devel libXi-devel

# Install Base JDK
WORKDIR /
RUN curl https://download.java.net/java/GA/jdk21.0.2/f2283984656d49d69e91c558476027ac/13/GPL/openjdk-21.0.2_linux-${arch}64_bin.tar.gz\
     --output openjdk22.tar.gz
RUN tar xvf openjdk22.tar.gz -C /opt
RUN update-alternatives --install /usr/bin/java java /opt/jdk-21.0.2/bin/java 100
RUN update-alternatives --set java /opt/jdk-21.0.2/bin/java
RUN update-alternatives --install /usr/bin/javac javac /opt/jdk-21.0.2/bin/javac 100


# Install JTReg
RUN curl https://ci.adoptium.net/view/Dependencies/job/dependency_pipeline/lastSuccessfulBuild/artifact/jtreg/jtreg-7.3.1+1.tar.gz \
    --output jtreg.tar.gz
RUN tar xvf jtreg.tar.gz




FROM buildenv AS compilejdk

# Change to openJDK dir
WORKDIR /openjdk
# Copy the JDK files the Git repository
COPY ./openjdk .

# Copy hello world
COPY ./main.java ./main.java

# Configure bash
RUN bash configure --with-jtreg=../jtreg

#Build OpenJDK
RUN make

# Enter bash
ENTRYPOINT ["/bin/bash"]
