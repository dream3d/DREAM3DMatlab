function [ Filter_Parts ] = AlignSectionsFeatureCentroid
Filter_Parts{1}{1} = 'WriteAlignmentShifts';
Filter_Parts{2}{1} = 'LinkedBooleanWidget';
Filter_Parts{1}{2} = 'SubtractBackground';
Filter_Parts{2}{2} = 'BooleanWidget';
Filter_Parts{1}{3} = 'AlignmentShiftFileName';
Filter_Parts{2}{3} = 'OutputFileWidget';
Filter_Parts{1}{4} = 'UseReferenceSlice';
Filter_Parts{2}{4} = 'LinkedBooleanWidget';
Filter_Parts{1}{5} = 'ReferenceSlice';
Filter_Parts{2}{5} = 'IntWidget';
Filter_Parts{1}{6} = 'GoodVoxelsArrayPath';
Filter_Parts{2}{6} = 'DataArraySelectionWidget';
end