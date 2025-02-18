
FROM gitpod/workspace-full:latest

USER root
RUN apt-get update && apt-get install -y redis-server mc

#prepare for gitpod nodejs env
ADD install_node.sh /tmp/install_node.sh
RUN sudo bash /tmp/install_node.sh


#install node & rmb 
ADD install_v_rmb.sh /tmp/install_v_rmb.sh
RUN sudo bash /tmp/install_v_rmb.sh


# install tfgrid-substrate

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && sudo apt update && sudo apt install -y yarn

RUN sudo git clone https://github.com/threefoldtech/tfgrid-substrate.git && cd tfgrid-substrate/cli-tool && sudo yarn
