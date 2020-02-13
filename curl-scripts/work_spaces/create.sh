#!/bin/bash

curl "http://localhost:4741/work_spaces" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "work_space": {
      "place_id": "'"${PLACE}"'",
      "lat": "'"${LAT}"'",
      "lng": "'"${LNG}"'"
    }
  }'

echo
