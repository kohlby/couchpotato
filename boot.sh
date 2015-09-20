#!/bin/bash

# Unofficial bash strict mode http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -eu
set -o pipefail
IFS=$'\n\t'


cat /config/couchpotato.ini \
  | sed "s|COUCHPOTATO_API_KEY|$COUCHPOTATO_API_KEY|" \
  | sed "s|COUCHPOTATO_PORT|$COUCHPOTATO_PORT|" \
  | sed "s|SABNZBD_API_KEY|$SABNZBD_API_KEY|" \
  | sed "s|SABNZBD_HOST|$SABNZBD_HOST|" \
  | sed "s|SABNZBD_PORT|$SABNZBD_PORT|" \
  | sed "s|TRANSMISSION_HOST|$TRANSMISSION_HOST|" \
  | sed "s|TRANSMISSION_PORT|$TRANSMISSION_PORT|" \
  | sed "s|PLEX_AUTH_TOKEN|$PLEX_AUTH_TOKEN|" \
  | sed "s|PLEX_HOST|$PLEX_HOST|" \
  | sed "s|PLEX_PASSWORD|$PLEX_PASSWORD|" \
  | sed "s|PLEX_PORT|$PLEX_PORT|" \
  | sed "s|PLEX_USERNAME|$PLEX_USERNAME|" \
  | sed "s|NZBGEEK_API_KEY|$NZBGEEK_API_KEY|" \
  > /tmp/couchpotato.ini

exec ${*:1}
