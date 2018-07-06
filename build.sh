#/bin/bash
#
# Build script
#
#==============================

tidyUp () {
    if [ -d ${app} ]
    then
        rm -rf ${app}
    fi

    if [ -d ${seed_proj_dir} ]
    then
        rm -rf ${seed_proj_dir}
    fi
}

getAngularSeedCodes () {
    git clone --depth=1 ${angular_seed_src_url} ${seed_proj_dir}    
}

buildBuilderImg () {
    docker build -t ${build_img_name} -f Dockerfile.build . --rm
}

getAppFromBuilderImg () {
    docker create --name ${build_cont_name} ${build_img_name}
    docker cp ${build_cont_name}:/build-workspace/${app_dir} .
}

buildApp () {
    docker build -t ${app_img_name} .
}

#=========
# main
#=========
angular_seed_src_url="https://github.com/angular/angular-seed.git"
seed_proj_dir="angular-seed"
app_dir=app
build_img_name="build-img"
build_cont_name="build-cont"
app_img_name="angular-seed-app-img"


tidyUp
getAngularSeedCodes
buildBuilderImg
getAppFromBuilderImg
buildApp

