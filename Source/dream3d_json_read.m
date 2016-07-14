function [ pipeline_filters, banner ] = dream3d_json_read( json_file )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here



json_file = json_file{1}(2:length(json_file{1})-1);

filter_number_location = cellfun(@(x) x(5)=='"',json_file,'UniformOutput',false);
filter_number_location = find(cellfun(@(x) x==1,filter_number_location));
%actual_location = filter_number_location + 1

for ii = 1:length(filter_number_location)-1

    pipeline_filters{ii} = json_file(filter_number_location(ii):filter_number_location(ii+1)-1);
end

banner = json_file(filter_number_location(ii+1):end);





% first_line = {'{'};
% last_line = {'}'};
% edited_file{1} = [first_line; json_file; last_line];






end
