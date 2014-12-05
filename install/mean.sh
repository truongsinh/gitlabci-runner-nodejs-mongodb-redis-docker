set -u
$cmd_trap_err
#set -e
# NOTE : Permission of myApp is 777
set_env1(){
  mkdir1 $dir_my_app
  mkdir1 $dir_nodejs
  export ver='0.9.3'
}





node1(){
  local dir=$dir_nodejs
  
  cd $dir
  curl http://nodejs.org/dist/v0.10.26/node-v0.10.26-linux-x64.tar.gz | tar xz
  mv $dir/node* $dir/node && \
    sudo ln -s $dir/node/bin/node /usr/local/bin/node && \
    sudo ln -s $dir/node/bin/npm /usr/local/bin/npm
}

npm1(){
sudo npm update -g npm
sudo npm install -g grunt-cli bower
sudo npm install -g mean-cli@${ver}
}

init1(){
cd $path_my_app
mean init $APP_NAME
ensure test -d $dir_my_app
}

after(){
cd $dir_myApp/myApp; 
sudo  npm install -g
sudo  npm link
#grunt test
}

before(){
   node1
  npm1
  init1
}


#cmd_start="${1:-before}" 
#eval "$cmd_start" 

install(){
set_env1
before
after
}
config(){
  echo
}
test(){
  echo
}

commander $@
