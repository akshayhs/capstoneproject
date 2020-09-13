eksctl create cluster \
--name capstone \
--region ap-south-1 \
--nodegroup-name capstone-nodes \
--nodes 3 \
--nodes-min 1 \
--nodes-max 4 \
--ssh-access \
--ssh-public-key ec2key_capstoneinstance \
--managed