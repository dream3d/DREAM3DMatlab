function [ Filter_Parts ] = GenerateFaceIPFColoring
Filter_Parts{1}{1} = 'SurfaceMeshFaceLabelsArrayPath';
Filter_Parts{2}{1} = 'DataArraySelectionWidget';
Filter_Parts{1}{2} = 'SurfaceMeshFaceNormalsArrayPath';
Filter_Parts{2}{2} = 'DataArraySelectionWidget';
Filter_Parts{1}{3} = 'FeatureEulerAnglesArrayPath';
Filter_Parts{2}{3} = 'DataArraySelectionWidget';
Filter_Parts{1}{4} = 'FeaturePhasesArrayPath';
Filter_Parts{2}{4} = 'DataArraySelectionWidget';
Filter_Parts{1}{5} = 'CrystalStructuresArrayPath';
Filter_Parts{2}{5} = 'DataArraySelectionWidget';
Filter_Parts{1}{6} = 'SurfaceMeshFaceIPFColorsArrayName';
Filter_Parts{2}{6} = 'StringWidget';
end