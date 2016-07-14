function [ Filter_Parts ] = WriteStatsGenOdfAngleFile
Filter_Parts{1}{1} = 'OutputFile';
Filter_Parts{2}{1} = 'OutputFileWidget';
Filter_Parts{1}{2} = 'ConvertToDegrees';
Filter_Parts{2}{2} = 'BooleanWidget';
Filter_Parts{1}{3} = 'UseGoodVoxels';
Filter_Parts{2}{3} = 'LinkedBooleanWidget';
Filter_Parts{1}{4} = 'CellEulerAnglesArrayPath';
Filter_Parts{2}{4} = 'DataArraySelectionWidget';
Filter_Parts{1}{5} = 'CellPhasesArrayPath';
Filter_Parts{2}{5} = 'DataArraySelectionWidget';
Filter_Parts{1}{6} = 'GoodVoxelsArrayPath';
Filter_Parts{2}{6} = 'DataArraySelectionWidget';
end