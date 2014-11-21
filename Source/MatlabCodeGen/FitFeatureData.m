function [ Filter_Parts ] = FitFeatureData
Filter_Parts{1}{1} = 'SelectedFeatureArrayPath';
Filter_Parts{2}{1} = 'DataArraySelectionWidget';
Filter_Parts{1}{2} = 'DistributionType';
Filter_Parts{2}{2} = 'ChoiceWidget';
Filter_Parts{1}{3} = 'RemoveBiasedFeatures';
Filter_Parts{2}{3} = 'LinkedBooleanWidget';
Filter_Parts{1}{4} = 'FeaturePhasesArrayPath';
Filter_Parts{2}{4} = 'DataArraySelectionWidget';
Filter_Parts{1}{5} = 'BiasedFeaturesArrayPath';
Filter_Parts{2}{5} = 'DataArraySelectionWidget';
Filter_Parts{1}{6} = 'CellEnsembleAttributeMatrixName';
Filter_Parts{2}{6} = 'AttributeMatrixSelectionWidget';
Filter_Parts{1}{7} = 'NewEnsembleArrayArrayName';
Filter_Parts{2}{7} = 'StringWidget';
end