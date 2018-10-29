#!/bin/bash

# ogg123 output.ogg
# # ogg123 from vorbis-tools

text_to_speech="Oh my god, this is so nice!"

codecs="audio/ogg;codecs=vorbis"
output_file="ibm.ogg"
voice="en-US_AllisonVoice"
username=""
password=""

formatted_text='<express-as type="Uncertainty"><voice-transformation type="Custom" glottal_tension="-90%" pitch="20%">'$text_to_speech'</voice-transformation></express-as>'
formatted_data='{"text":"'${formatted_text//\"/\\\"}'"}'

curl -X POST -u "$username":"$password" \
--header "Content-Type: application/json" \
--header "Accept: $codecs" \
--data "$formatted_data" \
--output "$output_file" \
"https://stream.watsonplatform.net/text-to-speech/api/v1/synthesize?voice=$voice"
