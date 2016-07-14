function [ Filter_Parts ] = FindBoundingBoxFeatures
Filter_Parts{1}{1} = 'CalcByPhase';
Filter_Parts{2}{1} = 'LinkedBooleanWidget';
Filter_Parts{1}{2} = 'CentroidsArrayPath';
Filter_Parts{2}{2} = 'DataArraySelectionWidget';
Filter_Parts{1}{3} = 'SurfaceFeaturesArrayPath';
Filter_Parts{2}{3} = 'DataArraySelectionWidget';
Filter_Parts{1}{4} = 'PhasesArrayPath';
Filter_Parts{2}{4} = 'DataArraySelectionWidget';
Filter_Parts{1}{5} = 'BiasedFeaturesArrayName';
Filter_Parts{2}{5} = 'StringWidget';
end