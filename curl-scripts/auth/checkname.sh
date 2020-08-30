curl "http://localhost:4741/checkname" \
  --include \
  --request GET \
  --header "Content-Type: application/json" \
  --data '{
      "username": "'"${NAME}"'"
  }'

echo
