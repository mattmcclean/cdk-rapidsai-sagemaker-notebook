import * as cdk from '@aws-cdk/core';
import { SageMakerNotebook } from '../lib/sagemakernb';
import fs = require('fs');

export class RapidsaiSagemakerNbStack extends cdk.Stack {
  constructor(scope: cdk.Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    // The code that defines your stack goes here
    /** Create the SageMaker notebook instance */
    new SageMakerNotebook(this, 'RapidsaiNotebook', {
      name: 'rapidsai',
      instanceType: 'ml.p3.2xlarge',
      onCreateScript: fs.readFileSync('scripts/onCreate.sh', 'utf8').toString(),
      onStartScript: fs.readFileSync('scripts/onStart.sh', 'utf8').toString(),
      volumeSize: 50,
      defaultCodeRepository: "https://github.com/rapidsai/notebooks",
    });    
  }
}
