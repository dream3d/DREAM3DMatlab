function [ Filter_Parts ] = FindNeighborhoods
Filter_Parts{1}{1} = 'MultiplesOfAverage';
Filter_Parts{2}{1} = 'DoubleWidget';
Filter_Parts{1}{2} = 'EquivalentDiametersArrayPath';
Filter_Parts{2}{2} = 'DataArraySelectionWidget';
Filter_Parts{1}{3} = 'FeaturePhasesArrayPath';
Filter_Parts{2}{3} = 'DataArraySelectionWidget';
Filter_Parts{1}{4} = 'CentroidsArrayPath';
Filter_Parts{2}{4} = 'DataArraySelectionWidget';
Filter_Parts{1}{5} = 'NeighborhoodsArrayName';
Filter_Parts{2}{5} = 'StringWidget';
Filter_Parts{1}{6} = 'NeighborhoodListArrayName';
Filter_Parts{2}{6} = 'StringWidget';
end