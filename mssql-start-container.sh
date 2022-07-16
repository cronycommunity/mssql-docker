echo "start"

docker image build . --platform=linux/amd64 -t mssql-image || true

docker stop mssql || true
docker rm mssql || true

docker container run --platform=linux/amd64 --net=host --name mssql -d \
	-p 1433:1433 --rm mssql-image:latest

echo "end"