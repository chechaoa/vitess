#!/usr/bin/env bash
#
# See http://vitess.io/getting-started/local-instance.html#manual-build
# for more info
#
set -ex

ulimit -n 10000
export MYSQL_FLAVOR=MySQL56
export VT_MYSQL_ROOT=/usr

printf "\nBuilding Vitess...\n"

# This is just to make sure the vm can write into these directories
sudo chown `whoami`:`whoami` /vagrant
sudo chown `whoami`:`whoami` /vagrant/src
cd "$VITESS_WORKSPACE"
./bootstrap.sh
# shellcheck disable=SC1091
source dev.env
make build

printf "\Build completed\n\n."
