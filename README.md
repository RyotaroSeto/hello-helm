docker build . -t hello-helm
docker tag hello-helm ghcr.io/ryotaroseto/hello-helm
docker push ghcr.io/ryotaroseto/hello-helm:latest
