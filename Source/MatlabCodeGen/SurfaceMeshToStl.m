function [ Filter_Parts ] = SurfaceMeshToStl
Filter_Parts{1}{1} = 'OutputStlDirectory';
Filter_Parts{2}{1} = 'OutputPathWidget';
Filter_Parts{1}{2} = 'OutputStlPrefix';
Filter_Parts{2}{2} = 'StringWidget';
Filter_Parts{1}{3} = 'GroupByPhase';
Filter_Parts{2}{3} = 'BooleanWidget';
Filter_Parts{1}{4} = 'SurfaceMeshFaceLabelsArrayPath';
Filter_Parts{2}{4} = 'DataArraySelectionWidget';
Filter_Parts{1}{5} = 'SurfaceMeshFacePhasesArrayPath';
Filter_Parts{2}{5} = 'DataArraySelectionWidget';
end