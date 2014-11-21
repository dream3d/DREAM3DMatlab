function [ Filter_Parts ] = GenerateMisorientationColors
Filter_Parts{1}{1} = 'ReferenceAxis';
Filter_Parts{2}{1} = 'FloatVec3Widget';
Filter_Parts{1}{2} = 'ReferenceAngle';
Filter_Parts{2}{2} = 'DoubleWidget';
Filter_Parts{1}{3} = 'CellPhasesArrayPath';
Filter_Parts{2}{3} = 'DataArraySelectionWidget';
Filter_Parts{1}{4} = 'QuatsArrayPath';
Filter_Parts{2}{4} = 'DataArraySelectionWidget';
Filter_Parts{1}{5} = 'CrystalStructuresArrayPath';
Filter_Parts{2}{5} = 'DataArraySelectionWidget';
Filter_Parts{1}{6} = 'UseGoodVoxels';
Filter_Parts{2}{6} = 'LinkedBooleanWidget';
Filter_Parts{1}{7} = 'GoodVoxelsArrayPath';
Filter_Parts{2}{7} = 'DataArraySelectionWidget';
Filter_Parts{1}{8} = 'MisorientationColorArrayName';
Filter_Parts{2}{8} = 'StringWidget';
end