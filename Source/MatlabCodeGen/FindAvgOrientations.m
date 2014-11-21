function [ Filter_Parts ] = FindAvgOrientations
Filter_Parts{1}{1} = 'FeatureIdsArrayPath';
Filter_Parts{2}{1} = 'DataArraySelectionWidget';
Filter_Parts{1}{2} = 'CellPhasesArrayPath';
Filter_Parts{2}{2} = 'DataArraySelectionWidget';
Filter_Parts{1}{3} = 'QuatsArrayPath';
Filter_Parts{2}{3} = 'DataArraySelectionWidget';
Filter_Parts{1}{4} = 'CrystalStructuresArrayPath';
Filter_Parts{2}{4} = 'DataArraySelectionWidget';
Filter_Parts{1}{5} = 'CellFeatureAttributeMatrixName';
Filter_Parts{2}{5} = 'AttributeMatrixSelectionWidget';
Filter_Parts{1}{6} = 'AvgQuatsArrayName';
Filter_Parts{2}{6} = 'StringWidget';
Filter_Parts{1}{7} = 'FeatureEulerAnglesArrayName';
Filter_Parts{2}{7} = 'StringWidget';
end