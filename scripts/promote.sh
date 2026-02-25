
#!/bin/bash
IMAGE=$1
FROM=$2
TO=$3
docker pull $IMAGE:$FROM
docker tag $IMAGE:$FROM $IMAGE:$TO
docker push $IMAGE:$TO
