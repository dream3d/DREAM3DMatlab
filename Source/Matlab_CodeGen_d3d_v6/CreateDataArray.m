function [ Filter_Parts ] = CreateDataArray
Filter_Parts{1}{1} = 'ScalarType';
Filter_Parts{2}{1} = 'ChoiceWidget';
Filter_Parts{1}{2} = 'NumberOfComponents';
Filter_Parts{2}{2} = 'IntWidget';
Filter_Parts{1}{3} = 'InitializationType';
Filter_Parts{2}{3} = 'ChoiceWidget';
Filter_Parts{1}{4} = 'InitializationValue';
Filter_Parts{2}{4} = 'StringWidget';
Filter_Parts{1}{5} = 'InitializationRange';
Filter_Parts{2}{5} = 'RangeWidget';
Filter_Parts{1}{6} = 'NewArray';
Filter_Parts{2}{6} = 'DataArrayCreationWidget';
end