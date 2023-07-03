echo $USERNAME
echo $KEYNAME

chmod og-rwx mykeypair.pem
aws ec2 import-key-pair \
 --key-name $KEYNAME \
 --public-key-material fileb://mykeypair.pub

aws ec2 run-instances \
	--image-id ami-007855ac798b5175e \
	--count 1 \
	--instance-type t2.micro \
	--key-name $KEYNAME \
	--user-data file:///data/install-startup-script.txt  
	#dengan menggunakan ini, pada waktu startup, vm akan menginstall sesuai dengan script 

#buka firewall
aws ec2 authorize-security-group-ingress --group-name default --cidr '0.0.0.0/0' --protocol tcp --port 22
aws ec2 authorize-security-group-ingress --group-name default --cidr '0.0.0.0/0' --protocol tcp --port 80
aws ec2 authorize-security-group-ingress --group-name default --cidr '0.0.0.0/0' --protocol tcp --port 443
aws ec2 authorize-security-group-ingress --group-name default --cidr '0.0.0.0/0' --protocol tcp --port 30070
aws ec2 authorize-security-group-ingress --group-name default --cidr '0.0.0.0/0' --protocol tcp --port 30071

