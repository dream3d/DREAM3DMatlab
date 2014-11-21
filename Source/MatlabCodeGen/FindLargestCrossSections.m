function [ Filter_Parts ] = FindLargestCrossSections
Filter_Parts{1}{1} = 'Plane';
Filter_Parts{2}{1} = 'ChoiceWidget';
Filter_Parts{1}{2} = 'FeatureIdsArrayPath';
Filter_Parts{2}{2} = 'DataArraySelectionWidget';
Filter_Parts{1}{3} = 'CellFeatureAttributeMatrixName';
Filter_Parts{2}{3} = 'AttributeMatrixSelectionWidget';
Filter_Parts{1}{4} = 'LargestCrossSectionsArrayName';
Filter_Parts{2}{4} = 'StringWidget';
end