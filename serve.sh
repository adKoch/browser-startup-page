#!/bin/sh
echo "Serving start page at http://localhost:8080"
echo "  Default: http://localhost:8080/?config=default"
echo "  Media:   http://localhost:8080/?config=media"
echo "  Office:  http://localhost:8080/?config=office"
python3 -m http.server 8080
