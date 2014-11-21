function [ Filter_Parts ] = SurfaceMeshToNonconformalVtk
Filter_Parts{1}{1} = 'OutputVtkFile';
Filter_Parts{2}{1} = 'OutputFileWidget';
Filter_Parts{1}{2} = 'WriteBinaryFile';
Filter_Parts{2}{2} = 'BooleanWidget';
Filter_Parts{1}{3} = 'SurfaceMeshFaceLabelsArrayPath';
Filter_Parts{2}{3} = 'DataArraySelectionWidget';
Filter_Parts{1}{4} = 'SurfaceMeshNodeTypeArrayPath';
Filter_Parts{2}{4} = 'DataArraySelectionWidget';
end