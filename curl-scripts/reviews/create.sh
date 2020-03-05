#!/bin/bash

curl "http://localhost:4741/reviews" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "review": {
      "rating": "'"${RATING}"'",
      "note": "'"${NOTE}"'",
      "wifi": "'"${WIFI}"'",
      "food": "'"${FOOD}"'",
      "bathroom": "'"${BATH}"'",
      "coffee": "'"${COFFEE}"'",
      "seating": "'"${SEAT}"'",
      "outlet": "'"${OUT}"'",
      "noise": "'"${NOISE}"'",
      "review": "'"${REV}"'",
      "work_space_id": "'"${ID}"'"
    }
  }'

echo
