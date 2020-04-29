---
title: Microphone buzzing sound fix
author: Luis Bigas
---


<!--- # Microphone buzzing sound fix (thinkpad x240, pulseaudio) --->

My microphone had a buzzing sound, so I followed this steps to fix it.

This worked using pulseaudio, on a Lenovo thinkpad x240 with Debian.

#### Open file
```
sudo "EDITOR" /etc/pulse/default.pa
```

#### Write inside file
```
### Enable Echo/Noise-Cancelation
load-module module-echo-cancel aec_method=webrtc aec_args="analog_gain_control=0 digital_gain_control=1" source_name=echoCancel_source sink_name=echoCancel_sink
set-default-source echoCancel_source
set-default-sink echoCancel_sink
```

#### Execute the following commands to restart pulseaudio
```
pulseaudio -k
pulseaudio --start
```
