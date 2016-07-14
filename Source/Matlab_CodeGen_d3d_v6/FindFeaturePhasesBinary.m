function [ Filter_Parts ] = FindFeaturePhasesBinary
Filter_Parts{1}{1} = 'FeatureIdsArrayPath';
Filter_Parts{2}{1} = 'DataArraySelectionWidget';
Filter_Parts{1}{2} = 'GoodVoxelsArrayPath';
Filter_Parts{2}{2} = 'DataArraySelectionWidget';
Filter_Parts{1}{3} = 'FeaturePhasesArrayPath';
Filter_Parts{2}{3} = 'DataArrayCreationWidget';
Filter_Parts{1}{4} = 'CellEnsembleAttributeMatrixName';
Filter_Parts{2}{4} = 'StringWidget';
end