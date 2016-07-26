#!/bin/bash -xe

readonly HOST=$1

vagrant up $HOST --provider=digital_ocean
rake itamae:$HOST
rake spec:$HOST
