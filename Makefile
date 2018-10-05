build: init ubuntu alpine

all: push-git build push-images

init:
	cp ${HOME}/.zshrc files/zshrc
	rsync -a --delete ${HOME}/.oh-my-zsh/ files/oh-my-zsh/

build_opts = docker build --pull . -t
ubuntu:
	$(build_opts) martinrhoads/ubuntutool -f ubuntu.dkr
alpine:
	$(build_opts) martinrhoads/alpinetool -f alpine.dkr

push-git:
	git push origin master
push-images: push-ubuntu push-alpine
push-ubuntu:
	docker push martinrhoads/ubuntutool
push-alpine:
	docker push martinrhoads/alpinetool
