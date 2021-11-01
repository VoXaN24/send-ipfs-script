#/bin/bash
apt update
apt install aria2 wget jq python3-pip
pip install gdown
wget https://git.io/JPXti -O ipfs-autoup
chmod +x ipfs-autoup
mv ipfs-autoup /usr/bin/ipfs-autoup
echo "Before launch, add python to the path thank's to 'export PATH=$PATH:/home/$USER/.local/bin' >> .bashrc'"
echo "you can launch it by type ipfs-autoup in a terminal"