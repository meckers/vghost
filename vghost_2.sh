echo Creating play project $1 on port $3

if [ $2 == "-i" ]
then
  idealize=1
fi

play new $1
cd $1
if [ "$idealize" == "1" ]
then
  play idealize
fi

cp -rf ~/Documents/play-projects/vengeful-ghost/playlib .
cp -rf ~/Documents/play-projects/vengeful-ghost/build .
cp -rf ~/Documents/play-projects/vengeful-ghost/app/views ./app/ 
cp -rf ~/Documents/play-projects/vengeful-ghost/public .  

#todo: fix this to work
#sed 's/# http.port=9000/http.port=9123/g' application.conf > application2.conf
