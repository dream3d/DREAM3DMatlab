function [ Filter_Parts ] = RemoveFlaggedFeatures
Filter_Parts{1}{1} = 'FillRemovedFeatures';
Filter_Parts{2}{1} = 'BooleanWidget';
Filter_Parts{1}{2} = 'FeatureIdsArrayPath';
Filter_Parts{2}{2} = 'DataArraySelectionWidget';
Filter_Parts{1}{3} = 'FlaggedFeaturesArrayPath';
Filter_Parts{2}{3} = 'DataArraySelectionWidget';
end