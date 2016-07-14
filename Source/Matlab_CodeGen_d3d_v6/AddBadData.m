function [ Filter_Parts ] = AddBadData
Filter_Parts{1}{1} = 'PoissonNoise';
Filter_Parts{2}{1} = 'LinkedBooleanWidget';
Filter_Parts{1}{2} = 'PoissonVolFraction';
Filter_Parts{2}{2} = 'DoubleWidget';
Filter_Parts{1}{3} = 'BoundaryNoise';
Filter_Parts{2}{3} = 'LinkedBooleanWidget';
Filter_Parts{1}{4} = 'BoundaryVolFraction';
Filter_Parts{2}{4} = 'DoubleWidget';
Filter_Parts{1}{5} = 'GBEuclideanDistancesArrayPath';
Filter_Parts{2}{5} = 'DataArraySelectionWidget';
end