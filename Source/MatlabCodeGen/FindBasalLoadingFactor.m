function [ Filter_Parts ] = FindBasalLoadingFactor
Filter_Parts{1}{1} = 'LoadingDirection';
Filter_Parts{2}{1} = 'FloatVec3Widget';
Filter_Parts{1}{2} = 'AvgQuatsArrayPath';
Filter_Parts{2}{2} = 'DataArraySelectionWidget';
Filter_Parts{1}{3} = 'FeaturePhasesArrayPath';
Filter_Parts{2}{3} = 'DataArraySelectionWidget';
Filter_Parts{1}{4} = 'CrystalStructuresArrayPath';
Filter_Parts{2}{4} = 'DataArraySelectionWidget';
Filter_Parts{1}{5} = 'CellFeatureAttributeMatrixName';
Filter_Parts{2}{5} = 'AttributeMatrixSelectionWidget';
Filter_Parts{1}{6} = 'BasalLoadingFactorArrayName';
Filter_Parts{2}{6} = 'StringWidget';
end