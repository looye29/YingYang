sudo apt update -y
sudo apt upgrade -y
sudo apt install -y nmap
sudo apt install -y libcurl4-openssl-dev 
sudo apt install -y libxml2 
sudo apt install -y libxml2-dev 
sudo apt install -y libxslt1-dev 
sudo apt install -y ruby-dev
sudo apt install -y build-essential
sudo apt install -y libgmp-dev
sudo apt install -y zlib1g-dev
sudo apt install -y golang
sudo apt install -y maltego

sudo pip3 install arjun
sudo pip3 install wafw00f
sudo pip3 install --upgrade setuptools
sudo pip3 install sslyze
sudo pip3 install dnsgen
sudo pip3 install maltego-trx
sudo pip3 install py-altdns==1.0.2

git clone https://github.com/Yukinoshita47/Yuki-Chan-The-Auto-Pentest.git
cd Yuki-Chan-The-Auto-Pentest
sudo chmod 777 wafninja joomscan install-perl-module.sh yuki.sh
sudo chmod 777 Module/WhatWeb/whatweb
sudo pip3 install -r requirements.txt
sudo ./install-perl-module.sh
cd ..

git clone https://github.com/coreb1t/awesome-pentest-cheat-sheets.git
git clone https://github.com/qazbnm456/awesome-web-security.git
git clone https://github.com/s0md3v/Breacher.git
git clone https://github.com/sehno/Bug-bounty.git
git clone https://github.com/RUB-NDS/CORStest.git
git clone https://github.com/christophetd/censys-subdomain-finder.git
git clone https://github.com/commixproject/commix.git
git clone https://github.com/darkoperator/dnsrecon.git
git clone https://github.com/maurosoria/dirsearch.git --depth 1
git clone https://github.com/1N3/Goohak.git
git clone https://github.com/tomnomnom/hacks.git
git clone https://github.com/nahamsec/HostileSubBruteforcer.git
git clone https://github.com/KathanP19/HowToHunt.git
git clone https://github.com/laramies/metagoofil.git
git clone https://github.com/foospidy/payloads.git
git clone https://github.com/swisskyrepo/PayloadsAllTheThings.git
git clone https://github.com/Mr-xn/Penetration_Testing_POC.git
git clone https://github.com/go-outside-labs/pentesting.git
git clone https://github.com/blaCCkHatHacEEkr/PENTESTING-BIBLE.git
git clone https://github.com/nixawk/pentest-wiki.git
git clone https://github.com/mitchellkrogza/Phishing.Database.git
git clone https://github.com/0xDanielLopez/phishing_kits.git
git clone https://github.com/nahamsec/Resources-for-Beginner-Bug-Bounty-Hunters.git
git clone https://github.com/arthepsy/ssh-audit.git
git clone https://github.com/Strappazzon/SCAM-Lock-Tool.git
git clone https://github.com/ConnorBaxter/ScambaitToolkit.git
git clone https://github.com/gekkedev/scambaitwebsite.git
git clone https://github.com/SaudAlfurhud/Scammer-Sabotage.git
git clone https://github.com/We5ter/Scanners-Box.git
git clone https://github.com/nahamsec/SecLists.git
git clone https://github.com/danielmiessler/SecLists.git
git clone https://github.com/The-XSS-Rat/SecurityTesting.git
git clone https://github.com/nccgroup/shocker.git
git clone https://github.com/s0md3v/Striker.git
git clone https://github.com/projectdiscovery/subfinder.git
git clone https://github.com/evanRubinsteinIT/URLChecker.git
git clone https://github.com/nahamsec/burpy.git
git clone https://github.com/nahamsec/lazyrecon.git
git clone https://github.com/nahamsec/lazys3.git
git clone https://github.com/blechschmidt/massdns.git
git clone https://github.com/nahamsec/recon_profile.git

git clone https://github.com/nahamsec/bbht.git
cd bbht
sudo chmod +x install.sh
sudo ./install.sh
cd ..

git clone https://github.com/1N3/BlackWidow.git
cd BlackWidow
sudo ./install.sh
cd ..

git clone https://github.com/1N3/BruteX.git
cd BruteX
sudo ./install.sh
cd ..

git clone https://github.com/rbsec/dnscan.git
cd dnscan
sudo pip3 install -r requirements.txt
cd ..

