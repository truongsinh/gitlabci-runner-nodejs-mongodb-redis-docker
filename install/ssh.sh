#RUN mkdir /var/run/sshd
#RUN echo 'root:mean22' | chpasswd
#SSHD
install(){
sudo  apt-get install -y openssh-server

}

config1(){
sudo mkdir -p /var/run/sshd 

sudo su root <<START
echo 'root:root' | sudo tee chpasswd
sudo sed -i "s/session.*required.*pam_loginuid.so/#session    required     pam_loginuid.so/" /etc/pam.d/sshd
sudo sed -i "s/PermitRootLogin without-password/#PermitRootLogin without-password/" /etc/ssh/sshd_config
START
}

test(){
  netstat -ntlp | grep sshd
}

commander $@
