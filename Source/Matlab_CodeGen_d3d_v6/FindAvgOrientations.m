function [ Filter_Parts ] = FindAvgOrientations
Filter_Parts{1}{1} = 'FeatureIdsArrayPath';
Filter_Parts{2}{1} = 'DataArraySelectionWidget';
Filter_Parts{1}{2} = 'CellPhasesArrayPath';
Filter_Parts{2}{2} = 'DataArraySelectionWidget';
Filter_Parts{1}{3} = 'QuatsArrayPath';
Filter_Parts{2}{3} = 'DataArraySelectionWidget';
Filter_Parts{1}{4} = 'CrystalStructuresArrayPath';
Filter_Parts{2}{4} = 'DataArraySelectionWidget';
Filter_Parts{1}{5} = 'AvgQuatsArrayPath';
Filter_Parts{2}{5} = 'DataArrayCreationWidget';
Filter_Parts{1}{6} = 'AvgEulerAnglesArrayPath';
Filter_Parts{2}{6} = 'DataArrayCreationWidget';
end