function [ Filter_Parts ] = FindMisorientations
Filter_Parts{1}{1} = 'FindAvgMisors';
Filter_Parts{2}{1} = 'LinkedBooleanWidget';
Filter_Parts{1}{2} = 'NeighborListArrayPath';
Filter_Parts{2}{2} = 'DataArraySelectionWidget';
Filter_Parts{1}{3} = 'AvgQuatsArrayPath';
Filter_Parts{2}{3} = 'DataArraySelectionWidget';
Filter_Parts{1}{4} = 'FeaturePhasesArrayPath';
Filter_Parts{2}{4} = 'DataArraySelectionWidget';
Filter_Parts{1}{5} = 'CrystalStructuresArrayPath';
Filter_Parts{2}{5} = 'DataArraySelectionWidget';
Filter_Parts{1}{6} = 'MisorientationListArrayName';
Filter_Parts{2}{6} = 'StringWidget';
Filter_Parts{1}{7} = 'AvgMisorientationsArrayName';
Filter_Parts{2}{7} = 'StringWidget';
end