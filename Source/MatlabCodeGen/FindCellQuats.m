function [ Filter_Parts ] = FindCellQuats
Filter_Parts{1}{1} = 'CellEulerAnglesArrayPath';
Filter_Parts{2}{1} = 'DataArraySelectionWidget';
Filter_Parts{1}{2} = 'CellPhasesArrayPath';
Filter_Parts{2}{2} = 'DataArraySelectionWidget';
Filter_Parts{1}{3} = 'CrystalStructuresArrayPath';
Filter_Parts{2}{3} = 'DataArraySelectionWidget';
Filter_Parts{1}{4} = 'QuatsArrayName';
Filter_Parts{2}{4} = 'StringWidget';
end