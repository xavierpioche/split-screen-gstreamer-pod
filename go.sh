# launch test script before compose
WORKDIR=~/apps/split-screen-gstreamer-pod
# cd ${WORKDIR}/streamer
# docker build -t quad-streamer-gst .
# cd ${WORKDIR}/web/
# docker build -t split_screen_streamer .
cd ${WORKDIR}/web/
docker run -d -p 80:80 -v ${WORKDIR}/shared:/shared quad-streamer-web
cd ${WORKDIR}/streamer
docker run -v ${WORKDIR}/shared:/shared quad-streamer-gst

