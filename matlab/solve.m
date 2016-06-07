trainBinaryFile = 'code-5613.dat';
% testBinaryFile = 'code-test.dat';
trainListFile = 'list5613.txt';
%testListFile = 'test.txt';
testListFile = 'query.txt';
testBinaryFile = 'query.dat';

featureDim = 18;

[trainX, trainY, trainL, trainB] = transform(trainBinaryFile, trainListFile, featureDim, 0);
[testX, testY, testL, testB] = transform(testBinaryFile, testListFile, featureDim, 0);

[resultM, HDistance] = queryTestOnTrain(trainB,testB);
% mapVec = mapTestOnTrain(resultM, trainY, testY, [10:10:500]);

[resultFined, resultNFined, FDistance] = reFine(trainX, testX, resultM, HDistance, 50);
% map10 = mapTestOnTrain(resultFined, trainY, testY, [10])
compare(resultNFined, resultFined, trainL, testL);

% fid = fopen('result.txt', 'w');
% for i = 1:size(testL, 1)
% 	indecies = resultFined(i, 1:10);
% 	resultNames = trainL(indecies);
% 	for j = 1: 10
% 		fprintf(fid, '%s ', resultNames{j});
% 	end
% 	fprintf(fid, '\n');
% end
% fclose(fid);