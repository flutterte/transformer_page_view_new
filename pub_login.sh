# This script creates/updates pub-credentials.json file which is used
# to authorize publisher when publishing packages to pub.dev

# Checking whether the secrets are available as environment
# variables or not.
if [ -z "${PUB_DEV_PUBLISH_ACCESS_TOKEN}" ]; then
  echo "Missing PUB_DEV_PUBLISH_ACCESS_TOKEN environment variable"
  exit 1
fi

if [ -z "${PUB_DEV_PUBLISH_REFRESH_TOKEN}" ]; then
  echo "Missing PUB_DEV_PUBLISH_REFRESH_TOKEN environment variable"
  exit 1
fi

if [ -z "${PUB_DEV_PUBLISH_ID_TOKEN}" ]; then
  echo "Missing PUB_DEV_PUBLISH_ID_TOKEN environment variable"
  exit 1
fi

if [ -z "${PUB_DEV_PUBLISH_TOKEN_ENDPOINT}" ]; then
  echo "Missing PUB_DEV_PUBLISH_TOKEN_ENDPOINT environment variable"
  # exit 1
fi

if [ -z "${PUB_DEV_PUBLISH_EXPIRATION}" ]; then
  echo "Missing PUB_DEV_PUBLISH_EXPIRATION environment variable"
  # exit 1
fi

# Create pub-credentials.json file.
mkdir ~/.config
mkdir ~/.config/dart

cat <<EOF > ~/.config/dart/pub-credentials.json
{
  "accessToken": "${PUB_DEV_PUBLISH_ACCESS_TOKEN}",
  "refreshToken": "${PUB_DEV_PUBLISH_REFRESH_TOKEN}",
  "idToken": "${PUB_DEV_PUBLISH_ID_TOKEN}",
  "tokenEndpoint": "${PUB_DEV_PUBLISH_TOKEN_ENDPOINT}",
  "scopes": ["https://www.googleapis.com/auth/userinfo.email", "openid"],
  "expiration": ${PUB_DEV_PUBLISH_EXPIRATION}
}