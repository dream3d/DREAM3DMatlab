function [ Filter_Parts ] = ErodeDilateMask
Filter_Parts{1}{1} = 'MaskArrayPath';
Filter_Parts{2}{1} = 'DataArraySelectionWidget';
Filter_Parts{1}{2} = 'Direction';
Filter_Parts{2}{2} = 'ChoiceWidget';
Filter_Parts{1}{3} = 'NumIterations';
Filter_Parts{2}{3} = 'IntWidget';
Filter_Parts{1}{4} = 'XDirOn';
Filter_Parts{2}{4} = 'BooleanWidget';
Filter_Parts{1}{5} = 'YDirOn';
Filter_Parts{2}{5} = 'BooleanWidget';
Filter_Parts{1}{6} = 'ZDirOn';
Filter_Parts{2}{6} = 'BooleanWidget';
end