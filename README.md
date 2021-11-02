# send-ipfs-script
 
Upload automatically file to IPFS !

Work thank's to the [Estuary Gateway](https://estuary.tech/)

# Autoinstall script (Debian & Ubuntu Only)
`wget https://git.io/JPXms -O install.sh &&
chmod +x install.sh &&
sudo ./install.sh && rm install.sh`

# Source Support

- HTTP Link
- FTP Link
- Local File
- Google Drive link

# Output

The script return:

- The name of the file (take from the URL except for Google Drive)
- The size (in bytes)
- The CID (with /ipfs/)
- An HTTP Download link (From dweb.link gateway)