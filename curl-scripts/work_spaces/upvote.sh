curl "http://localhost:4741/work_spaces/${ID}/like" \
  --include \
  --request PUT \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \

echo
