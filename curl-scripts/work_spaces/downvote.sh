curl "http://localhost:4741/work_spaces/${ID}/unlike" \
  --include \
  --request PUT \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \

echo
