function [ Filter_Parts ] = NeighborOrientationCorrelation
Filter_Parts{1}{1} = 'MinConfidence';
Filter_Parts{2}{1} = 'DoubleWidget';
Filter_Parts{1}{2} = 'MisorientationTolerance';
Filter_Parts{2}{2} = 'DoubleWidget';
Filter_Parts{1}{3} = 'Level';
Filter_Parts{2}{3} = 'IntWidget';
Filter_Parts{1}{4} = 'ConfidenceIndexArrayPath';
Filter_Parts{2}{4} = 'DataArraySelectionWidget';
Filter_Parts{1}{5} = 'CellPhasesArrayPath';
Filter_Parts{2}{5} = 'DataArraySelectionWidget';
Filter_Parts{1}{6} = 'CrystalStructuresArrayPath';
Filter_Parts{2}{6} = 'DataArraySelectionWidget';
Filter_Parts{1}{7} = 'QuatsArrayPath';
Filter_Parts{2}{7} = 'DataArraySelectionWidget';
end