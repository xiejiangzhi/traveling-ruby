#!/bin/bash
set -e

function create_user()
{
	local name="$1"
	local full_name="$2"
	local id="$3"
	create_group $name $id
	if ! grep -q "^$name:" /etc/passwd; then
		adduser --uid $id --gid $id --comment "$full_name" $name
	fi
	usermod -L $name
}

function create_group()
{
	local name="$1"
	local id="$2"
	if ! grep -q "^$name:" /etc/group >/dev/null; then
		groupadd --gid $id $name
	fi
}

set -x

cd /tmp
yum update -y
yum install -y --enablerepo centosplus \
	centos-release-SCL file db4-utils compat-db43 mock wget epel-release
create_user app "App" 1000
usermod -a -G mock app
mkdir -p /etc/container_environment /etc/workaround-docker-2267
ln -s /etc/workaround-docker-2267 /cte
rm -rf /image /tmp/*
yum clean all
