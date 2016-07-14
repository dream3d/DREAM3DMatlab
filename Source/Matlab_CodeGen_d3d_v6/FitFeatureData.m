function [ Filter_Parts ] = FitFeatureData
Filter_Parts{1}{1} = 'DistributionType';
Filter_Parts{2}{1} = 'ChoiceWidget';
Filter_Parts{1}{2} = 'RemoveBiasedFeatures';
Filter_Parts{2}{2} = 'LinkedBooleanWidget';
Filter_Parts{1}{3} = 'SelectedFeatureArrayPath';
Filter_Parts{2}{3} = 'DataArraySelectionWidget';
Filter_Parts{1}{4} = 'FeaturePhasesArrayPath';
Filter_Parts{2}{4} = 'DataArraySelectionWidget';
Filter_Parts{1}{5} = 'BiasedFeaturesArrayPath';
Filter_Parts{2}{5} = 'DataArraySelectionWidget';
Filter_Parts{1}{6} = 'NewEnsembleArrayArray';
Filter_Parts{2}{6} = 'DataArrayCreationWidget';
end