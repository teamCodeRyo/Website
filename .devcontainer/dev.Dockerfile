FROM node:20.10.0-buster-slim

RUN apt-get update && apt install vim bash-completion git-flow bmon curl wget -y

RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

COPY ./package.json ./package.json

RUN npm install 
RUN rm ./package.json
COPY .devcontainer/.bashrc /
ENV NODE_OPTIONS --openssl-legacy-provider
RUN echo "source /.bashrc" >> ~/.profile
RUN echo "source /.bashrc" >> ~/.bashrc
CMD ["bash","-l"]