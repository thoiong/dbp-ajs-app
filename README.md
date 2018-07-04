# dbp-ajs-app
=====================
-------------------------------------
|Docker Build Pattern in a nutshell |
-------------------------------------
2 files:
- Dockerfile.build - build docker image with all the tools and packages require to build the service
- Dockerfile - build docker image with all the packages required to run the service

Process flow:
1. build docker image from Dockerfile.build - builder image
cmd: docker build -t build-img -f Dockerfile.build
2. create container from build image in step 1
cmd: docker create --name build-cont build-img
3. extract artifacts needed for service image from the container in step 2
cmd: docker cp build-cont:/usr/local/gaia/target/mgs.war ./target/mgs.war
4. build docker image from Dockerfile - service image
cmd: docker build .

see https://alexei-led.github.io/post/docker_builder_pattern/ for detail

-----------------------------------------
| angularjs-seed app - Dockerfile.build |
-----------------------------------------
cover:
node.js & npm tool installation (this article http://mherman.org/blog/2018/02/26/dockerizing-an-angular-app/ & .travis.yml might provide some clue)
jdk installation
git installation
google chrome installation
git clone angular-seed code
npm install 
npm start
npm test

-----------------------------------
| angularjs-seed app - Dockerfile |
-----------------------------------
includes:
app package/dir
npm start

---------------------
|docker-compose.yml |
---------------------

below ref urls might help with contents of the above files:
- .travis.yml from the angular-seed project
- https://stackoverflow.com/questions/40710235/how-to-create-a-docker-container-of-an-angularjs-app
- http://mherman.org/blog/2018/02/26/dockerizing-an-angular-app/ 
- http://www.belatrixsf.com/blog/dockerize-angular-react-vue-web-apps/
- https://dzone.com/articles/dockerizing-angular-app-via-nginxsnippet
