#!/bin/bash

usage() {
    echo "$0: [-l <label>] [-s <hex_secret>]"
    exit
}

# Options parse
while [[ $# -gt 0 ]] ; do
    key="$1"
    case $key in
	-l|--label)
    	    LABEL="$2"
	    shift
	    ;;
	-s|--secret)
    	    secret="$2"
	    shift
	    ;;
	-h|--help|-help)
	    usage
	    ;;
	*)
	    echo "ERROR: Unknown argument $1"
	    usage
	    ;;
    esac
    shift
done

cp QR_generator.html KEY.html
if [ "$LABEL" != "" ] ; then
    perl -p -i -e "s/\"Token\"/\"$LABEL\"/" KEY.html
fi
if [ "$secret" = "" ] ; then
	secret=`openssl rand -hex 20`
fi
perl -p -i -e "s/HEX_SECRET_HERE/$secret/" KEY.html

if [ "$MSYSTEM" = "MINGW32" -o "$MSYSTEM" = "MINGW64" ] ; then
	start firefox KEY.html
else
	firefox KEY.html
fi
echo Server Secret: $secret

