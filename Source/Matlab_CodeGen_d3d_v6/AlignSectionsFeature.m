function [ Filter_Parts ] = AlignSectionsFeature
Filter_Parts{1}{1} = 'WriteAlignmentShifts';
Filter_Parts{2}{1} = 'LinkedBooleanWidget';
Filter_Parts{1}{2} = 'AlignmentShiftFileName';
Filter_Parts{2}{2} = 'OutputFileWidget';
Filter_Parts{1}{3} = 'GoodVoxelsArrayPath';
Filter_Parts{2}{3} = 'DataArraySelectionWidget';
end