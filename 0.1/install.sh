cd /tmp
wget https://dl.google.com/go/go1.4-bootstrap-20171003.tar.gz
tar -zxvf go1.4-bootstrap-20171003.tar.gz
cd go/src
./make.bash
mv /tmp/go /root/go1.4

cd /tmp
wget https://dl.google.com/go/go1.10.3.linux-amd64.tar.gz
tar -zxvf go1.10.3.linux-amd64.tar.gz
cd go/src
./all.bash

rm -rf /usr/local/go
mv /tmp/go /usr/local/go
cp /usr/local/go/bin/go /usr/bin/
mkdir /mnt/go_path
echo "export GOPATH=/mnt/go_path" >> /etc/profile 
echo "export GOROOT=/usr/local/go" >> /etc/profile 
source /etc/profile

cd /tmp
wget https://npm.taobao.org/mirrors/node/v10.8.0/node-v10.8.0.tar.gz
tar xzvf node-v10.8.0.tar.gz
cd node-v10.8.0
./configure
make && make install

go get -u github.com/hyperledger/fabric-samples
cd $GOPATH/src/github.com/hyperledger/fabric-samples
./scripts/bootstrap.sh

go get -u github.com/hyperledger/fabric-ca
cd $GOPATH/src/github.com/hyperledger/fabric-ca
make fabric-ca-server
make fabric-ca-client
cp bin/fabric-ca-client /usr/bin/
cp bin/fabric-ca-server /usr/bin/
