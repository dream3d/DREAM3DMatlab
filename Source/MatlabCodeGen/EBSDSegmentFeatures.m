function [ Filter_Parts ] = EBSDSegmentFeatures
Filter_Parts{1}{1} = 'MisorientationTolerance';
Filter_Parts{2}{1} = 'DoubleWidget';
Filter_Parts{1}{2} = 'CellPhasesArrayPath';
Filter_Parts{2}{2} = 'DataArraySelectionWidget';
Filter_Parts{1}{3} = 'CrystalStructuresArrayPath';
Filter_Parts{2}{3} = 'DataArraySelectionWidget';
Filter_Parts{1}{4} = 'QuatsArrayPath';
Filter_Parts{2}{4} = 'DataArraySelectionWidget';
Filter_Parts{1}{5} = 'UseGoodVoxels';
Filter_Parts{2}{5} = 'LinkedBooleanWidget';
Filter_Parts{1}{6} = 'GoodVoxelsArrayPath';
Filter_Parts{2}{6} = 'DataArraySelectionWidget';
Filter_Parts{1}{7} = 'FeatureIdsArrayName';
Filter_Parts{2}{7} = 'StringWidget';
Filter_Parts{1}{8} = 'CellFeatureAttributeMatrixName';
Filter_Parts{2}{8} = 'StringWidget';
Filter_Parts{1}{9} = 'ActiveArrayName';
Filter_Parts{2}{9} = 'StringWidget';
end