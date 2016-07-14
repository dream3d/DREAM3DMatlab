function [ Filter_Parts ] = FindFeatureReferenceCAxisMisorientations
Filter_Parts{1}{1} = 'FeatureIdsArrayPath';
Filter_Parts{2}{1} = 'DataArraySelectionWidget';
Filter_Parts{1}{2} = 'CellPhasesArrayPath';
Filter_Parts{2}{2} = 'DataArraySelectionWidget';
Filter_Parts{1}{3} = 'QuatsArrayPath';
Filter_Parts{2}{3} = 'DataArraySelectionWidget';
Filter_Parts{1}{4} = 'AvgCAxesArrayPath';
Filter_Parts{2}{4} = 'DataArraySelectionWidget';
Filter_Parts{1}{5} = 'FeatureAvgCAxisMisorientationsArrayName';
Filter_Parts{2}{5} = 'StringWidget';
Filter_Parts{1}{6} = 'FeatureStdevCAxisMisorientationsArrayName';
Filter_Parts{2}{6} = 'StringWidget';
Filter_Parts{1}{7} = 'FeatureReferenceCAxisMisorientationsArrayName';
Filter_Parts{2}{7} = 'StringWidget';
end