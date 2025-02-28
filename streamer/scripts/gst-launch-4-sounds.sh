gst-launch-1.0 \
videomixer name=vmix \
sink_0::xpos=0 sink_0::ypos=0 \
sink_1::xpos=320 sink_1::ypos=0 \
sink_2::xpos=0 sink_2::ypos=240 \
sink_3::xpos=320 sink_3::ypos=240 ! \
videoconvert ! autovideosink \
audiomixer name=amix ! audioconvert ! autoaudiosink \
souphttpsrc location='http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4' ! decodebin name=dec1  \
dec1. ! videoconvert ! videoscale ! video/x-raw,width=320,height=240 ! vmix.sink_0 \
dec1. ! audioconvert !  audio/x-raw ! amix. \
souphttpsrc location='http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4' ! decodebin name=dec2  \
dec2. ! videoconvert ! videoscale ! video/x-raw,width=320,height=240 ! vmix.sink_1 \
dec2. ! audioconvert ! audio/x-raw ! amix. \
souphttpsrc location='http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4' ! decodebin name=dec3  \
dec3. ! videoconvert ! videoscale ! video/x-raw,width=320,height=240 ! vmix.sink_2 \
dec3. ! audioconvert ! audio/x-raw ! amix. \
souphttpsrc location='http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4' ! decodebin name=dec4  \
dec4. ! videoconvert ! videoscale ! video/x-r
