function [ Filter_Parts ] = AddOrientationNoise
Filter_Parts{1}{1} = 'Magnitude';
Filter_Parts{2}{1} = 'DoubleWidget';
Filter_Parts{1}{2} = 'CellEulerAnglesArrayPath';
Filter_Parts{2}{2} = 'DataArraySelectionWidget';
end