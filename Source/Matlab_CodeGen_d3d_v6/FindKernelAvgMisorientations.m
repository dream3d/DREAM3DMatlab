function [ Filter_Parts ] = FindKernelAvgMisorientations
Filter_Parts{1}{1} = 'KernelSize';
Filter_Parts{2}{1} = 'IntVec3Widget';
Filter_Parts{1}{2} = 'FeatureIdsArrayPath';
Filter_Parts{2}{2} = 'DataArraySelectionWidget';
Filter_Parts{1}{3} = 'CellPhasesArrayPath';
Filter_Parts{2}{3} = 'DataArraySelectionWidget';
Filter_Parts{1}{4} = 'QuatsArrayPath';
Filter_Parts{2}{4} = 'DataArraySelectionWidget';
Filter_Parts{1}{5} = 'CrystalStructuresArrayPath';
Filter_Parts{2}{5} = 'DataArraySelectionWidget';
Filter_Parts{1}{6} = 'KernelAverageMisorientationsArrayName';
Filter_Parts{2}{6} = 'StringWidget';
end