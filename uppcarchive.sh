#/bin/bash
if [ $1 == "" || $2 == "" ]
then
	echo "Merci d'entrer un nom de fichier pour les liens ou un dossier de destination"
else
	echo "Nom des fichiers de liens : $1"
	echo "Nom du dossier de destination : $2"
	mkdir dlpc
	cd dlpc
	wget https://internal.voxhost.fr/$1
	mkdir $2
	aria2c +x16 --input-file=$1
	rm -rf *.txt
	mv * $2
	rclone copy $2 drivepc:$2 --progress
fi