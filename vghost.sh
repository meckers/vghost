echo Creating play project $1


play new $1
cd $1

echo "Idealize (y/n)?"
read idealize

if [ "$idealize" == "y" ]
then
  play idealize
fi

cp -rf /usr/local/scripts/vg/add-on-files/. .

#todo: fix this to work

echo "Port (9000)?"
read port

#sed 's/# http.port=9000/http.port=$port/g' ./conf/application.conf