# Use this if you are running "normal" 64-bit architecture
build:
	docker build -t openjdk --build-arg arch=x .

# If you are running Apple Silicon Architecture, use this instead.
buildm1:
	docker build -t openjdk --build-arg arch=aarch .

# Build without caching
buildnocache:
	docker build --no-cache -t openjdk --build-arg arch=x .

buildm1nocache:
	docker build --no-cache -t openjdk --build-arg arch=aarch .

# Enter the image
run:
	docker run -it openjdk