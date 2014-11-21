function [ Filter_Parts ] = NodesTrianglesToVtk
Filter_Parts{1}{1} = 'NodesFile';
Filter_Parts{2}{1} = 'InputFileWidget';
Filter_Parts{1}{2} = 'TrianglesFile';
Filter_Parts{2}{2} = 'InputFileWidget';
Filter_Parts{1}{3} = 'OutputVtkFile';
Filter_Parts{2}{3} = 'OutputFileWidget';
Filter_Parts{1}{4} = 'WriteBinaryFile';
Filter_Parts{2}{4} = 'BooleanWidget';
Filter_Parts{1}{5} = 'WriteConformalMesh';
Filter_Parts{2}{5} = 'BooleanWidget';
end