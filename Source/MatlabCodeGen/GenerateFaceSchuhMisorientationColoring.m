function [ Filter_Parts ] = GenerateFaceSchuhMisorientationColoring
Filter_Parts{1}{1} = 'SurfaceMeshFaceLabelsArrayPath';
Filter_Parts{2}{1} = 'DataArraySelectionWidget';
Filter_Parts{1}{2} = 'AvgQuatsArrayPath';
Filter_Parts{2}{2} = 'DataArraySelectionWidget';
Filter_Parts{1}{3} = 'FeaturePhasesArrayPath';
Filter_Parts{2}{3} = 'DataArraySelectionWidget';
Filter_Parts{1}{4} = 'CrystalStructuresArrayPath';
Filter_Parts{2}{4} = 'DataArraySelectionWidget';
Filter_Parts{1}{5} = 'SurfaceMeshFaceSchuhMisorientationColorsArrayName';
Filter_Parts{2}{5} = 'StringWidget';
end