# Ex: TOKEN=tokengoeshere ID=idgoeshere TEXT=textgoeshere sh curl-scripts/examples/update.sh

curl "http://localhost:4741/reviews/${ID}" \
  --include \
  --request PATCH \
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
      "review": "'"${REV}"'"
    }
  }'

  echo
