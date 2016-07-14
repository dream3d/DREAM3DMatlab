function [ Filter_Parts ] = GenerateIPFColors
Filter_Parts{1}{1} = 'ReferenceDir';
Filter_Parts{2}{1} = 'FloatVec3Widget';
Filter_Parts{1}{2} = 'UseGoodVoxels';
Filter_Parts{2}{2} = 'LinkedBooleanWidget';
Filter_Parts{1}{3} = 'CellEulerAnglesArrayPath';
Filter_Parts{2}{3} = 'DataArraySelectionWidget';
Filter_Parts{1}{4} = 'CellPhasesArrayPath';
Filter_Parts{2}{4} = 'DataArraySelectionWidget';
Filter_Parts{1}{5} = 'GoodVoxelsArrayPath';
Filter_Parts{2}{5} = 'DataArraySelectionWidget';
Filter_Parts{1}{6} = 'CrystalStructuresArrayPath';
Filter_Parts{2}{6} = 'DataArraySelectionWidget';
Filter_Parts{1}{7} = 'CellIPFColorsArrayName';
Filter_Parts{2}{7} = 'StringWidget';
end