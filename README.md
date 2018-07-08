# dbp-ajs-app
=====================

This project build angular-seed application (https://github.com/angular/angular-seed) docker images using Docker Build Pattern.  

Highlevel pipeline flow:
- get https://github.com/angular/angular-seed
- build the builder image
- create builder's container image
- extract /app for the service image
- build service image

For background info collected as part of my learning/research see "info" file.

------------------
| Prerequisites: |
------------------
- docker installed (https://docs.docker.com/install/)
- required jenkins with blue ocean pluging (see https://jenkins.io/doc/book/blueocean/getting-started/) for CI with Jenkins

------------------------
| Build docker images: |
------------------------
run: bash build.sh

----------
| to do: |
----------
- add test to the build process
- artifact publishing
- exploring Docker Multi-Stage Builds
