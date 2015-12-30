FROM stackbrew/ubuntu:14.04
RUN apt-get update
RUN apt-get install -y \
    emacs24-nox\
    tmux\
