function [ Filter_Parts ] = InitializeSyntheticVolume
Filter_Parts{1}{1} = 'InputStatsArrayPath';
Filter_Parts{2}{1} = 'DataArraySelectionWidget';
Filter_Parts{1}{2} = 'InputPhaseTypesArrayPath';
Filter_Parts{2}{2} = 'DataArraySelectionWidget';
Filter_Parts{1}{3} = 'DataContainerName';
Filter_Parts{2}{3} = 'StringWidget';
Filter_Parts{1}{4} = 'CellAttributeMatrixName';
Filter_Parts{2}{4} = 'StringWidget';
Filter_Parts{1}{5} = 'Dimensions';
Filter_Parts{2}{5} = 'IntVec3Widget';
Filter_Parts{1}{6} = 'Resolution';
Filter_Parts{2}{6} = 'FloatVec3Widget';
Filter_Parts{1}{7} = 'Origin';
Filter_Parts{2}{7} = 'FloatVec3Widget';
end