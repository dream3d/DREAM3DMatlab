function [ Filter_Parts ] = AlignSectionsList
Filter_Parts{1}{1} = 'InputFile';
Filter_Parts{2}{1} = 'InputFileWidget';
Filter_Parts{1}{2} = 'WriteAlignmentShifts';
Filter_Parts{2}{2} = 'LinkedBooleanWidget';
Filter_Parts{1}{3} = 'SubtractBackground';
Filter_Parts{2}{3} = 'BooleanWidget';
Filter_Parts{1}{4} = 'AlignmentShiftFileName';
Filter_Parts{2}{4} = 'OutputFileWidget';
end