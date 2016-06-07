function mapVec = mapTestOnTrain(resultM, trainY, testY, nTopVec)
	mapResultM=trainY(resultM);
	mapVec=zeros(size(nTopVec));

	maxN = max(nTopVec);

	trainYSample = mapResultM(:, 1:maxN);
	testYEX = single(testY) * ones(1,maxN);

	fpMatrix = testYEX == trainYSample;

	for i = 1:length(nTopVec)
		nTop = nTopVec(i);
		temp = fpMatrix(:,1:nTop);
		pos = sum(temp);
		pos = sum(pos);
		mapVec(i) = pos / (size(temp, 1) * size(temp, 2));
	end 

	% nTop = 10;
	% temp = fpMatrix(:,1:nTop);
	% for i = 1:size(testY, 1)
	% 	testY(i)
	% 	mapResultM(i, 1:nTop)
	% 	pause
	% end