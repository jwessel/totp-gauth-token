This is a simple token generator.  It depends on openssl and Firefox.
You can also use it on a Windows machine if you have git-bash
installed.

Usage: ./generate_key.sh [--label <toke label>] [--secret <hex secret>]


Quick start:

git clone https://github.com/jwessel/totp-gauth-token
cd totp-gauth-token
./generate_key.sh 

Or you could generate a key with a token name filled in:
./generate_key.sh -label "My Special Token"

The ./generate_key.sh should open Firefox and you will have a token
you can scan into a device with the QR code.  Depending on what
type of server you are using for the 2FA you need to save off either
the Server Hex Secret or the Base-32 Secret.

