c_build:
	docker build -t blazor-app .

c_run:
	docker run -p 8080:80 blazor-app
