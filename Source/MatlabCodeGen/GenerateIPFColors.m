function [ Filter_Parts ] = GenerateIPFColors
Filter_Parts{1}{1} = 'ReferenceDir';
Filter_Parts{2}{1} = 'FloatVec3Widget';
Filter_Parts{1}{2} = 'CellPhasesArrayPath';
Filter_Parts{2}{2} = 'DataArraySelectionWidget';
Filter_Parts{1}{3} = 'CellEulerAnglesArrayPath';
Filter_Parts{2}{3} = 'DataArraySelectionWidget';
Filter_Parts{1}{4} = 'CrystalStructuresArrayPath';
Filter_Parts{2}{4} = 'DataArraySelectionWidget';
Filter_Parts{1}{5} = 'UseGoodVoxels';
Filter_Parts{2}{5} = 'LinkedBooleanWidget';
Filter_Parts{1}{6} = 'GoodVoxelsArrayPath';
Filter_Parts{2}{6} = 'DataArraySelectionWidget';
Filter_Parts{1}{7} = 'CellIPFColorsArrayName';
Filter_Parts{2}{7} = 'StringWidget';
end