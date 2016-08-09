#!/usr/bin/env bash

CURRENT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# make sure we are not in git
if [[ -d ${CURRENT_PATH}/../.git ]];
then
    echo "You are currently in a git repository, self-update is only for projects other then deploy plugin"
    exit 1
fi


git clone -b master --single-branch ssh://git@source.youwe.nl:7999/pimb2b/deployment.git /tmp/pimcore-deployment
rm /tmp/pimcore-deployment/.git
mv /tmp/pimcore-deployment ${CURRENT_PATH}/../../Deployment
echo "Update complete"