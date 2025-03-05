c_build:
	docker build -t blazor-app .

c_run:
	docker run -p 8080:8080 blazor-app
