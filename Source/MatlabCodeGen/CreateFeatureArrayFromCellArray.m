function [ Filter_Parts ] = CreateFeatureArrayFromCellArray
Filter_Parts{1}{1} = 'SelectedCellArrayPath';
Filter_Parts{2}{1} = 'DataArraySelectionWidget';
Filter_Parts{1}{2} = 'FeatureIdsArrayPath';
Filter_Parts{2}{2} = 'DataArraySelectionWidget';
Filter_Parts{1}{3} = 'CellFeatureAttributeMatrixName';
Filter_Parts{2}{3} = 'AttributeMatrixSelectionWidget';
end