WORKDIR=~/apps/split-screen-gstreamer-pod
cd ${WORKDIR}/web/
docker run -d -p 80:80 -v ${WORKDIR}/shared:/shared quad-streamer-web
cd ${WORKDIR}/streamer
docker run -d -p 8000:8000 -v ${WORKDIR}/shared:/shared quad-streamer-gst

