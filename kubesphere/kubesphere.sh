#! /bin/bash

export KKZONE=cn.
curl -sfL https://get-kk.kubesphere.io | VERSION=v3.0.13 sh -
./kk create cluster --with-kubernetes v1.22.12 --with-kubesphere v3.3.2

