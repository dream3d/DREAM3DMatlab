function [ Filter_Parts ] = GenerateGeometryConnectivity
Filter_Parts{1}{1} = 'GenerateVertexTriangleLists';
Filter_Parts{2}{1} = 'BooleanWidget';
Filter_Parts{1}{2} = 'GenerateTriangleNeighbors';
Filter_Parts{2}{2} = 'BooleanWidget';
Filter_Parts{1}{3} = 'SurfaceDataContainerName';
Filter_Parts{2}{3} = 'DataContainerSelectionWidget';
end