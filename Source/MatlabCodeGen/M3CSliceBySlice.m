function [ Filter_Parts ] = M3CSliceBySlice
Filter_Parts{1}{1} = 'DeleteTempFiles';
Filter_Parts{2}{1} = 'BooleanWidget';
Filter_Parts{1}{2} = 'FeatureIdsArrayPath';
Filter_Parts{2}{2} = 'DataArraySelectionWidget';
Filter_Parts{1}{3} = 'SurfaceDataContainerName';
Filter_Parts{2}{3} = 'StringWidget';
Filter_Parts{1}{4} = 'VertexAttributeMatrixName';
Filter_Parts{2}{4} = 'StringWidget';
Filter_Parts{1}{5} = 'FaceAttributeMatrixName';
Filter_Parts{2}{5} = 'StringWidget';
Filter_Parts{1}{6} = 'FaceLabelsArrayName';
Filter_Parts{2}{6} = 'StringWidget';
Filter_Parts{1}{7} = 'SurfaceMeshNodeTypesArrayName';
Filter_Parts{2}{7} = 'StringWidget';
end