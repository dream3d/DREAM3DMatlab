function [ Filter_Parts ] = CombineAttributeMatrices
Filter_Parts{1}{1} = 'FirstAttributeMatrixPath';
Filter_Parts{2}{1} = 'AttributeMatrixSelectionWidget';
Filter_Parts{1}{2} = 'SecondAttributeMatrixPath';
Filter_Parts{2}{2} = 'AttributeMatrixSelectionWidget';
Filter_Parts{1}{3} = 'FirstIndexArrayPath';
Filter_Parts{2}{3} = 'DataArraySelectionWidget';
Filter_Parts{1}{4} = 'SecondIndexArrayPath';
Filter_Parts{2}{4} = 'DataArraySelectionWidget';
Filter_Parts{1}{5} = 'NewIndexArrayName';
Filter_Parts{2}{5} = 'StringWidget';
Filter_Parts{1}{6} = 'CombinedAttributeMatrixName';
Filter_Parts{2}{6} = 'StringWidget';
end