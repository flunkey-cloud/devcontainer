#!/usr/bin/bash
date
echo "Running as $(whoami)"
[ -z "${AZ_READ_TOKEN}" ] && echo "AZ_READ_TOKEN is not set -> go modules will not downloaded"
echo "machine dev.azure.com login pat password ${AZ_READ_TOKEN}" > ~/.netrc

git config --global commit.gpgsign true
fingerprint=$(gpg --list-secret-keys --keyid-format LONG  | head -n-3 | tail -n-1 | tr -d '[:blank:]')
echo "$fingerprint"
git config --global user.signingkey "${fingerprint}"

sudo chown "${USERNAME}":"${USERNAME}" -R /home/"${USERNAME}"

ls -lah /
ls -lah "${LOCAL_WORKSPACE_FOLDER}"

[ ! -d /home/"${USERNAME}"/.ssh ] && mkdir /home/"${USERNAME}"/.ssh
ssh-keyscan ssh.dev.azure.com >> /home/"${USERNAME}"/.ssh/known_hosts

[ ! -d ./havdb-bgz ] && git clone git@ssh.dev.azure.com:v3/havdb-labor/havdb/havdb-bgz "${LOCAL_WORKSPACE_FOLDER}/havdb-bgz"
[ ! -d ./havdb-bgz-openshift ] && git clone git@ssh.dev.azure.com:v3/havdb-labor/havdb/eplf-einnahmeplattform-tests "${LOCAL_WORKSPACE_FOLDER}/havdb-bgz-openshift"
[ ! -d ./havdb-bgz-openshift ] && git clone git@ssh.dev.azure.com:v3/havdb-labor/havdb/havdb-bgz-openshift "${LOCAL_WORKSPACE_FOLDER}/havdb-bgz-openshift"
[ ! -d ./havdb-einnahmeplattform-openshift ] && git clone git@ssh.dev.azure.com:v3/havdb-labor/havdb/havdb-einnahmeplattform-openshift "${LOCAL_WORKSPACE_FOLDER}/havdb-einnahmeplattform-openshift"
[ ! -d ./havdb-commons-go-datum ] && git clone git@ssh.dev.azure.com:v3/havdb-labor/havdb/havdb-commons-go-datum "${LOCAL_WORKSPACE_FOLDER}/havdb-commons-go-datum"
[ ! -d ./havdb-commons-go-kafka ] && git clone git@ssh.dev.azure.com:v3/havdb-labor/havdb/havdb-commons-go-kafka "${LOCAL_WORKSPACE_FOLDER}/havdb-commons-go-kafka"
[ ! -d ./havdb-commons-go-tx ] && git clone git@ssh.dev.azure.com:v3/havdb-labor/havdb/havdb-commons-go-tx "${LOCAL_WORKSPACE_FOLDER}/havdb-commons-go-tx"
[ ! -d ./havdb-tx-io-box ] && git clone git@ssh.dev.azure.com:v3/havdb-labor/havdb/havdb-tx-io-box "${LOCAL_WORKSPACE_FOLDER}/havdb-tx-io-box"
[ ! -d ./eplf-deployments ] && git clone git@ssh.dev.azure.com:v3/havdb-labor/havdb/eplf-deployments "${LOCAL_WORKSPACE_FOLDER}/eplf-deployments"
