function [ Filter_Parts ] = PackPrimaryPhases
Filter_Parts{1}{1} = 'PeriodicBoundaries';
Filter_Parts{2}{1} = 'BooleanWidget';
Filter_Parts{1}{2} = 'UseMask';
Filter_Parts{2}{2} = 'LinkedBooleanWidget';
Filter_Parts{1}{3} = 'OutputCellAttributeMatrixPath';
Filter_Parts{2}{3} = 'AttributeMatrixSelectionWidget';
Filter_Parts{1}{4} = 'MaskArrayPath';
Filter_Parts{2}{4} = 'DataArraySelectionWidget';
Filter_Parts{1}{5} = 'InputStatsArrayPath';
Filter_Parts{2}{5} = 'DataArraySelectionWidget';
Filter_Parts{1}{6} = 'InputPhaseTypesArrayPath';
Filter_Parts{2}{6} = 'DataArraySelectionWidget';
Filter_Parts{1}{7} = 'InputShapeTypesArrayPath';
Filter_Parts{2}{7} = 'DataArraySelectionWidget';
Filter_Parts{1}{8} = 'FeatureIdsArrayName';
Filter_Parts{2}{8} = 'StringWidget';
Filter_Parts{1}{9} = 'CellPhasesArrayName';
Filter_Parts{2}{9} = 'StringWidget';
Filter_Parts{1}{10} = 'OutputCellFeatureAttributeMatrixName';
Filter_Parts{2}{10} = 'StringWidget';
Filter_Parts{1}{11} = 'FeaturePhasesArrayName';
Filter_Parts{2}{11} = 'StringWidget';
Filter_Parts{1}{12} = 'OutputCellEnsembleAttributeMatrixName';
Filter_Parts{2}{12} = 'StringWidget';
Filter_Parts{1}{13} = 'NumFeaturesArrayName';
Filter_Parts{2}{13} = 'StringWidget';
Filter_Parts{1}{14} = 'HaveFeatures';
Filter_Parts{2}{14} = 'LinkedBooleanWidget';
Filter_Parts{1}{15} = 'FeatureInputFile';
Filter_Parts{2}{15} = 'InputFileWidget';
Filter_Parts{1}{16} = 'WriteGoalAttributes';
Filter_Parts{2}{16} = 'LinkedBooleanWidget';
Filter_Parts{1}{17} = 'CsvOutputFile';
Filter_Parts{2}{17} = 'OutputFileWidget';
end