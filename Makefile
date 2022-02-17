.PHONY: clean docker

## Prod
docker:
	docker build -t snapshift/snap-web .

## Dev
# docker-build-dev
dbd:
	DOCKER_BUILDKIT=1 docker build -t snapshift/snap-web . -f Dockerfile.dev
# The volume mounting allows multiple containers to run in parallel
# and prevents the hypothetical different node_modules versions collision.
# dbrd docker-build-run-dev
dbrd: dbd
	docker run --rm --network host -v $(shell pwd):/snap-web -v /snap-web/node_modules

# UTILS
clean:
	rm -rf dist
