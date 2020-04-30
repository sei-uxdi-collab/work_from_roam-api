#!/bin/bash

curl "http://localhost:4741/work_spaces/top_rated" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo
