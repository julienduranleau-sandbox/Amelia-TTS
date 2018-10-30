#!/bin/bash

# Dependency: ogg123 from vorbis-tools
#
# Use:     ibm-tts.sh "Text to say"
# Dry run: ibm-tts.sh "Text to say" dry

text_to_speech=$1
dryrun=false

codecs="audio/ogg;codecs=vorbis"
voice="en-US_AllisonVoice"

# username=""
# password=""
source ibm-credentials.sh

formatted_text='<express-as type="Uncertainty"><voice-transformation type="Custom" glottal_tension="-90%" pitch="20%">'$text_to_speech'</voice-transformation></express-as>'
formatted_data='{"text":"'${formatted_text//\"/\\\"}'"}'

md5_str="$(echo -n $formatted_data | md5sum | sed 's/ .*//g')"
cached_file="cache/$md5_str.ogg"

if [ "$2" == "dry" ]; then
    dryrun=true
fi

if [ $dryrun != true ]; then
    if [ ! -f $cached_file ]; then
        curl -X POST -u "$username":"$password" \
        --header "Content-Type: application/json" \
        --header "Accept: $codecs" \
        --data "$formatted_data" \
        --output "$cached_file" \
        "https://stream.watsonplatform.net/text-to-speech/api/v1/synthesize?voice=$voice"
    fi

    ogg123 $cached_file
else
    echo "TTS: $text_to_speech"
fi
