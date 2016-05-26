%% mAP: function description
function [distM resultM] = mAP(trainB, testB, trainY, testY)
	mTrain = size(trainB, 1);
	mTest = size(testB, 1);
	n = size(trainB, 2);


	distM = zeros(mTest, mTrain);
	resultM = zeros(mTest, mTrain);

	for i = 1: mTest
		fprintf('Ha Ha %d\n', i);
		testRow = testB(i, :);
		testExpand = ones(mTrain, 1) * testRow;
		diff = testExpand ~= trainB;
		diff = sum(diff, 2);
		distM(i, :) = diff';
		[~, I] = sort(diff);
		resultM(i, :) = I';
	end

		// nTops = [10:10:500];
		// s = lenght(nTops);
		// mAPs= zeros(1, s);

		// for i = 1: s
		// 	nTop = nTops(i);
		// 	for j = 1:mTest
				
		// 	end
		// end 