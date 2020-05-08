curl "http://localhost:4741/update-user" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "password": "'"${PW}"'",
      "email": "'"${EMAIL}"'",
      "username": "'"${NAME}"'",
      "avatar": "'"${AV}"'"
    }
  }'

echo
