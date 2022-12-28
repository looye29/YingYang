#!/bin/bash
# Install script for Sn1per CE
# Created by @xer0dayz - https://sn1persecurity.com

OKBLUE='\033[94m'
OKRED='\033[91m'
OKGREEN='\033[92m'
OKORANGE='\033[93m'
RESET='\e[0m'

echo -e "$OKRED                ____               $RESET"
echo -e "$OKRED    _________  /  _/___  ___  _____$RESET"
echo -e "$OKRED   / ___/ __ \ / // __ \/ _ \/ ___/$RESET"
echo -e "$OKRED  (__  ) / / // // /_/ /  __/ /    $RESET"
echo -e "$OKRED /____/_/ /_/___/ .___/\___/_/     $RESET"
echo -e "$OKRED               /_/                 $RESET"
echo -e "$RESET"
echo -e "$OKORANGE + -- --=[ https://sn1persecurity.com $RESET"
echo -e "$OKORANGE + -- --=[ Sn1per CE by @xer0dayz $RESET"
echo ""

INSTALL_DIR=/usr/share/sniper
LOOT_DIR=/usr/share/sniper/loot
PLUGINS_DIR=/usr/share/sniper/plugins
GO_DIR=~/go/bin

echo -e "$OKRED[>]$RESET This script will install Sn1per under $INSTALL_DIR. Are you sure you want to continue? (Hit Ctrl+C to exit)$RESET"
if [[ "$1" != "force" ]]; then
	read answer
fi

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

mkdir -p $INSTALL_DIR 2> /dev/null
chmod 755 -Rf $INSTALL_DIR 2> /dev/null
chown root $INSTALL_DIR/sniper 2> /dev/null
mkdir -p $LOOT_DIR 2> /dev/null
mkdir $LOOT_DIR/domains 2> /dev/null
mkdir $LOOT_DIR/screenshots 2> /dev/null
mkdir $LOOT_DIR/nmap 2> /dev/null
mkdir $LOOT_DIR/reports 2> /dev/null
mkdir $LOOT_DIR/output 2> /dev/null
mkdir $LOOT_DIR/osint 2> /dev/null
cp -Rf * $INSTALL_DIR 2> /dev/null
cd $INSTALL_DIR

sudo cp -a /root/.Xauthority /root/.Xauthority.bak 2> /dev/null
sudo cp -a /home/$USER/.Xauthority /root/.Xauthority 2> /dev/null
sudo cp -a /home/kali/.Xauthority /root/.Xauthority 2> /dev/null
sudo chown root: /root/.Xauthority 2> /dev/null
XAUTHORITY=/root/.Xauthority

# CHECK FOR UBUNTU...
UBUNTU_CHECK=$(egrep DISTRIB_ID /etc/lsb-release 2> /dev/null)
if [[ $UBUNTU_CHECK == "DISTRIB_ID=Ubuntu" ]]; then
	cp /root/.Xauthority /root/.Xauthority.bak 2> /dev/null
	cp -a /run/user/1000/gdm/Xauthority /root/.Xauthority 2> /dev/null
	cp -a /home/user/.Xauthority /root/.Xauthority 2> /dev/null
	chown root /root/.Xauthority 2> /dev/null
	XAUTHORITY=/root/.Xauthority 2> /dev/null
	snap install chromium 2> /dev/null
	ln -s /snap/bin/chromium /usr/bin/chromium 2> /dev/null
	xhost + 2> /dev/null
	mkdir -p /run/user/0 2> /dev/null
	add-apt-repository ppa:longsleep/golang-backports
	sudo apt update
	apt install golang
fi

