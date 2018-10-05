build: init ubuntu alpine

all: push-git build push-images

init:
	cp ${HOME}/.tmux.conf files/tmux.conf
	cp ${HOME}/.zshrc     files/zshrc
	rsync -a --delete ${HOME}/.oh-my-zsh/ files/oh-my-zsh/

ubuntu:
	docker build --pull . -t martinrhoads/ubuntubase -f ubuntu.dkr
	docker build --build-arg BASE_IMAGE=martinrhoads/ubuntubase . -t martinrhoads/ubuntutool -f tool.dkr
alpine:
	docker build --pull . -t martinrhoads/alpinebase -f alpine.dkr
	docker build --build-arg BASE_IMAGE=martinrhoads/alpinebase . -t martinrhoads/alpinetool -f tool.dkr

push-git:
	git push origin master
push-images: push-ubuntu push-alpine
push-ubuntu:
	docker push martinrhoads/ubuntutool
push-alpine:
	docker push martinrhoads/alpinetool
