%% functionname: function description
function [X Y L B] = transform(binaryFile, listFile, featureDim, needShuffle)
	data = importdata(listFile);
	Y = data.data;
	L = data.textdata;

	m = size(Y, 1);
	X = readBinary(binaryFile);
	X = X(1:featureDim * m, :);
	X = reshape(X, [featureDim m]);
	X = X';

	B = zeros(m, featureDim);
	B(X > 0) = 1;
	if needShuffle == 1
		R=randperm(m);
		X=X(R,:);
		Y=Y(R,:);
		L=L(R, :);
		B=B(R, :);
	end