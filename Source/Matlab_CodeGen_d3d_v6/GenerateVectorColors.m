function [ Filter_Parts ] = GenerateVectorColors
Filter_Parts{1}{1} = 'UseGoodVoxels';
Filter_Parts{2}{1} = 'LinkedBooleanWidget';
Filter_Parts{1}{2} = 'VectorsArrayPath';
Filter_Parts{2}{2} = 'DataArraySelectionWidget';
Filter_Parts{1}{3} = 'GoodVoxelsArrayPath';
Filter_Parts{2}{3} = 'DataArraySelectionWidget';
Filter_Parts{1}{4} = 'CellVectorColorsArrayName';
Filter_Parts{2}{4} = 'StringWidget';
end