function [ Filter_Parts ] = FindOrientationFieldCurl
Filter_Parts{1}{1} = 'CurlSize';
Filter_Parts{2}{1} = 'IntVec3Widget';
Filter_Parts{1}{2} = 'CellPhasesArrayPath';
Filter_Parts{2}{2} = 'DataArraySelectionWidget';
Filter_Parts{1}{3} = 'CrystalStructuresArrayPath';
Filter_Parts{2}{3} = 'DataArraySelectionWidget';
Filter_Parts{1}{4} = 'QuatsArrayPath';
Filter_Parts{2}{4} = 'DataArraySelectionWidget';
Filter_Parts{1}{5} = 'DislocationTensorsArrayName';
Filter_Parts{2}{5} = 'StringWidget';
end