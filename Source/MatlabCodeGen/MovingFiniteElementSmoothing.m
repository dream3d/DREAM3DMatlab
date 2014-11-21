function [ Filter_Parts ] = MovingFiniteElementSmoothing
Filter_Parts{1}{1} = 'IterationSteps';
Filter_Parts{2}{1} = 'IntWidget';
Filter_Parts{1}{2} = 'NodeConstraints';
Filter_Parts{2}{2} = 'BooleanWidget';
Filter_Parts{1}{3} = 'ConstrainSurfaceNodes';
Filter_Parts{2}{3} = 'BooleanWidget';
Filter_Parts{1}{4} = 'ConstrainQuadPoints';
Filter_Parts{2}{4} = 'BooleanWidget';
Filter_Parts{1}{5} = 'SmoothTripleLines';
Filter_Parts{2}{5} = 'BooleanWidget';
Filter_Parts{1}{6} = 'SurfaceMeshNodeTypeArrayPath';
Filter_Parts{2}{6} = 'DataArraySelectionWidget';
end