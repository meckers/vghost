echo Creating play project $1

if [ "$1" != "" ]; then

	play new $1
	cd $1

	cp -rf /usr/local/scripts/vghost/add-on-files/basic/. .

	echo "Add Lightcouch support (y/n)?"
	read couch
	if [ "$couch" == "y" ]; then
		#cp -rf /usr/local/scripts/vghost/dependency-files/couchdb.yml ./conf/dependencies.yml
		cp -rf /usr/local/scripts/vghost/add-on-files/couch/. .
		perl -pi -w -e 's/#REPLACEDBYVGHOST/GET\t\t\/store\/load\/\{id\}\t\t\t\t\t\tStore.load\n#REPLACEDBYVGHOST/g' conf/routes
		perl -pi -w -e 's/#REPLACEDBYVGHOST/POST\t\/store\/save\t\t\t\t\t\t\t\tStore.save\n#REPLACEDBYVGHOST/g' conf/routes
	fi

	echo "Add drag & drop upload support (y/n)?"
	read dragdrop
	if [ "$dragdrop" == "y" ]; then
		cp -rf /usr/local/scripts/vghost/add-on-files/ddupload/. .
		echo -e '\nlibs/dropzone.js' >> build/includelists/libs-scripts.files
		perl -pi -w -e 's/#REPLACEDBYVGHOST/POST\t\/upload\t\t\t\t\t\t\t\t\tUpload.upload\n#REPLACEDBYVGHOST/g' conf/routes
		mkdir ./public/uploads
		#chmod 777 ./public/uploads
	fi

	play dependencies

else
	echo "No name specified!"
fi