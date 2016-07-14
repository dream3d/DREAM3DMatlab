function [ Filter_Parts ] = ScaleVolume
Filter_Parts{1}{1} = 'ScaleFactor';
Filter_Parts{2}{1} = 'FloatVec3Widget';
Filter_Parts{1}{2} = 'ApplyToVoxelVolume';
Filter_Parts{2}{2} = 'LinkedBooleanWidget';
Filter_Parts{1}{3} = 'DataContainerName';
Filter_Parts{2}{3} = 'DataContainerSelectionWidget';
Filter_Parts{1}{4} = 'ApplyToSurfaceMesh';
Filter_Parts{2}{4} = 'LinkedBooleanWidget';
Filter_Parts{1}{5} = 'SurfaceDataContainerName';
Filter_Parts{2}{5} = 'DataContainerSelectionWidget';
end