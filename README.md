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

-----------------
| current status:|
-----------------
- work in progress

------------------
| Prerequisites: |
------------------
- required jenkins with blue ocean pluging (see https://jenkins.io/doc/book/blueocean/getting-started/) to try

-----------
| To try: |
-----------
- create new blue ocean pipeline(https://jenkins.io/doc/book/blueocean/creating-pipelines/) and pointing to this github repo
