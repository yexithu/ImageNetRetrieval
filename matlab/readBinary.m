function outputs = readBinary(fileName)
	fid = fopen(fileName);
	outputs = fread(fid, 'single');
	fclose(fid);
