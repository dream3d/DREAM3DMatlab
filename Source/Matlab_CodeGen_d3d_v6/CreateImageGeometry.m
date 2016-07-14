function [ Filter_Parts ] = CreateImageGeometry
Filter_Parts{1}{1} = 'SelectedDataContainer';
Filter_Parts{2}{1} = 'DataContainerSelectionWidget';
Filter_Parts{1}{2} = 'Dimensions';
Filter_Parts{2}{2} = 'IntVec3Widget';
Filter_Parts{1}{3} = 'Origin';
Filter_Parts{2}{3} = 'FloatVec3Widget';
Filter_Parts{1}{4} = 'Resolution';
Filter_Parts{2}{4} = 'FloatVec3Widget';
end