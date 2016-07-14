function [ Filter_Parts ] = FindTwinBoundarySchmidFactors
Filter_Parts{1}{1} = 'LoadingDir';
Filter_Parts{2}{1} = 'FloatVec3Widget';
Filter_Parts{1}{2} = 'WriteFile';
Filter_Parts{2}{2} = 'LinkedBooleanWidget';
Filter_Parts{1}{3} = 'TwinBoundarySchmidFactorsFile';
Filter_Parts{2}{3} = 'OutputFileWidget';
Filter_Parts{1}{4} = 'AvgQuatsArrayPath';
Filter_Parts{2}{4} = 'DataArraySelectionWidget';
Filter_Parts{1}{5} = 'FeaturePhasesArrayPath';
Filter_Parts{2}{5} = 'DataArraySelectionWidget';
Filter_Parts{1}{6} = 'CrystalStructuresArrayPath';
Filter_Parts{2}{6} = 'DataArraySelectionWidget';
Filter_Parts{1}{7} = 'SurfaceMeshFaceLabelsArrayPath';
Filter_Parts{2}{7} = 'DataArraySelectionWidget';
Filter_Parts{1}{8} = 'SurfaceMeshFaceNormalsArrayPath';
Filter_Parts{2}{8} = 'DataArraySelectionWidget';
Filter_Parts{1}{9} = 'SurfaceMeshTwinBoundaryArrayPath';
Filter_Parts{2}{9} = 'DataArraySelectionWidget';
Filter_Parts{1}{10} = 'SurfaceMeshTwinBoundarySchmidFactorsArrayName';
Filter_Parts{2}{10} = 'StringWidget';
end