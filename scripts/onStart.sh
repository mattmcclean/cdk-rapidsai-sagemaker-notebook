#!/bin/bash

set -e

echo "Starting on Start script"

sudo -i -u ec2-user bash << EOF
source activate ~/SageMaker/env/rapidsai
python -m ipykernel install --name 'rapidsai' --user
echo "Finished setting up rapidsai kernel"
EOF

echo "Finishing on Start script"