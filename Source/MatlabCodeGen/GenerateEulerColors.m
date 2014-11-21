function [ Filter_Parts ] = GenerateEulerColors
Filter_Parts{1}{1} = 'CellPhasesArrayPath';
Filter_Parts{2}{1} = 'DataArraySelectionWidget';
Filter_Parts{1}{2} = 'CrystalStructuresArrayPath';
Filter_Parts{2}{2} = 'DataArraySelectionWidget';
Filter_Parts{1}{3} = 'CellEulerAnglesArrayPath';
Filter_Parts{2}{3} = 'DataArraySelectionWidget';
Filter_Parts{1}{4} = 'UseGoodVoxels';
Filter_Parts{2}{4} = 'LinkedBooleanWidget';
Filter_Parts{1}{5} = 'GoodVoxelsArrayPath';
Filter_Parts{2}{5} = 'DataArraySelectionWidget';
Filter_Parts{1}{6} = 'CellEulerColorsArrayName';
Filter_Parts{2}{6} = 'StringWidget';
end