function [ Filter_Parts ] = SurfaceMeshToNodesTrianglesEdges
Filter_Parts{1}{1} = 'OutputNodesFile';
Filter_Parts{2}{1} = 'OutputFileWidget';
Filter_Parts{1}{2} = 'OutputTrianglesFile';
Filter_Parts{2}{2} = 'OutputFileWidget';
Filter_Parts{1}{3} = 'SurfaceMeshFaceLabelsArrayPath';
Filter_Parts{2}{3} = 'DataArraySelectionWidget';
Filter_Parts{1}{4} = 'SurfaceMeshNodeTypeArrayPath';
Filter_Parts{2}{4} = 'DataArraySelectionWidget';
end