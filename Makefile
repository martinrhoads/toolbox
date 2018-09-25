build: init ubuntu alpine

all: build push

init:
	cp ${HOME}/.zshrc files/zshrc
	rsync -a --delete ${HOME}/.oh-my-zsh/ files/oh-my-zsh/

ubuntu:
	docker build --pull --squash . -t martinrhoads/ubuntutool -f ubuntu.dkr

alpine:
	docker build --pull --squash . -t martinrhoads/alpinetool -f alpine.dkr

push: push-ubuntu push-alpine

push-ubuntu:
	docker push martinrhoads/ubuntutool
push-alpine:
	docker push martinrhoads/alpinetool
