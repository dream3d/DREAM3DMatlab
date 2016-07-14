function [ Filter_Parts ] = AbaqusHexahedronWriter
Filter_Parts{1}{1} = 'HourglassStiffness';
Filter_Parts{2}{1} = 'IntWidget';
Filter_Parts{1}{2} = 'JobName';
Filter_Parts{2}{2} = 'StringWidget';
Filter_Parts{1}{3} = 'OutputPath';
Filter_Parts{2}{3} = 'OutputPathWidget';
Filter_Parts{1}{4} = 'FilePrefix';
Filter_Parts{2}{4} = 'StringWidget';
Filter_Parts{1}{5} = 'FeatureIdsArrayPath';
Filter_Parts{2}{5} = 'DataArraySelectionWidget';
end