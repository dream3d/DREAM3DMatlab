function [ Filter_Parts ] = RawBinaryReader
Filter_Parts{1}{1} = 'InputFile';
Filter_Parts{2}{1} = 'InputFileWidget';
Filter_Parts{1}{2} = 'ScalarType';
Filter_Parts{2}{2} = 'ChoiceWidget';
Filter_Parts{1}{3} = 'NumberOfComponents';
Filter_Parts{2}{3} = 'IntWidget';
Filter_Parts{1}{4} = 'Endian';
Filter_Parts{2}{4} = 'ChoiceWidget';
Filter_Parts{1}{5} = 'SkipHeaderBytes';
Filter_Parts{2}{5} = 'IntWidget';
Filter_Parts{1}{6} = 'CreatedAttributeArrayPath';
Filter_Parts{2}{6} = 'DataArrayCreationWidget';
end