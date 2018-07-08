pipeline {
  agent any
  stages {
    stage('cleanupWorkspac') {
      steps {
        sh '''
             echo "removing angular-seed and app dir if exist"
             if [ -d ${app} ]
             then
                 rm -rf ${app}
             fi

             if [ -d ${seed_proj_dir} ]
             then
                 rm -rf ${seed_proj_dir}
             fi

        '''
      }
    }
    stage('buildTheBuilder') {
      steps {
        git 'https://github.com/angular/angular-seed'
        sh 'echo "cmd: docker build -t build-img -f Dockerfile.build"'
      }
    }
    stage('createBuilderContainer') {
      steps {
        sh 'echo "cmd: docker create --name build-cont build-img"'
      }
    }
    stage('collectRuntimeArtfacts') {
      steps {
        sh 'echo "cmd: docker cp build-cont:<path/to/app> ./target/app"'
      }
    }
    stage('buildServiceImg') {
      steps {
        sh 'echo "cmd:docker build ."'
      }
    }
  }
  environment {
    angular_seed_src_url = 'https://github.com/angular/angular-seed.git'
    seed_proj_dir = 'angular-seed'
    app_dir = 'app'
    build_img_name = 'build-img'
    build_cont_name = 'build-cont'
    app_img_name = 'angular-seed-app-img'
  }
}