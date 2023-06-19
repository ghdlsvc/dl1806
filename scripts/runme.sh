#!/bin/bash
echo -e "===================="
echo -e "  Get Last Files of 18.06 Firmware"
echo -e "  of HelmiWrt OS Releases"
echo -e "===================="

anu="$GITHUB_WORKSPACE/helmiwrt18"
curl -s "https://api.github.com/repos/ghdlsvc/dl21/releases" | grep helmiwrt-18.06-k5.4-"${1}" |  sed 's|[: \":]||g' | awk -F 'browser_download_url' '{print$2}' | sed '/^[[:space:]]*$/d' > ${anu}
mkdir $GITHUB_WORKSPACE/maknyus
cd $GITHUB_WORKSPACE/maknyus
wget -i ${anu}

[ -f ${anu} ] && rm -f ${anu}
