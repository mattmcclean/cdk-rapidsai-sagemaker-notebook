import { expect as expectCDK, matchTemplate, MatchStyle } from '@aws-cdk/assert';
import * as cdk from '@aws-cdk/core';
import RapidsaiSagemakerNb = require('../lib/rapidsai-sagemaker-nb-stack');

test('Empty Stack', () => {
    const app = new cdk.App();
    // WHEN
    const stack = new RapidsaiSagemakerNb.RapidsaiSagemakerNbStack(app, 'MyTestStack');
    // THEN
    expectCDK(stack).to(matchTemplate({
      "Resources": {}
    }, MatchStyle.EXACT))
});
