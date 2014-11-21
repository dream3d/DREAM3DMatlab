function [ Filter_Parts ] = NodesTrianglesToStl
Filter_Parts{1}{1} = 'NodesFile';
Filter_Parts{2}{1} = 'InputFileWidget';
Filter_Parts{1}{2} = 'TrianglesFile';
Filter_Parts{2}{2} = 'InputFileWidget';
Filter_Parts{1}{3} = 'OutputStlDirectory';
Filter_Parts{2}{3} = 'OutputPathWidget';
Filter_Parts{1}{4} = 'OutputStlPrefix';
Filter_Parts{2}{4} = 'StringWidget';
end