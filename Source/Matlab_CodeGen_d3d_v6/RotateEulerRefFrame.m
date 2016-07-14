function [ Filter_Parts ] = RotateEulerRefFrame
Filter_Parts{1}{1} = 'RotationAxis';
Filter_Parts{2}{1} = 'FloatVec3Widget';
Filter_Parts{1}{2} = 'RotationAngle';
Filter_Parts{2}{2} = 'DoubleWidget';
Filter_Parts{1}{3} = 'CellEulerAnglesArrayPath';
Filter_Parts{2}{3} = 'DataArraySelectionWidget';
end