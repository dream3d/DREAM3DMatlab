function [ Filter_Parts ] = MinNeighbors
Filter_Parts{1}{1} = 'MinNumNeighbors';
Filter_Parts{2}{1} = 'IntWidget';
Filter_Parts{1}{2} = 'ApplyToSinglePhase';
Filter_Parts{2}{2} = 'LinkedBooleanWidget';
Filter_Parts{1}{3} = 'PhaseNumber';
Filter_Parts{2}{3} = 'IntWidget';
Filter_Parts{1}{4} = 'FeatureIdsArrayPath';
Filter_Parts{2}{4} = 'DataArraySelectionWidget';
Filter_Parts{1}{5} = 'FeaturePhasesArrayPath';
Filter_Parts{2}{5} = 'DataArraySelectionWidget';
Filter_Parts{1}{6} = 'NumNeighborsArrayPath';
Filter_Parts{2}{6} = 'DataArraySelectionWidget';
end