#!/bin/bash

curl "http://localhost:4741/reviews" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo
