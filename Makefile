push: image
	docker push images.local:5000/ddclient

image: lint
	docker build . --tag=images.local:5000/ddclient

lint: entrypoint.sh
	shellcheck --exclude=SC2154 entrypoint.sh
