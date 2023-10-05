# use docker compose 
# or docker run for testing purpose
WEBNAME=web
ETC_HOSTS=/etc/hosts
TESTING=0
if [ ${TESTING} -eq 1 ] 
then
	WORKDIR=.
	cd ${WORKDIR}/streamer
	sudo docker build -t quad-streamer-gst .
	cd ${WORKDIR}/web/
	sudo docker build -t split_screen_streamer .
	cd ${WORKDIR}/web/
	sudo docker run -d -p 80:80 -v ${WORKDIR}/shared:/shared quad-streamer-web
	cd ${WORKDIR}/streamer
	sudo docker run -v ${WORKDIR}/shared:/shared quad-streamer-gst
else
	sudo docker compose up -d
fi
sleep 5
WEBSRV=${PWD##*/}-web
WEBSRVID=$(sudo docker ps | grep ${WEBSRV}|awk '{ print $1 }')
WEBSRVIP=$(sudo docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ${WEBSRVID})
HOSTS_LINE="${WEBSRVIP}\t${WEBNAME}"
sudo sed -i".bak" "/$WEBNAME/d" ${ETC_HOSTS}
sudo -- sh -c -e "echo '$HOSTS_LINE' >> /etc/hosts"
