function [ Filter_Parts ] = BadDataNeighborOrientationCheck
Filter_Parts{1}{1} = 'MisorientationTolerance';
Filter_Parts{2}{1} = 'DoubleWidget';
Filter_Parts{1}{2} = 'NumberOfNeighbors';
Filter_Parts{2}{2} = 'IntWidget';
Filter_Parts{1}{3} = 'QuatsArrayPath';
Filter_Parts{2}{3} = 'DataArraySelectionWidget';
Filter_Parts{1}{4} = 'GoodVoxelsArrayPath';
Filter_Parts{2}{4} = 'DataArraySelectionWidget';
Filter_Parts{1}{5} = 'CellPhasesArrayPath';
Filter_Parts{2}{5} = 'DataArraySelectionWidget';
Filter_Parts{1}{6} = 'CrystalStructuresArrayPath';
Filter_Parts{2}{6} = 'DataArraySelectionWidget';
end