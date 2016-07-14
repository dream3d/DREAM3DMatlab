function [ Filter_Parts ] = ChangeResolution
Filter_Parts{1}{1} = 'Resolution';
Filter_Parts{2}{1} = 'FloatVec3Widget';
Filter_Parts{1}{2} = 'RenumberFeatures';
Filter_Parts{2}{2} = 'LinkedBooleanWidget';
Filter_Parts{1}{3} = 'SaveAsNewDataContainer';
Filter_Parts{2}{3} = 'LinkedBooleanWidget';
Filter_Parts{1}{4} = 'CellAttributeMatrixPath';
Filter_Parts{2}{4} = 'AttributeMatrixSelectionWidget';
Filter_Parts{1}{5} = 'FeatureIdsArrayPath';
Filter_Parts{2}{5} = 'DataArraySelectionWidget';
Filter_Parts{1}{6} = 'CellFeatureAttributeMatrixPath';
Filter_Parts{2}{6} = 'AttributeMatrixSelectionWidget';
Filter_Parts{1}{7} = 'NewDataContainerName';
Filter_Parts{2}{7} = 'StringWidget';
end