trainBinaryFile = 'code-train.dat';
testBinaryFile = 'code-test.dat';
trainListFile = 'train.txt';
testListFile = 'test.txt';

featureDim = 18;

[trainX, trainY, trainL, trainB] = transform(trainBinaryFile, trainListFile, featureDim, 0);
[testX, testY, testL, testB] = transform(testBinaryFile, testListFile, featureDim, 1);
% target = 1640;
% testX = trainX(target:target + 1,:);
% testY = trainY(target:target + 1,:);
% testL = trainL(target:target + 1,:);
% testB = trainB(target:target + 1,:);

[resultM, HDistance] = queryTestOnTrain(trainB,testB);
mapVec = mapTestOnTrain(resultM, trainY, testY, [10:10:500]);

[resultFined, resultNFined, FDistance] = reFine(trainX, testX, resultM, HDistance, 50);
map10 = mapTestOnTrain(resultFined, trainY, testY, [10])
compare(resultNFined, resultFined, trainL, testL);