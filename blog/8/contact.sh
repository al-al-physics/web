#! /bin/bash
#script to generate a Contact signal consisting in prime numbers
sox -n -r 44100 silence.wav synth 0.2 sin 000  #silence between primes 0.2s
sox -n -r 44100 space.wav synth 0.10 sin 000 #space between beeps 0.1s
sox -n -r 44100 signal.wav synth 0.10 sin 1200 #beeps 0.1s 1200Hz
sox $( \
for i in {2,3,5,7,11,13,17,19} #prime sequence
do
for ((j=1; j<= $i; j++)) 
do
echo -n "signal.wav "
echo -n "space.wav "
done
echo -n "silence.wav "
done 
echo -n "temp.wav")
sox temp.wav contact.wav reverb  #add some reverb
ffmpeg -loglevel -8 -i contact.wav -acodec libvorbis contact.ogg #wav -> ogg
rm silence.wav
rm space.wav
rm signal.wav
rm temp.wav
rm contact.wav
