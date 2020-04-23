curl "http://localhost:4741/work_spaces/${ID}/likes" \
  --include \
  --request GET \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \

echo
