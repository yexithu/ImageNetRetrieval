%% functionname: function description
function [labels, numFeature] = text2label(labelText)
	m = size(labelText, 1);

	labels = zeros(m, 1, 'uint8');
	numFeature = 0;

	lastText = '';
	label = -1;

	for i = 1:m
		temp = strsplit(labelText{i}, '_');
		thisText = temp{1};
		if strcmp(lastText, thisText) == 0
			label = label + 1;
		end

		labels(i) = label;
		lastText = thisText;
	end
	numFeature = label + 1;
end