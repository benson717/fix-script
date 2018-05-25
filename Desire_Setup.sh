#/bin/bash
cd ~
echo "****************************************************************************"
echo "* This script will install and configure your Desire Coin masternodes.       *"
echo "*                                     *"
echo "*    If you have any issues please ask for help on the Desire discord.       *"
echo "*                      https://discordapp.com/invite/vTrbAZV                          *"
echo "*                      https://www.desire-crypto.com                             *"
echo "****************************************************************************"
echo "" 
echo ""
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "!                                                 !"
echo "! Make sure you double check before hitting enter !"
echo "!                                                 !"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo ""
echo ""
echo "Do you want to install all needed updates and firewall settings (no if you did it before)? [y/n]"
read DOSETUP
	if [[ $DOSETUP =~ "y" ]] || [[$DOSETUP =~ "Y" ]] ; then
	apt-get update;apt-get upgrade -y;apt-get dist-upgrade -y;apt-get install nano htop git -y;apt-get install build-essential libtool autotools-dev automake pkg-config -y;apt-get install libssl-dev libevent-dev bsdmainutils software-properties-common -y;apt-get install libboost-all-dev -y;apt-get install libzmq3-dev libminiupnpc-dev libssl-dev libevent-dev -y;add-apt-repository ppa:bitcoin/bitcoin -y;apt-get update;apt-get install libdb4.8-dev libdb4.8++-dev -y;
	sudo apt-get install -y ufw
	sudo ufw allow ssh/tcp
	sudo ufw limit ssh/tcp
	sudo ufw logging on
	sudo ufw allow 22
	echo "y" | sudo ufw enable
	sudo ufw status
fi

echo ""
wget https://github.com/lazyboozer/Desire/releases/download/Desire-v.0.12.2.2/desire-0.12.2.2-linux64.tar.gz
tar -xvzf desire-0.12.2.2-linux64.tar.gz
echo ""
echo "Configure your masternodes now!"
echo "Your recognised IP address is:"
sudo hostname -I 
echo "Is this the IP you wish to use for MasterNode ? [y/n] , followed by [ENTER]"
read IPDEFAULT
	if [[ $IPDEFAULT =~ "y" ]] || [[$IPDEFAULT =~ "Y" ]] ; then
	echo ""
	echo "We are using your default IP address"
	echo "Enter masternode private key for node, followed by [ENTER]: $ALIAS"
	read PRIVKEY
	CONF_DIR=~/.desirecore\/
	CONF_FILE=desire.conf
	PORT=9919
	IP=$(hostname -I)
	mkdir -p $CONF_DIR
	echo "rpcuser=user\n"`shuf -i 100000-10000000 -n 1` >> $CONF_DIR/$CONF_FILE
	echo "rpcpassword=passw\n"`shuf -i 100000-10000000 -n 1` >> $CONF_DIR/$CONF_FILE
	echo "rpcallowip=127.0.0.1\n" >> $CONF_DIR/$CONF_FILE
	echo "listen=1\n" >> $CONF_DIR/$CONF_FILE
	echo "server=1\n" >> $CONF_DIR/$CONF_FILE
	echo "daemon=1\n" >> $CONF_DIR/$CONF_FILE
	echo "logtimestamps=1\n" >> $CONF_DIR/$CONF_FILE
	echo "maxconnections=256\n" >> $CONF_DIR/$CONF_FILE
	echo "masternode=1\n" >> $CONF_DIR/$CONF_FILE
	echo "" >> $CONF_DIR/$CONF_FILE
	echo "" >> $CONF_DIR/$CONF_FILE
	echo "port=$PORT\n" >> $CONF_DIR/$CONF_FILE
	echo "masternodeaddr=$IP:$PORT\n" >> $CONF_DIR/$CONF_FILE
	echo "masternodeprivkey=$PRIVKEY\n" >> $CONF_DIR/$CONF_FILE
	./desired -daemon
	echo "if server start failure try ./desired -reindex"
	echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	echo "!                                                 !"
	echo "! Your MasterNode Is setup please close terminal  !"
	echo "!   and continue the local wallet setup guide     !"
	echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	echo ""
else	
	echo "Type the custom IP of this node, followed by [ENTER]:"
	read DIP
	echo ""
	echo "Enter masternode private key for node, followed by [ENTER]: $ALIAS"
	read PRIVKEY
	CONF_DIR=~/.desirecore\/
	CONF_FILE=desire.conf
	PORT=9919
	mkdir -p $CONF_DIR
	echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> $CONF_DIR/$CONF_FILE
	echo "rpcpassword=passw"`shuf -i 100000-10000000 -n 1` >> $CONF_DIR/$CONF_FILE
	echo "rpcallowip=127.0.0.1\n" >> $CONF_DIR/$CONF_FILE
	echo "listen=1\n" >> $CONF_DIR/$CONF_FILE
	echo "server=1\n" >> $CONF_DIR/$CONF_FILE
	echo "daemon=1\n" >> $CONF_DIR/$CONF_FILE
	echo "logtimestamps=1\n" >> $CONF_DIR/$CONF_FILE
	echo "maxconnections=256\n" >> $CONF_DIR/$CONF_FILE
	echo "masternode=1\n" >> $CONF_DIR/$CONF_FILE
	echo "" >> $CONF_DIR/$CONF_FILE
	echo "" >> $CONF_DIR/$CONF_FILE
	echo "port=$PORT\n" >> $CONF_DIR/$CONF_FILE
	echo "masternodeaddr=$DIP:$PORT\n" >> $CONF_DIR/$CONF_FILE
	echo "masternodeprivkey=$PRIVKEY\n" >> $CONF_DIR/$CONF_FILE
	./desired -daemon
	echo "if server start failure try ./desired -reindex"
	echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	echo "!                                                 !"
	echo "! Your MasterNode Is setup please close terminal  !"
	echo "!   and continue the local wallet setup guide     !"
	echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	echo ""
fi

