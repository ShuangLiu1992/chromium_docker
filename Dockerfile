# syntax=docker/dockerfile:1
FROM ubuntu:22.04
RUN apt update
RUN apt install python3 curl wget git -y
RUN git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
RUN export PATH=/depot_tools:$PATH && mkdir ~/chromium && cd ~/chromium && update_depot_tools && fetch --nohooks android
RUN apt install xz-utils bzip2 -y
RUN export PATH=/depot_tools:$PATH && cd ~/chromium && gclient sync
RUN export PATH=/depot_tools:$PATH && cd ~/chromium/src/ build/install-build-deps.sh --android
RUN export PATH=/depot_tools:$PATH && cd ~/chromium/ && gclient runhooks
RUN apt install vim pkg-config -y
#RUN export PATH=/depot_tools:$PATH && cd ~/chromium/src && gn args out/Default
RUN export PATH=/depot_tools:$PATH && cd ~/chromium/src && gn gen out/Default --args='target_os="android" target_cpu="arm" is_debug=false' 
RUN export PATH=/depot_tools:$PATH && cd ~/chromium/src && autoninja -C out/Default chrome_public_apk
# out/Default/bin/chrome_public_apk install