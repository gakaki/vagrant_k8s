#! /bin/bash

 curl -sfL https://gh-proxy.com/https://raw.githubusercontent.com/labring/sealos/main/scripts/cloud/install.sh -o /tmp/install.sh && bash /tmp/install.sh \
  --image-registry=registry.cn-shanghai.aliyuncs.com --zh \
  --proxy-prefix=https://gh-proxy.com