go install -v github.com/evilsocket/dnssearch@latest
go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest
go install -v github.com/tomnomnom/httprobe@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest

curl -LO https://github.com/findomain/findomain/releases/latest/download/findomain-linux.zip
sudo unzip findomain-linux.zip
sudo chmod +x findomain
sudo sudo mv findomain /usr/bin/findomain
sudo findomain --help

git clone https://github.com/1N3/Findsploit.git
cd Findsploit
sudo ./install.sh
cd ..

git clone https://github.com/hisxo/gitGraber.git
cd gitGraber
sudo pip3 install -r requirements.txt
cd ..

git clone https://github.com/joaomatosf/jexboss.git
cd jexboss
sudo pip3 install -r requires.txt
sudo python3 jexboss.py -h
sudo python3 jexboss.py -host http://target_host:8080
cd ..

git clone https://github.com/rezasp/joomscan.git
cd joomscan
perl joomscan.pl
cd ..

git clone https://github.com/guelfoweb/knock.git
cd knock
sudo pip3 install -r requirements.txt
sudo python3 knockpy.py --help
cd ..

git clone https://github.com/GerbenJavado/LinkFinder.git
cd LinkFinder
sudo python3 setup.py install
cd ..

git clone https://github.com/opsdisk/pagodo.git
cd pagodo
sudo pip3 install -r requirements.txt
cd ..

git clone https://github.com/devanshbatham/ParamSpider
cd ParamSpider
sudo pip3 install -r requirements.txt
sudo python3 paramspider.py --help
cd ..

sudo pip3 install --upgrade pip setuptools wheel
sudo pip3 install --upgrade sslyze
sudo python3 -m sslyze --help

git clone https://github.com/m4ll0k/SecretFinder.git secretfinder
cd secretfinder
sudo pip3 install -r requirements.txt
sudo python3 SecretFinder.py --help
cd ..

git clone https://github.com/defparam/smuggler.git
cd smuggler
sudo python3 smuggler.py -h
cd ..

git clone https://github.com/1N3/Sn1per
cd Sn1per
sudo ./install.sh
cd ..

git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r
sudo pip3 install -r requirements.txt
sudo apt install -y python-dnspython
sudo apt install -y python-argparse
sudo python3 sublist3r.py -h
cd ..

git clone --recursive https://github.com/screetsec/Sudomy.git
cd Sudomy
sudo pip3 install -r requirements.txt
sudo apt update -y
sudo apt install -y jq nmap phantomjs npm chromium parallel
npm i -g wappalyzer wscat
cd ..

git clone https://github.com/thetrentus/TheFatRat.git
cd TheFatRat
sudo chmod +x setup.sh
sudo ./setup.sh
cd ..

cd /usr/share/nmap/scripts/vulscan
git clone https://github.com/scipag/vulscan scipag_vulscan
ln -s `pwd`/scipag_vulscan /usr/share/nmap/scripts/vulscan    
cd /home/kali/git

git clone https://github.com/jekyc/wig.git
cd wig
sudo python3 setup.py install
cd ..

git clone https://github.com/DanMcInerney/xsscrapy.git
cd xsscrapy
sudo wget -O -u https://bootstrap.pypa.io/get-pip.py
sudo python3 get-pip.py
sudo pip3 install -r requirements.txt
cd ..

git clone https://github.com/faizann24/XssPy.git
cd XssPy
sudo pip3 install -r requirements.txt
cd ..

sudo pip3 install git+https://github.com/lobuhi/byp4xx.git

git clone https://github.com/nahamsec/hacker101.git
gem install bundler
cd hacker101
sudo bundle install
sudo bundle exec jekyll serve
cd ..

sudo apt update -y
git clone https://github.com/arismelachroinos/lscript.git
cd lscript
sudo chmod +x install.sh
sudo ./install.sh
cd ..

git clone https://github.com/robotshell/magicRecon
cd magicRecon
sudo chmod +x install.sh
sudo ./install.sh
cd ..

git clone https://github.com/maK-/parameth.git
cd parameth
pip install -u -r requirements.txt
cd ..

git clone https://github.com/six2dez/reconftw
cd reconftw/
sudo ./install.sh
sudo ./reconftw.sh -h
cd ..