#/bin/bash/
echo "Copy file to IPFS"
echo "Choose your source : 1 - Direct Link (wget) 2- Direct Link (Aria2c) 3- Gdrive Link (gdown) 4- A Local file, please enter the number of your choose"
read choix

if [ $choix == "2" ]; then
    echo 'enter the url'
    read url
    echo 'enter your estuary API Key'
    read api
    filename=$(basename $url)
    filename=$(printf '%b' "${filename//%/\\x}")
    echo 'Start download'
    mkdir ~/dl
    cd ~/dl
    aria2c -x16 $url --out="$filename"
    myfilesize=$(wc -c "$filename" | awk '{print $1}')
    echo 'Start upload'
    cid=$(curl -X POST https://shuttle-4.estuary.tech/content/add -H "Authorization: Bearer $api" -H "Accept: application/json" -H "Content-Type: multipart/form-data" -F "data=@$filename" | jq -r '.cid')
    echo "filename : $filename"
    echo "size in byte : $myfilesize"
    echo "IPFS CID: /ipfs/$cid"
    echo "IPFS Download Link : https://dweb.link/ipfs/$cid"
    cd ..
    rm -rf ~/dl
elif [ $choix == "1" ]; then
    echo 'enter the url'
    read url
    echo 'enter your estuary API Key'
    read api
    echo 'Start download'
    filename=$(basename $url)
    filename=$(printf '%b' "${filename//%/\\x}")
    mkdir ~/dl
    cd ~/dl
    wget $url -O "$filename"
    myfilesize=$(wc -c "$filename" | awk '{print $1}')
    echo 'Start upload'
    cid=$(curl -X POST https://shuttle-4.estuary.tech/content/add -H "Authorization: Bearer $api" -H "Accept: application/json" -H "Content-Type: multipart/form-data" -F "data=@$filename" | jq -r '.cid')
    echo "filename : $filename"
    echo "size in byte : $myfilesize"
    echo "IPFS CID: /ipfs/$cid"
    echo "IPFS Download Link : https://dweb.link/ipfs/$cid"
    cd ..
    rm -rf ~/dl
elif [ $choix == "3" ]; then
    echo 'Enter the Gdrive ID File'
    read idg
    echo 'enter the filename'
    read filename
    echo 'enter your estuary API Key'
    read api
    echo 'Start download'
    mkdir ~/dl
    cd ~/dl
    gdown https://drive.google.com/u/0/uc?id=$idg
    echo 'Start upload'
    cid=$(curl -X POST https://shuttle-4.estuary.tech/content/add -H "Authorization: Bearer $api" -H "Accept: application/json" -H "Content-Type: multipart/form-data" -F "data=@$filename" | jq -r '.cid')
    myfilesize=$(wc -c "$filename" | awk '{print $1}')
    echo "filename : $filename"
    echo "size in byte : $myfilesize"
    echo "IPFS CID: /ipfs/$cid"
    echo "IPFS Download Link : https://dweb.link/ipfs/$cid"
    cd ..
    rm -rf ~/dl
elif [ $choix == 4 ]; then
    echo 'Enter THE FULL PATH of the file'
    read path
    echo 'enter your estuary API Key'
    read api
    cid=$(curl -X POST https://shuttle-4.estuary.tech/content/add -H "Authorization: Bearer $api" -H "Accept: application/json" -H "Content-Type: multipart/form-data" -F "data=@$path" | jq -r '.cid')
    filename=$(printf '%b' "${path//%/\\x}")
    myfilesize=$(wc -c "$path" | awk '{print $1}')
    echo "filename : $filename"
    echo "size in byte : $myfilesize"
    echo "IPFS CID: /ipfs/$cid"
    echo "IPFS Download Link : https://dweb.link/ipfs/$cid"
else
    echo 'Please make a choose next time'
fi
