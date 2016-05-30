train_label_file='label-train.dat';
train_data_file='code-train.dat';
test_label_file='label-test.dat';
test_data_file='code-test.dat';

train_x = readBinary(train_data_file);
test_x = readBinary(test_data_file);
train_y = readBinary(train_label_file);
test_y = readBinary(test_label_file);


n = 12;

train_b = zeros(size(train_x));
train_b(train_x > 0) = 1;
test_b = zeros(size(test_x));
test_b(test_x > 0) = 1;
train_y = uint32(train_y);
test_y = uint32(test_y);

train_b = reshape(train_b, n, length(train_b) / n);
test_b = reshape(test_b, n, length(test_b) / n);

train_b = train_b';
test_b = test_b';

resultM = queryTestOnTrain(train_b,test_b);
mapVec = mapTestOnTrain(resultM, train_y, test_y);