echo -e "$OKBLUE[*]$RESET Installing apt packages...$RESET"
apt-get update
apt-get install -y python3-paramiko
apt-get install -y nfs-common
apt-get install -y nodejs
apt-get install -y wafw00f
apt-get install -y xdg-utils
apt-get install -y ruby
apt-get install -y rubygems
apt-get install -y python
apt-get install -y dos2unix
apt-get install -y aha
apt-get install -y libxml2-utils
apt-get install -y rpcbind
apt-get install -y cutycapt
apt-get install -y host
apt-get install -y whois
apt-get install -y dnsrecon
apt-get install -y curl
apt-get install -y lsb-release 
apt-get install -y apt-transport-https
apt-get install -y ca-certificates 
apt-get install -y jq
apt-get install -y golang
apt-get install -y adb
apt-get install -y xsltproc
apt-get install -y ldapscripts
apt-get install -y libssl-dev 
apt-get install -y python-pip
apt-get install -y python3-pip
apt-get install -y xmlstarlet
apt-get install -y net-tools
apt-get install -y p7zip-full
apt-get install -y jsbeautifier
apt-get install -y phantomjs
apt-get install -y chromium
apt-get install -y xvfb
apt-get install -y iputils-ping
apt-get install -y enum4linux
apt-get install -y dnsutils
apt-get install -y maltego
echo -e "$OKGREEN[*]$RESET Done! $RESET"
echo -e "$OKBLUE[*]$RESET Installing PHP 7.4...$RESET"
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ bullseye main" | sudo tee /etc/apt/sources.list.d/php.list
apt update
apt-get install -y php7.4
apt-get install -y php7.4-curl
wget http://ftp.us.debian.org/debian/pool/main/libf/libffi/libffi7_3.3-6_amd64.deb
dpkg -i libffi7_3.3-6_amd64.deb
echo -e "$OKGREEN[*]$RESET Done! $RESET"
echo -e "$OKBLUE[*]$RESET Installing PIP packages...$RESET"
pip3 install dnspython
pip3 install colorama
pip3 install tldextract
pip3 install urllib3
pip3 install ipaddress
pip3 install requests
pip3 install argparse
pip3 install termcolor
pip3 install Click
echo -e "$OKGREEN[*]$RESET Done! $RESET"
echo -e "$OKBLUE[*]$RESET Installing Metasploit...$RESET"
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > /tmp/msfinstall
chmod 755 /tmp/msfinstall
/tmp/msfinstall
msfdb init 2> /dev/null
echo -e "$OKGREEN[*]$RESET Done! $RESET"
echo -e "$OKBLUE[*]$RESET Installing NVM...$RESET"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
echo -e "$OKGREEN[*]$RESET Done! $RESET"
echo -e "$OKBLUE[*]$RESET Installing Ruby gem dependencies...$RESET"
gem install rake 2> /dev/null > /dev/null
gem install ruby-nmap 2> /dev/null > /dev/null
gem install net-http-persistent 2> /dev/null > /dev/null
gem install mechanize 2> /dev/null > /dev/null
gem install text-table 2> /dev/null > /dev/null
gem install public_suffix 2> /dev/null > /dev/null
echo -e "$OKGREEN[*]$RESET Done! $RESET"
echo -e "$OKBLUE[*]$RESET Setting up Ruby...$RESET"
dpkg-reconfigure ruby
echo -e "$OKGREEN[*]$RESET Done! $RESET"
echo -e "$OKBLUE[*]$RESET Upgrading PIP...$RESET"
python3 -m pip3 install --upgrade pip
echo -e "$OKGREEN[*]$RESET Done! $RESET"
echo -e "$OKBLUE[*]$RESET Cleaning up old extensions...$RESET"
rm -Rf $PLUGINS_DIR 2> /dev/null
mkdir $PLUGINS_DIR 2> /dev/null
cd $PLUGINS_DIR
mkdir -p $GO_DIR 2> /dev/null
echo -e "$OKGREEN[*]$RESET Done! $RESET"
echo -e "$OKBLUE[*]$RESET Downloading extensions...$RESET"
# SUBLIST3R INSTALLER
cd $PLUGINS_DIR
echo -e "$OKBLUE[*]$RESET Installing Sublist3r...$RESET"
pip3 install git+https://github.com/1N3/Sublist3r.git
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# SHOCKER INSTALLER
echo -e "$OKBLUE[*]$RESET Installing Shocker...$RESET"
cd $PLUGINS_DIR
git clone https://github.com/nccgroup/shocker.git
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# SSH-AUDIT INSTALLER
cd $PLUGINS_DIR
echo -e "$OKBLUE[*]$RESET Installing SSH-Audit...$RESET"
git clone https://github.com/arthepsy/ssh-audit
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# JEXBOSS INSTALLER
cd $PLUGINS_DIR
echo -e "$OKBLUE[*]$RESET Installing Jexboss...$RESET"
git clone https://github.com/1N3/jexboss.git
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# WIG INSTALLER
cd $PLUGINS_DIR
echo -e "$OKBLUE[*]$RESET Installing Wig...$RESET"
pip3 install git+https://github.com/jekyc/wig.git
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# CORSTEST INSTALLER
cd $PLUGINS_DIR
echo -e "$OKBLUE[*]$RESET Installing CORStest...$RESET"
git clone https://github.com/RUB-NDS/CORStest.git
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# VULSCAN INSTALLER
cd $PLUGINS_DIR
echo -e "$OKBLUE[*]$RESET Installing Vulscan...$RESET"
git clone https://github.com/scipag/vulscan
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# METAGOOFIL INSTALLER
cd $PLUGINS_DIR
echo -e "$OKBLUE[*]$RESET Installing Metagoofil...$RESET"
git clone https://github.com/laramies/metagoofil.git
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# SMUGGLER INSTALLER
cd $PLUGINS_DIR
echo -e "$OKBLUE[*]$RESET Installing Smuggler...$RESET"
git clone https://github.com/defparam/smuggler.git
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# DIRSEARCH INSTALLER
cd $PLUGINS_DIR
echo -e "$OKBLUE[*]$RESET Installing Dirsearch...$RESET"
pip3 install git+https://github.com/maurosoria/dirsearch.git
rm -f /usr/bin/dirsearch
ln -s $PLUGINS_DIR/dirsearch/dirsearch.py /usr/bin/dirsearch 2> /dev/null
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# SECRETFINDER INSTALLER
cd $PLUGINS_DIR
echo -e "$OKBLUE[*]$RESET Installing SecretFinder...$RESET"
pip3 install git+https://github.com/m4ll0k/SecretFinder.git
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# LINKFINDER INSTALLER
cd $PLUGINS_DIR
echo -e "$OKBLUE[*]$RESET Installing LinkFinder...$RESET"
pip3 install git+https://github.com/1N3/LinkFinder.git
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# GITGRABER INSTALLER
cd $PLUGINS_DIR
echo -e "$OKBLUE[*]$RESET Installing GitGrabber...$RESET"
git clone https://github.com/hisxo/gitGraber.git
pip3 install -r $PLUGINS_DIR/gitGraber/requirements.txt 2> /dev/null
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# SUBDOMAIN-FINDER INSTALLER
cd $PLUGINS_DIR
echo -e "$OKBLUE[*]$RESET Installing Subdomain-Finder...$RESET"
git clone https://github.com/christophetd/censys-subdomain-finder.git
pip3 install -r $PLUGINS_DIR/censys-subdomain-finder/requirements.txt
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# DNSCAN INSTALLER
cd $PLUGINS_DIR
echo -e "$OKBLUE[*]$RESET Installing DNScan...$RESET"
git clone https://github.com/rbsec/dnscan.git
pip3 install -r $PLUGINS_DIR/dnscan/requirements.txt
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# ALTDNS INSTALLER
cd $PLUGINS_DIR
echo -e "$OKBLUE[*]$RESET Installing AltDNS...$RESET"
git clone https://github.com/infosec-au/altdns.git
cd altdns
pip3 install -r requirements.txt
python3 setup.py install
pip3 install py-altdns
cd ..
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# MASSDNS INSTALLER
cd $PLUGINS_DIR
echo -e "$OKBLUE[*]$RESET Installing MassDNS...$RESET"
git clone https://github.com/blechschmidt/massdns.git
cd massdns
make && make install
cd ..
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# DNSGEN INSTALLER
cd $PLUGINS_DIR
echo -e "$OKBLUE[*]$RESET Installing DNSGen...$RESET"
git clone https://github.com/ProjectAnte/dnsgen
cd dnsgen
pip3 install -r requirements.txt
python3 setup.py install
cd ..
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# NUCLEI INSTALLER
echo -e "$OKBLUE[*]$RESET Installing Nuclei...$RESET"
GO111MODULE=on go install github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
ln -fs /root/go/bin/nuclei /usr/local/bin/nuclei 2> /dev/null
nuclei --update
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# WEBTECH INSTALL
cd $PLUGINS_DIR
echo -e "$OKBLUE[*]$RESET Installing WebTech...$RESET"
pip3 install -U webtech
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# SUBJACK INSTALL
echo -e "$OKBLUE[*]$RESET Installing SubJack...$RESET"
cd ~/go/bin/
go install github.com/haccer/subjack@latest
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# SUBOVER INSTALL
echo -e "$OKBLUE[*]$RESET Installing SubOver...$RESET"
cd ~/go/bin/
go install github.com/Ice3man543/SubOver@latest
mv /root/go/bin/SubOver /usr/local/bin/subover
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# FPROBE INSTALL
echo -e "$OKBLUE[*]$RESET Installing FProbe...$RESET"
cd ~/go/bin/
go install github.com/theblackturtle/fprobe@latest
ln -fs ~/go/bin/fprobe /usr/bin/fprobe
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# ASNIP INSTALL
echo -e "$OKBLUE[*]$RESET Installing ASnip...$RESET"
cd ~/go/bin/
go install github.com/harleo/asnip@latest
ln -fs ~/go/bin/asnip /usr/bin/asnip
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# GAU INSTALLER
echo -e "$OKBLUE[*]$RESET Installing GAU...$RESET"
GO111MODULE=on go get github.com/lc/gau@latest
rm -f /usr/bin/gau 2> /dev/null
ln -fs /root/go/bin/gau /usr/bin/gau 2> /dev/null
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# HTTPX INSTALL
echo -e "$OKBLUE[*]$RESET Installing HTTPX...$RESET"
cd ~/go/bin/
go install github.com/projectdiscovery/httpx@latest
ln -fs /root/go/bin/httpx /usr/bin/httpx
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# GITHUB-ENDPOINTS INSTALLER
echo -e "$OKBLUE[*]$RESET Installing Github-Endpoints...$RESET"
cd ~/go/bin/
go install github.com/gwen001/github-endpoints@latest
ln -fs /root/go/bin/github-endpoints /usr/bin/github-endpoints
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# PUREDNS INSTALLER
echo -e "$OKBLUE[*]$RESET Installing PureDNS...$RESET"
cd ~/go/bin/
go install github.com/d3mondev/puredns/v2@latest
ln -fs /root/go/bin/puredns /usr/bin/puredns
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# AMASS INSTALLER
echo -e "$OKBLUE[*]$RESET Installing AMass...$RESET"
cd ~/go/bin/
go install -v github.com/OWASP/Amass/v3/...@master
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# SUBFINDER INSTALLER
echo -e "$OKBLUE[*]$RESET Installing SubFinder...$RESET"
cd ~/go/bin/
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
ln -fs /root/go/bin/subfinder /usr/local/bin/subfinder
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# DIRDAR INSTALLER
echo -e "$OKBLUE[*]$RESET Installing DirDar...$RESET"
cd ~/go/bin/
go install github.com/1N3/dirdar@latest
ln -fs /root/go/bin/dirdar /usr/local/bin/dirdar
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# VULNERS NMAP INSTALLER
echo -e "$OKBLUE[*]$RESET Installing Vulners...$RESET"
cd /usr/share/nmap/scripts/
rm -f /usr/share/nmap/scripts/vulners.nse
wget https://raw.githubusercontent.com/vulnersCom/nmap-vulners/master/vulners.nse
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# GOBUSTER INSTALLER
echo -e "$OKBLUE[*]$RESET Installing GoBuster...$RESET"
cd ~/go/bin/
go install github.com/OJ/gobuster/v3@latest
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# SHODAN INSTALLER
echo -e "$OKBLUE[*]$RESET Installing Shodan...$RESET"
cd $PLUGINS_DIR
pip3 install git+https://github.com/achillean/shodan-python
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# H8MAIL INSTALLER
echo -e "$OKBLUE[*]$RESET Installing H8Mail...$RESET"
pip3 install h8mail 2> /dev/null
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# CMSMAP INSTALLER
echo -e "$OKBLUE[*]$RESET Installing CMSMap...$RESET"
cd $PLUGINS_DIR
pip3 install git+https://github.com/Dionach/CMSmap.git
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# ARACHNI MANUAL INSTALL
echo -e "$OKBLUE[*]$RESET Installing Arachni...$RESET"
wget https://github.com/Arachni/arachni/releases/download/v1.5.1/arachni-1.5.1-0.5.12-linux-x86_64.tar.gz -O /tmp/arachni.tar.gz
cd /tmp/
tar -zxf arachni.tar.gz
rm -f /tmp/arachni.tar.gz 2> /dev/null
cd arachni-*
mkdir -p /usr/share/arachni 2> /dev/null
cp -Rf * /usr/share/arachni/ 2> /dev/null
cd /usr/share/arachni/bin/
for a in `ls`; do ln -fs $PWD/$a /usr/bin/$a; done;
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# REMOVE CVE TEMPLATES (ALL CVEs GOING FORWARD COVERED BY NUCLEI)
echo -e "$OKBLUE[*]$RESET Remove CVE templates (All CVEs going forward covered by Nuclei) ...$RESET"
rm -f /usr/share/sniper/templates/active/CVE*
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# PHANTOMJS MANUAL INSTALL
echo -e "$OKBLUE[*]$RESET Installing PhantomJS...$RESET"
cd /usr/local/share
wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 2> /dev/null
tar xjf phantomjs-2.1.1-linux-x86_64.tar.bz2 2> /dev/null
ln -s /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/share/phantomjs 2> /dev/null
ln -s /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs 2> /dev/null
ln -s /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/bin/phantomjs 2> /dev/null
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# DNS RESOLVERS DOWNLOAD
echo -e "$OKBLUE[*]$RESET Installing DNS Resolvers...$RESET"
wget https://raw.githubusercontent.com/janmasarik/resolvers/master/resolvers.txt -O /usr/share/sniper/wordlists/resolvers.txt
# BLACKWIDOW INSTALLER
echo -e "$OKBLUE[*]$RESET Installing BlackWidow...$RESET"
cd $PLUGINS_DIR
git clone https://github.com/1N3/BlackWidow
cd $PLUGINS_DIR/BlackWidow/ && bash install.sh force 2> /dev/null
cp -f $PLUGINS_DIR/BlackWidow/blackwidow.desktop /usr/share/applications/ 2> /dev/null
cp -f $PLUGINS_DIR/BlackWidow/blackwidow.desktop /usr/share/applications/blackwidow.desktop 2> /dev/null
cp -f $PLUGINS_DIR/BlackWidow/blackwidow.desktop /usr/share/kali-menu/applications/blackwidow.desktop 2> /dev/null
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# BRUTEX INSTALLER
cd $PLUGINS_DIR
echo -e "$OKBLUE[*]$RESET Installing BruteX...$RESET"
git clone https://github.com/1N3/BruteX.git
cd $PLUGINS_DIR/BruteX/ && bash install.sh 2> /dev/null
cp -f $PLUGINS_DIR/BruteX/brutex.desktop /usr/share/applications/ 2> /dev/null
cp -f $PLUGINS_DIR/BruteX/brutex.desktop /usr/share/applications/brutex.desktop 2> /dev/null
cp -f $PLUGINS_DIR/BruteX/brutex.desktop /usr/share/kali-menu/applications/brutex.desktop 2> /dev/null
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# FINDSPLOIT INSTALLER
cd $PLUGINS_DIR
echo -e "$OKBLUE[*]$RESET Installing FindSploit...$RESET"
git clone https://github.com/1N3/Findsploit.git
cd $PLUGINS_DIR/Findsploit/ && bash install.sh 2> /dev/null
cp -f $PLUGINS_DIR/Findsploit/findsploit.desktop /usr/share/applications/ 2> /dev/null
cp -f $PLUGINS_DIR/Findsploit/findsploit.desktop /usr/share/applications/findsploit.desktop 2> /dev/null
cp -f $PLUGINS_DIR/Findsploit/findsploit.desktop /usr/share/kali-menu/applications/findsploit.desktop 2> /dev/null
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# GOOHAK INSTALLER
cd $PLUGINS_DIR
echo -e "$OKBLUE[*]$RESET Installing GooHak...$RESET"
pip3 install git+https://github.com/1N3/Goohak.git
chmod +x $PLUGINS_DIR/Goohak/goohak
ln -s $PLUGINS_DIR/Goohak/goohak /usr/bin/goohak 2> /dev/null
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# ARJUN INSTALLER
cd $PLUGINS_DIR
echo -e "$OKBLUE[*]$RESET Installing Arjun...$RESET"
pip3 install git+https://github.com/s0md3v/Arjun.git
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# AssetFinder INSTALLER
echo -e "$OKBLUE[*]$RESET Installing AssetFinder...$RESET"
cd ~/go/bin/
go install github.com/tomnomnom/assetfinder
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# ByP4xx INSTALLER
cd $PLUGINS_DIR
echo -e "$OKBLUE[*]$RESET Installing ByP4xx...$RESET"
pip3 install git+https://github.com/lobuhi/byp4xx.git
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# Breacher INSTALLER
cd $PLUGINS_DIR
echo -e "$OKBLUE[*]$RESET Installing Breacher...$RESET"
git clone https://github.com/s0md3v/Breacher.git
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# Commix INSTALLER
cd $PLUGINS_DIR
echo -e "$OKBLUE[*]$RESET Installing Commix...$RESET"
git clone https://github.com/commixproject/commix.git commix
python commix.py -h
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# Dalfox INSTALLER
cd ~/go/bin/
echo -e "$OKBLUE[*]$RESET Installing Dalfox...$RESET"
go install github.com/hahwul/dalfox/v2@latest
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# Hakrawler INSTALLER
cd ~/go/bin/
echo -e "$OKBLUE[*]$RESET Installing Hakrawler...$RESET"
go install github.com/hakluke/hakrawler@latest
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# HTTProbe INSTALLER
cd ~/go/bin/
echo -e "$OKBLUE[*]$RESET Installing HTTProbe...$RESET"
go install github.com/tomnomnom/httprobe@latest
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# joomscan INSTALLER
cd $PLUGINS_DIR
echo -e "$OKBLUE[*]$RESET Installing joomscan...$RESET"
git clone https://github.com/rezasp/joomscan.git
cd joomscan
perl joomscan.pl
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# lscript INSTALLER
cd $PLUGINS_DIR
echo -e "$OKBLUE[*]$RESET Installing lscript...$RESET"
git clone https://github.com/arismelachroinos/lscript.git
cd lscript
chmod +x install.sh
./install.sh
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# magicRecon INSTALLER
cd $PLUGINS_DIR
echo -e "$OKBLUE[*]$RESET Installing magicRecon...$RESET"
git clone https://github.com/robotshell/magicRecon
cd magicRecon
chmod +x install.sh
./install.sh
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# ParamSpider INSTALLER
cd $PLUGINS_DIR
echo -e "$OKBLUE[*]$RESET Installing ParamSpider...$RESET"
git clone https://github.com/devanshbatham/ParamSpider
cd ParamSpider
pip3 install -r requirements.txt
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# parameth INSTALLER
cd $PLUGINS_DIR
echo -e "$OKBLUE[*]$RESET Installing parameth...$RESET"
git clone https://github.com/maK-/parameth.git
cd parameth
pip3 install -r requirements.txt
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# reconftw INSTALLER
cd $PLUGINS_DIR
echo -e "$OKBLUE[*]$RESET Installing reconftw...$RESET"
git clone https://github.com/six2dez/reconftw
cd reconftw/
./install.sh
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# shuffledns INSTALLER
cd ~/go/bin/
echo -e "$OKBLUE[*]$RESET Installing shuffledns...$RESET"
go install -v github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# Striker INSTALLER
cd $PLUGINS_DIR
echo -e "$OKBLUE[*]$RESET Installing Striker...$RESET"
git clone https://github.com/s0md3v/Striker.git
cd Striker
pip3 install -r requirements.txt
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# waybackurls INSTALLER
cd ~/go/bin/
echo -e "$OKBLUE[*]$RESET Installing waybackurls...$RESET"
go install github.com/tomnomnom/waybackurls@latest
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# xsscrapy INSTALLER
cd $PLUGINS_DIR
echo -e "$OKBLUE[*]$RESET Installing xsscrapy...$RESET"
git clone https://github.com/DanMcInerney/xsscrapy.git
wget -O -u https://bootstrap.pypa.io/get-pip.py
python get-pip.py
pip install -r requirements.txt
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# Maltego-TRX INSTALLER
cd $PLUGINS_DIR
echo -e "$OKBLUE[*]$RESET Installing Maltego-TRX...$RESET"
git clone https://github.com/MaltegoTech/maltego-trx.git
pip install maltego-trx
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# SSLyze INSTALLER
cd $PLUGINS_DIR
echo -e "$OKBLUE[*]$RESET Installing SSLyze...$RESET"
git clone https://github.com/nabla-c0d3/sslyze.git
cd sslyze
pip install -r requirements.txt --target ./lib
echo -e "$OKGREEN[*]$RESET Done! $RESET"
# Yuki-Chan-The-Auto-Pentest-1 INSTALLER
cd $PLUGINS_DIR
echo -e "$OKBLUE[*]$RESET Installing Yuki-Chan-The-Auto-Pentest-1...$RESET"
git clone https://github.com/killvxk/Yuki-Chan-The-Auto-Pentest-1.git autopentest
cd autopentest
pip3 install -r requirements.txt
# pentesting INSTALLER
echo -e "$OKGREEN[*]$RESET Done! $RESET"
cd $PLUGINS_DIR
echo -e "$OKBLUE[*]$RESET Installing pentesting...$RESET"
git clone https://github.com/go-outside-labs/pentesting.git
cd pentesting
pip3 install -r requirements.txt
# xsspy INSTALLER
echo -e "$OKGREEN[*]$RESET Done! $RESET"
cd $PLUGINS_DIR
echo -e "$OKBLUE[*]$RESET Installing xsspy...$RESET"
git clone https://github.com/faizann24/XssPy/ /opt/xsspy
cd /opt/xsspy
pip3 install -r requirements.txt
# Setting up environment
echo -e "$OKBLUE[*]$RESET Setting up environment...$RESET"
cd $INSTALL_DIR
mkdir $LOOT_DIR 2> /dev/null
mkdir $LOOT_DIR/screenshots/ -p 2> /dev/null
mkdir $LOOT_DIR/nmap -p 2> /dev/null
mkdir $LOOT_DIR/domains -p 2> /dev/null
mkdir $LOOT_DIR/output -p 2> /dev/null
mkdir $LOOT_DIR/reports -p 2> /dev/null
chmod +x $INSTALL_DIR/sniper
ln -s $INSTALL_DIR/sniper /usr/bin/sniper 2> /dev/null
ln -s /usr/share/sniper /sniper 2> /dev/null
ln -s /usr/share/sniper /usr/share/sn1per 2> /dev/null
ln -s /usr/share/sniper/loot/workspace /workspace 2> /dev/null
ln -s /usr/share/sniper/loot/workspace /root/workspace 2> /dev/null
ln -s /usr/share/sniper /root/sniper 2> /dev/null
ln -s /root/.sniper.conf /usr/share/sniper/conf/sniper.conf 2> /dev/null
ln -s /root/.sniper_api_keys.conf /usr/share/sniper/conf/sniper_api_keys.conf 2> /dev/null
mv /root/.sniper.conf /root/.sniper.conf.bak 2> /dev/null
cp -vf /usr/share/sniper/sniper.conf /root/.sniper.conf 2> /dev/null
echo -e "$OKGREEN[*]$RESET Done! $RESET"
echo -e "$OKBLUE[*]$RESET Adding start menu and desktop shortcuts... $RESET"
cp -f $INSTALL_DIR/sn1per.desktop /usr/share/applications/ 2> /dev/null
cp -f $INSTALL_DIR/sn1per.desktop /usr/share/applications/sn1per.desktop 2> /dev/null
cp -f $INSTALL_DIR/sn1per.desktop /usr/share/kali-menu/applications/sn1per.desktop 2> /dev/null
cp -f $INSTALL_DIR/sn1per.png /usr/share/pixmaps/ 2> /dev/null
mkdir -p /usr/share/sniper/loot/workspaces/ 2> /dev/null
ln -fs /usr/share/sniper/loot/workspaces/ /home/kali/Desktop/workspaces 2> /dev/null
ln -fs /usr/share/sniper/loot/workspaces/ /root/Desktop/workspaces 2> /dev/null
echo -e "$OKGREEN[*]$RESET Done! $RESET"
echo -e "$OKGREEN[>]$OKBLUE To run, type 'sniper'! $RESET"
