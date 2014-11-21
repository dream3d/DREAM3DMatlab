function [ Filter_Parts ] = GenerateSurfaceMeshConnectivity
Filter_Parts{1}{1} = 'GenerateVertexTriangleLists';
Filter_Parts{2}{1} = 'BooleanWidget';
Filter_Parts{1}{2} = 'GenerateTriangleNeighbors';
Filter_Parts{2}{2} = 'BooleanWidget';
Filter_Parts{1}{3} = 'GenerateEdgeIdList';
Filter_Parts{2}{3} = 'BooleanWidget';
Filter_Parts{1}{4} = 'SurfaceDataContainerName';
Filter_Parts{2}{4} = 'DataContainerSelectionWidget';
end