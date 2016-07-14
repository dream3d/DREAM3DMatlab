function [ Filter_Parts ] = AlignSectionsFeatureCentroid
Filter_Parts{1}{1} = 'WriteAlignmentShifts';
Filter_Parts{2}{1} = 'LinkedBooleanWidget';
Filter_Parts{1}{2} = 'AlignmentShiftFileName';
Filter_Parts{2}{2} = 'OutputFileWidget';
Filter_Parts{1}{3} = 'UseReferenceSlice';
Filter_Parts{2}{3} = 'LinkedBooleanWidget';
Filter_Parts{1}{4} = 'ReferenceSlice';
Filter_Parts{2}{4} = 'IntWidget';
Filter_Parts{1}{5} = 'GoodVoxelsArrayPath';
Filter_Parts{2}{5} = 'DataArraySelectionWidget';
end