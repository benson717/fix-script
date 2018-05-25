<p align="center">
  <img src="https://i.imgur.com/s7rXj0A.png" width="100"/>
</p>

# <h>  Desire VPS Masternode Setup script. </h>

To run the script simply type the following commands into your VPS terminal. 
 
- wget https://github.com/lazyboozer/masternode_script/releases/download/v.1.0.0/DSRMNINSTALL.tar.gz

- tar -xvzf DSRMNINSTALL.tar.gz

- chmod 755 Desire_Setup.sh

- ./Desire_Setup.sh

<h1> Masternode Basic Requierments </h1>

- 1,000 DSR

- Main Computer with Desire wallet installed

- Masternode Server (Invite Link)

- Unique IP address for EACH masternode

<h1> Local Wallet Procedure </h1>

Step 1) Download, install and sync your Desire wallet
Download link for all Operating systems:
https://github.com/lazyboozer/Desire/releases 

Step 2) Using your main wallet, enter the debug console and type the following command:

- "masternode genkey"

- Please save this on a Notepad

Step 3) Using your main wallet, enter the debug console and type the following command:

- "getaccountaddress INSERT_MASTERNODE_NAME"

- Please save this on a Notepad

Step 4) Send 1,000 DSR to Step 3 address.

Step 5)  Using your main wallet, wait for 15 confirmations, and then enter the debug console and type the following command:

- "masternode outputs"
- Please save this on a Notepad 

Step 6) Locate your masternode.conf and add the following line: 

<INSERT_CHOOSEN_MASTERNODE_NAME> <Unique IP address>:9919 <MASTERNODE_GENKEY> <MASTERNODE_OUTPUT> <NUMBER_AFTER_MASTERNODE_OUTPUT_1_OR_0>

Note: Substitute it with your own values and without the “<>”s

Example:
MN1 85.236.130.103:9919 7rYFTajTtUA5rsdgjw4GeQyvjhp2aVnPzeyek5kkJYefzzvbiJX 624ea2357889c4f63gdc77b4b8f64360cdfb9b1a07d23ccb73716bd05feabb19 0


<h2> Run and follow the instructions on the script </h2> 
