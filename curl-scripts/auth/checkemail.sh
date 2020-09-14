curl "http://localhost:4741/checkemail" \
  --include \
  --request GET \
  --header "Content-Type: application/json" \
  --data '{
      "email": "'"${EMAIL}"'"
  }'

echo
