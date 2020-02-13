#!/bin/bash

curl "http://localhost:4741/work_spaces" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo
