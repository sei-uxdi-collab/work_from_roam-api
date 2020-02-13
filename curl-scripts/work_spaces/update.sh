# Ex: TOKEN=tokengoeshere ID=idgoeshere TEXT=textgoeshere sh curl-scripts/examples/update.sh

curl "http://localhost:4741/work_spaces/${ID}" \
  --include \
  --request PATCH \
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
