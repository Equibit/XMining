# use Ubuntu base image
FROM ubuntu:16.04

# install packages needed for the build environment
RUN apt-get update && apt-get install -y autoconf
RUN apt-get update && apt-get install -y libtool
RUN apt-get update && apt-get install -y g++
RUN apt-get update && apt-get install -y pkg-config
RUN apt-get update && apt-get install -y git
RUN apt-get update && apt-get install -y uthash-dev
RUN apt-get update && apt-get install -y libjansson-dev
RUN apt-get update && apt-get install -y libevent-dev
RUN apt-get update && apt-get install -y libcurl4-gnutls-dev
RUN apt-get clean
