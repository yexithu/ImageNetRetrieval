%% reFine: function description
function [fined, nfined FDistance] = reFine(trainX, testX, resultM, HDistance, ntop)
	% resultM = resultM(:, 1: ntop);

	mTest = size(testX, 1);
	fined = zeros(mTest, ntop);
	nfined = zeros(mTest, ntop);
	FDistance = zeros(mTest, ntop);

	for i = 1: mTest		
		rowDistance = HDistance(i, :);
		minDistance = min(rowDistance);
		temp = rowDistance == minDistance;
		rowDistance(temp) = inf;
		[~,k] = min(rowDistance);
		k = k - 1;
		if(k < ntop)
			k = ntop;
		end
		indecies = resultM(i, 1:k);

		R=randperm(k);
		R=R(1:ntop);
		nfined(i,:) = indecies(R');
		candidates = trainX(indecies, :);

		diff = pdist2(testX(i,:), candidates);		
		[~, I] = sort(diff);
		I = I(1: ntop);
		fined(i, :) = indecies(I');
		FDistance(i, :) = diff(I');
	end