function [ Filter_Parts ] = FindRelativeMotionBetweenSlices
Filter_Parts{1}{1} = 'Plane';
Filter_Parts{2}{1} = 'ChoiceWidget';
Filter_Parts{1}{2} = 'PSize1';
Filter_Parts{2}{2} = 'IntWidget';
Filter_Parts{1}{3} = 'PSize2';
Filter_Parts{2}{3} = 'IntWidget';
Filter_Parts{1}{4} = 'SSize1';
Filter_Parts{2}{4} = 'IntWidget';
Filter_Parts{1}{5} = 'SSize2';
Filter_Parts{2}{5} = 'IntWidget';
Filter_Parts{1}{6} = 'SliceStep';
Filter_Parts{2}{6} = 'IntWidget';
Filter_Parts{1}{7} = 'SelectedArrayPath';
Filter_Parts{2}{7} = 'DataArraySelectionWidget';
Filter_Parts{1}{8} = 'MotionDirectionArrayName';
Filter_Parts{2}{8} = 'StringWidget';
end