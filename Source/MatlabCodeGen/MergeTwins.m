function [ Filter_Parts ] = MergeTwins
Filter_Parts{1}{1} = 'AngleTolerance';
Filter_Parts{2}{1} = 'DoubleWidget';
Filter_Parts{1}{2} = 'AxisTolerance';
Filter_Parts{2}{2} = 'DoubleWidget';
Filter_Parts{1}{3} = 'ContiguousNeighborListArrayPath';
Filter_Parts{2}{3} = 'DataArraySelectionWidget';
Filter_Parts{1}{4} = 'FeatureIdsArrayPath';
Filter_Parts{2}{4} = 'DataArraySelectionWidget';
Filter_Parts{1}{5} = 'FeaturePhasesArrayPath';
Filter_Parts{2}{5} = 'DataArraySelectionWidget';
Filter_Parts{1}{6} = 'AvgQuatsArrayPath';
Filter_Parts{2}{6} = 'DataArraySelectionWidget';
Filter_Parts{1}{7} = 'CrystalStructuresArrayPath';
Filter_Parts{2}{7} = 'DataArraySelectionWidget';
Filter_Parts{1}{8} = 'CellParentIdsArrayName';
Filter_Parts{2}{8} = 'StringWidget';
Filter_Parts{1}{9} = 'FeatureParentIdsArrayName';
Filter_Parts{2}{9} = 'StringWidget';
Filter_Parts{1}{10} = 'NewCellFeatureAttributeMatrixName';
Filter_Parts{2}{10} = 'StringWidget';
Filter_Parts{1}{11} = 'ActiveArrayName';
Filter_Parts{2}{11} = 'StringWidget';
end