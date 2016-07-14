function [ Filter_Parts ] = VtkStructuredPointsReader
Filter_Parts{1}{1} = 'InputFile';
Filter_Parts{2}{1} = 'InputFileWidget';
Filter_Parts{1}{2} = 'ReadPointData';
Filter_Parts{2}{2} = 'LinkedBooleanWidget';
Filter_Parts{1}{3} = 'ReadCellData';
Filter_Parts{2}{3} = 'LinkedBooleanWidget';
Filter_Parts{1}{4} = 'VertexDataContainerName';
Filter_Parts{2}{4} = 'StringWidget';
Filter_Parts{1}{5} = 'VolumeDataContainerName';
Filter_Parts{2}{5} = 'StringWidget';
Filter_Parts{1}{6} = 'VertexAttributeMatrixName';
Filter_Parts{2}{6} = 'StringWidget';
Filter_Parts{1}{7} = 'CellAttributeMatrixName';
Filter_Parts{2}{7} = 'StringWidget';
end