#!/bin/bash
export GOPATH=/go/gopath:/go/workspace/base/go:/go/workspace/oauth2/register
sudo rm -rf oauth_register
go build oauth_register.go
cp oauth_register /home/ubuntu/online/register/ -rf
cd /home/ubuntu/online/register/
sudo ./oauth_register stop
sudo ./oauth_register remove
sudo ./oauth_register install
sudo ./oauth_register start

