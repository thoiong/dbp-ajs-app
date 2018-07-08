#/bin/bash
#
# Build script
#
#==============================

usage () {
    echo "Usage: $0 [${usage_known_ops}]"
    echo "   if operation not provided, do full build process"
    echo ""
    echo ""
    exit 1
}


isKnownOps () {
    if [ -z "${OP}" ]
    then
        OP=all
    else
        echo "==== checking if ${OP} in the known ops list ...."
        for oper in ${known_ops}
        do
            if [ "${oper}" == "${OP}" ]
            then
                return 0
	fi
        done
        echo "==== "
	echo "==== Unknown operation.  Exit"
        echo "==== "
        echo " "
	usage
    fi

}

tidyUp () {
    echo "tidyup build workspace ...."
    if [ -d ${app_dir} ]
    then
        echo "====  deleting ${app_dir} dir ...."
        rm -rf ${app_dir}
    fi

    if [ -d ${seed_proj_dir} ]
    then
        echo "====  deleting ${seed_proj_dir} dir ...."
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
    isBuildCont=$(docker ps -a|grep "${build_cont_name}")
    if [ ! -z "${isBuildCont}" ]
    then
        docker rm ${build_cont_name}
    fi

    docker create --name ${build_cont_name} ${build_img_name}
    docker cp ${build_cont_name}:/build-workspace/${app_dir} .
}

buildApp () {
    docker build -t ${app_img_name} .
}

all () {
    tasks="tidyUp getAngularSeedCodes buildBuilderImg getAppFromBuilderImg buildApp"
    for task in ${known_ops}
    do
        ${task}
	rc=$?
	if [ $? -ne 0 ]
	then
	    echo "${task} return non ${rc}"
	    exit ${rc}
	fi
    done


}
#=========
# main
#=========
OP=$1

known_ops="tidyUp getAngularSeedCodes buildBuilderImg getAppFromBuilderImg buildApp"
usage_known_ops="tidyUp|getAngularSeedCodes|buildBuilderImg|getAppFromBuilderImg|buildApp"

angular_seed_src_url="https://github.com/angular/angular-seed.git"
seed_proj_dir="angular-seed"
app_dir=app
build_img_name="build-img"
build_cont_name="build-cont"
app_img_name="angular-seed-app-img"

isKnownOps
${OP}
