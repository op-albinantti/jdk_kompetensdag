build:
	docker build -t openjdk --build-arg arch=x .

buildm1:
	docker build -t openjdk --build-arg arch=aarch .

buildnocache:
	docker build --no-cache -t openjdk --build-arg arch=x .

buildm1nocache:
	docker build --no-cache -t openjdk --build-arg arch=aarch .

make run:
	docker run -it openjdk

clean:
	docker rmi openjdk