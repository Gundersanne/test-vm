#!/bin/bash

set -e

scp -F ssh/config images/rpms/*.rpm vm:~
ssh -F ssh/config vm sudo dnf --assumeyes localinstall /home/vm-user/*.rpm
# ssh -F ssh/config vm sudo systemctl enable --now osbuild-composer.socket
ssh -F ssh/config vm sudo systemctl enable --now osbuild-composer-cloud.socket
