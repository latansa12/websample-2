NAMAUSER=user1
docker rm -f aws1-$NAMAUSER
docker run -it --name aws1-$NAMAUSER \
	-e USERNAME=$NAMAUSER \
	-e KEYNAME=$NAMAUSER-key \
	-v $(pwd)/config/config:/tmp/config \
	-v $(pwd)/config/credentials:/tmp/credentials \
	-v $(pwd)/ec2:/data \
	-e AWS_CONFIG_FILE=/tmp/config \
	-e AWS_SHARED_CREDENTIALS_FILE=/tmp/credentials \
	royyana/cltool-alpine:1.00 /bin/sh
