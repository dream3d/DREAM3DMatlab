function [ Filter_Parts ] = ReadEdaxH5Data
Filter_Parts{1}{1} = 'InputFile';
Filter_Parts{2}{1} = 'InputFileWidget';
Filter_Parts{1}{2} = 'ScanName';
Filter_Parts{2}{2} = 'DynamicChoiceWidget';
Filter_Parts{1}{3} = 'ReadPatternData';
Filter_Parts{2}{3} = 'BooleanWidget';
Filter_Parts{1}{4} = 'DataContainerName';
Filter_Parts{2}{4} = 'StringWidget';
Filter_Parts{1}{5} = 'CellAttributeMatrixName';
Filter_Parts{2}{5} = 'StringWidget';
Filter_Parts{1}{6} = 'CellEnsembleAttributeMatrixName';
Filter_Parts{2}{6} = 'StringWidget';
end