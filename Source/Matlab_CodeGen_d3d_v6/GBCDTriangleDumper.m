function [ Filter_Parts ] = GBCDTriangleDumper
Filter_Parts{1}{1} = 'OutputFile';
Filter_Parts{2}{1} = 'OutputFileWidget';
Filter_Parts{1}{2} = 'SurfaceMeshFaceLabelsArrayPath';
Filter_Parts{2}{2} = 'DataArraySelectionWidget';
Filter_Parts{1}{3} = 'SurfaceMeshFaceNormalsArrayPath';
Filter_Parts{2}{3} = 'DataArraySelectionWidget';
Filter_Parts{1}{4} = 'SurfaceMeshFaceAreasArrayPath';
Filter_Parts{2}{4} = 'DataArraySelectionWidget';
Filter_Parts{1}{5} = 'FeatureEulerAnglesArrayPath';
Filter_Parts{2}{5} = 'DataArraySelectionWidget';
end