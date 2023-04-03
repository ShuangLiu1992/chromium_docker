# syntax=docker/dockerfile:1
FROM ubuntu:22.04
RUN apt update
RUN apt install python3 curl wget git -y
RUN git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
RUN export PATH=/depot_tools:$PATH && mkdir ~/chromium && cd ~/chromium && update_depot_tools && fetch --nohooks android
RUN apt install xz-utils bzip2 -y
RUN export PATH=/depot_tools:$PATH && cd ~/chromium && gclient sync