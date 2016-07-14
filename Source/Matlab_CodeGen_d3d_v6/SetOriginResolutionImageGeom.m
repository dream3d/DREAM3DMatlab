function [ Filter_Parts ] = SetOriginResolutionImageGeom
Filter_Parts{1}{1} = 'DataContainerName';
Filter_Parts{2}{1} = 'DataContainerSelectionWidget';
Filter_Parts{1}{2} = 'ChangeOrigin';
Filter_Parts{2}{2} = 'LinkedBooleanWidget';
Filter_Parts{1}{3} = 'Origin';
Filter_Parts{2}{3} = 'FloatVec3Widget';
Filter_Parts{1}{4} = 'ChangeResolution';
Filter_Parts{2}{4} = 'LinkedBooleanWidget';
Filter_Parts{1}{5} = 'Resolution';
Filter_Parts{2}{5} = 'FloatVec3Widget';
end