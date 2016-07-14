function [ Filter_Parts ] = FindProjectedImageStatistics
Filter_Parts{1}{1} = 'Plane';
Filter_Parts{2}{1} = 'ChoiceWidget';
Filter_Parts{1}{2} = 'SelectedArrayPath';
Filter_Parts{2}{2} = 'DataArraySelectionWidget';
Filter_Parts{1}{3} = 'ProjectedImageMinArrayName';
Filter_Parts{2}{3} = 'StringWidget';
Filter_Parts{1}{4} = 'ProjectedImageMaxArrayName';
Filter_Parts{2}{4} = 'StringWidget';
Filter_Parts{1}{5} = 'ProjectedImageAvgArrayName';
Filter_Parts{2}{5} = 'StringWidget';
Filter_Parts{1}{6} = 'ProjectedImageStdArrayName';
Filter_Parts{2}{6} = 'StringWidget';
Filter_Parts{1}{7} = 'ProjectedImageVarArrayName';
Filter_Parts{2}{7} = 'StringWidget';
end