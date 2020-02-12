#!/bin/bash

set -e

echo "Starting on Start script"

sudo -i -u ec2-user bash << EOF
if [[ -f /home/ec2-user/SageMaker/.create-notebook ]]; then
    echo "Skipping as currently installing conda env"
else
    echo "Installing Jupyter kernel"
    source activate /home/ec2-user/SageMaker/env/rapidsai
    python -m ipykernel install --name 'rapidsai' --user
    echo "Finished setting up Jupyter kernel"
fi
EOF

echo "Finishing on Start script"