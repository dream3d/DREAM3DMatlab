function [ Filter_Parts ] = AlignSectionsMisorientation
Filter_Parts{1}{1} = 'MisorientationTolerance';
Filter_Parts{2}{1} = 'DoubleWidget';
Filter_Parts{1}{2} = 'WriteAlignmentShifts';
Filter_Parts{2}{2} = 'LinkedBooleanWidget';
Filter_Parts{1}{3} = 'AlignmentShiftFileName';
Filter_Parts{2}{3} = 'OutputFileWidget';
Filter_Parts{1}{4} = 'UseGoodVoxels';
Filter_Parts{2}{4} = 'LinkedBooleanWidget';
Filter_Parts{1}{5} = 'QuatsArrayPath';
Filter_Parts{2}{5} = 'DataArraySelectionWidget';
Filter_Parts{1}{6} = 'CellPhasesArrayPath';
Filter_Parts{2}{6} = 'DataArraySelectionWidget';
Filter_Parts{1}{7} = 'GoodVoxelsArrayPath';
Filter_Parts{2}{7} = 'DataArraySelectionWidget';
Filter_Parts{1}{8} = 'CrystalStructuresArrayPath';
Filter_Parts{2}{8} = 'DataArraySelectionWidget';
end