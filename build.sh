# cd ~ && git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
# export PATH=~/depot_tools:$PATH && mkdir ~/chromium 
#export PATH=~/depot_tools:$PATH && cd ~/chromium && update_depot_tools && fetch --nohooks android
export PATH=~/depot_tools:$PATH && cd ~/chromium && gclient sync
export PATH=~/depot_tools:$PATH && cd ~/chromium/src/ build/install-build-deps.sh --android
#RUN export PATH=/depot_tools:$PATH && cd ~/chromium/ && gclient runhooks
#RUN apt install vim pkg-config -y
#RUN export PATH=/depot_tools:$PATH && cd ~/chromium/src && gn args out/Default
#RUN export PATH=/depot_tools:$PATH && cd ~/chromium/src && gn gen out/Default --args="is_debug=false target_os=\"android\" target_cpu=\"arm64\""
#RUN export PATH=/depot_tools:$PATH && cd ~/chromium/src && autoninja -C out/Default chrome_public_apk
# out/Default/bin/chrome_public_apk install