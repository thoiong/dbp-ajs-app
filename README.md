# dbp-ajs-app
=====================

Build https://github.com/angular/angular-seed using Docker Build Pattern.  
Highlevel pipeline flow:
- get https://github.com/angular/angular-seed
- build the builder image
- create builder's container image
- extract /app for the service image
- build service image

For background info collected as part of my learning see "info" file.

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
