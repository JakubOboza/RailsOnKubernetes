GIT_COMMIT := $(shell git rev-parse HEAD)

docker:
	@echo LATEST COMMIT IS $(GIT_COMMIT)
	docker build -t jakuboboza/rails-on-k8s:latest -t jakuboboza/rails-on-k8s:$(GIT_COMMIT) .
	docker push jakuboboza/rails-on-k8s:latest
	docker push jakuboboza/rails-on-k8s:$(GIT_COMMIT)
	docker build -t jakuboboza/rails-on-k8s:ngx_latest -t jakuboboza/rails-on-k8s:ngx_$(GIT_COMMIT) -f Dockerfile.nginx .
	docker push jakuboboza/rails-on-k8s:ngx_latest
	docker push jakuboboza/rails-on-k8s:ngx_$(GIT_COMMIT)
