#!/bin/sh
# Requirements:
#   env $GITHUB_TOKEN_GHCR : for GHCR

IMAGE_OWNER='sitateru'
DIR="${*:$#}"
LATEST=
CACHE=
PLATFORM='linux/amd64,linux/arm64'

function usage {
  cat <<EOM
Usage: $(basename "$0") [OPTION] [DIR]
  -h  Display help
  -l  Add 'latest' tag
  -n  Build without cache
  -p  Platform (default: linux/amd64,linux/arm64)
EOM

  exit 2
}

while getopts "hlnp:" optKey; do
  case "$optKey" in
    l)
      LATEST=',latest'
      ;;
    n)
      CACHE='--no-cache'
      ;;
    p)
      PLATFORM=$OPTARG
      ;;
    '-h'|'--help'|* )
      usage
      ;;
  esac
done

echo "DIR=$DIR"
IMAGE_NAME=$(echo $DIR | cut -f1 -d'/')
TAG=$(echo $DIR | cut -f2 -d'/')
IMAGE_GHCR="ghcr.io/$IMAGE_OWNER/$IMAGE_NAME"

if [ ! -d "$DIR" -o -z "$IMAGE_NAME" -o -z "$TAG" ]; then
  echo 'Specify build directory!'
  exit 1
fi

echo 'build and push'
echo "  image:    $IMAGE_NAME"
echo "  tag:      $TAG$LATEST"
echo "  platform: $PLATFORM"

function publish_ghcr {
  echo $GITHUB_TOKEN_GHCR | docker login ghcr.io -u $IMAGE_OWNER --password-stdin
  if [ $? -ne 0 ]; then
    echo 'ghcr.io login failed!'
    exit 1
  fi
  if [ "$LATEST" ]; then
    IMAGE_LATEST_GHCR="$IMAGE_GHCR:latest"
    BUILD_LATEST_GHCR="-t $IMAGE_LATEST_GHCR"
  fi
  docker buildx build --push $CACHE --platform $PLATFORM -t $IMAGE_GHCR:$TAG $BUILD_LATEST_GHCR $DIR
}

publish_ghcr

exit 0
