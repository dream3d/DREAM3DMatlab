function [ Filter_Parts ] = InsertAtoms
Filter_Parts{1}{1} = 'LatticeConstants';
Filter_Parts{2}{1} = 'FloatVec3Widget';
Filter_Parts{1}{2} = 'Basis';
Filter_Parts{2}{2} = 'ChoiceWidget';
Filter_Parts{1}{3} = 'SurfaceMeshFaceLabelsArrayPath';
Filter_Parts{2}{3} = 'DataArraySelectionWidget';
Filter_Parts{1}{4} = 'AvgQuatsArrayPath';
Filter_Parts{2}{4} = 'DataArraySelectionWidget';
Filter_Parts{1}{5} = 'VertexDataContainerName';
Filter_Parts{2}{5} = 'StringWidget';
Filter_Parts{1}{6} = 'VertexAttributeMatrixName';
Filter_Parts{2}{6} = 'StringWidget';
Filter_Parts{1}{7} = 'AtomFeatureLabelsArrayName';
Filter_Parts{2}{7} = 'StringWidget';
end