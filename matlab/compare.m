%% compare: function description
function compare(resultM, resultR, trainList, testList)

	ntop = 10;
	mTest = size(testList, 1);

	imageroot = '../image/';
	imsize = 200;

	for i = 1:mTest
		rm = resultM(i, 1:ntop);
		rr = resultR(i, 1:ntop);

		picRM = makePic(trainList, rm, ntop, imageroot);
		picRR = makePic(trainList, rr, ntop, imageroot);

		picA = [picRM ; picRR];	

		name = strcat(imageroot, testList{i});
		temp = imread(name);
		temp = imresize(temp, [imsize*2 imsize*2]);

		temp = [zeros(200, 400, 3);temp;zeros(200, 400, 3)];
		picAll = [temp picA];
		imshow(picAll);
		pause

	end
end

function pic = makePic(trainL, r, ntop, imgroot)
	imsize = 200;
	pic = zeros(imsize, imsize * ntop, 3);
	picUp = [];
	picDown = [];
	for i = 1:ntop
		name = strcat(imgroot, trainL{r(i)});
		temp = imread(name);		
		temp = imresize(temp, [imsize imsize]);
		if i <= ntop/2
			picUp = [picUp temp];
		end
		if i > ntop/2
			picDown = [picDown temp];
		end
	end
	pic = [picUp; picDown];
end