#!/bin/bash

set -e

echo "Starting on Create script"

sudo -i -u ec2-user bash <<EOF
touch /home/ec2-user/SageMaker/.create-notebook
EOF

cat > /home/ec2-user/SageMaker/.rapidsai-install.sh <<\EOF
#!/bin/bash
set -e
echo "Updating conda"
conda update -n base -c defaults conda -y
conda update --all -y
echo "Starting conda create command for rapidsai env"
conda create -mqyp /home/ec2-user/SageMaker/.env/rapidsai -c rapidsai -c nvidia -c conda-forge -c defaults rapids=0.12 python=3.6 ipykernel matplotlib=3.1.3 statsmodels=0.11.0
source activate /home/ec2-user/SageMaker/.env/rapidsai
echo "Installing Jupyter kernel for rapidsai"
python -m ipykernel install --name 'rapidsai' --user
echo "Finished installing rapidsai conda env"
rm /home/ec2-user/SageMaker/.create-notebook
echo "Exiting install script"
EOF

chown ec2-user:ec2-user /home/ec2-user/SageMaker/.rapidsai-install.sh
chmod 755 /home/ec2-user/SageMaker/.rapidsai-install.sh

sudo -i -u ec2-user bash <<EOF
nohup /home/ec2-user/SageMaker/.rapidsai-install.sh &
EOF

echo "Finishing on Create script"