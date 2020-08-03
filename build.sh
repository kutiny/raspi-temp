set -ex

USERNAME=alexlndn
IMAGENAME=raspi-temp
VERSION=$(cat VERSION)

docker buildx build --platform linux/arm64 -t $USERNAME/$IMAGENAME:arm64 .
docker buildx build --platform linux/arm/v7 -t $USERNAME/$IMAGENAME:armv7 .

docker push $USERNAME/$IMAGENAME:arm64
docker push $USERNAME/$IMAGENAME:armv7
docker push $USERNAME/$IMAGENAME:$VERSION

docker manifest create $USERNAME/$IMAGENAME:latest $USERNAME/$IMAGENAME:arm64 $USERNAME/$IMAGENAME:armv7 --amend
docker manifest push $USERNAME/$IMAGENAME:latest
