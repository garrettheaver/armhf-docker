#! /bin/sh

ARCH=`uname -m`
git config --global user.name "Build ($ARCH)"
git config --global user.name "build@$ARCH.localhost"

cd /home/build \
  && git clone --depth 1 git://git.alpinelinux.org/aports \
  && cd aports

sudo mkdir -p /var/cache/distfiles \
  && sudo chmod a+w /var/cache/distfiles

printf "\n" | abuild-keygen -a -i

cd $1 \
  && abuild checksum \
  && abuild -R \
  && cd /home/build/packages

aws s3 cp . s3://daft.cluster/apk \
  --exclude "*" --include "*.apk" \
  --recursive --acl public-read

