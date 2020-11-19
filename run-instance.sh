#!/bin/bash

set -e

CLOUD_IMAGE=$1

if [ -z "$CLOUD_IMAGE" ]; then
	echo "Usage:"
	echo "	$./run-instance.sh image.img"
	exit 1
fi

# genisoimage \
#         -quiet \
# 	-input-charset utf-8 \
# 	-output cloudinit.iso \
# 	-volid cidata \
# 	-joliet \
# 	-rock \
# 	ci-provision

qemu-system-x86_64 \
    -nographic \
    -enable-kvm \
    -m 2048 \
    -cpu max \
    -net nic,model=virtio \
    -net user,hostfwd=tcp::2222-:22,hostfwd=tcp::8085-:443 \
    $CLOUD_IMAGE
