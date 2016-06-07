%% mAP: function description
function [resultM, distM]  = queryTestOnTrain(trainB, testB)
	mTrain = size(trainB, 1);
	mTest = size(testB, 1);
	n = size(trainB, 2);


	distM = zeros(mTest, mTrain);
	resultM = zeros(mTest, mTrain);

	for i = 1: mTest
		testRow = testB(i, :);
		testExpand = ones(mTrain, 1) * testRow;
		diff = testExpand ~= trainB;
		diff = sum(diff, 2);
		distM(i, :) = diff';
		[~, I] = sort(diff);
		resultM(i, :) = I';
		distM(i, :) = diff(I');
	end