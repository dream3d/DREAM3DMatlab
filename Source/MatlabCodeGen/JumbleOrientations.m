function [ Filter_Parts ] = JumbleOrientations
Filter_Parts{1}{1} = 'FeatureIdsArrayPath';
Filter_Parts{2}{1} = 'DataArraySelectionWidget';
Filter_Parts{1}{2} = 'FeatureEulerAnglesArrayPath';
Filter_Parts{2}{2} = 'DataArraySelectionWidget';
Filter_Parts{1}{3} = 'FeaturePhasesArrayPath';
Filter_Parts{2}{3} = 'DataArraySelectionWidget';
Filter_Parts{1}{4} = 'CellEulerAnglesArrayName';
Filter_Parts{2}{4} = 'StringWidget';
Filter_Parts{1}{5} = 'AvgQuatsArrayName';
Filter_Parts{2}{5} = 'StringWidget';
end