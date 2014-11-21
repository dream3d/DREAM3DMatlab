function GUIsaver(hObject,handles)
% This function gathers the min/max/step values and saves them into
% the overall data cell.
FinalCell = handles.FinalCell;
current_min = get(handles.min_editbox,'String');
current_max = get(handles.max_editbox,'String');
current_step = get(handles.step_editbox,'String');
% Find the current Filter for FinalCell Indexing
CurrentFilterValue = get(handles.FilterListBox,'Value');
CurrentPropertyValue = get(handles.PropertyListBox,'Value');
% FilterList = handles.FilterCodeLabelPopulation;
% CurrentFilter = FilterList{CurrentFilterValue};
% FilterProperties = feval(CurrentFilter);
% Find the Property Name for FinalCell Indexing
% CurrentProperty = get(handles.PropertyListBox,'String');
% 
% FilterHumanLabelFind = strfind(PipelineCellArray{1}, 'Filter_Human_Label=');
% FilterFilterHumanLabelRow = find(~cellfun('isempty',FilterHumanLabelFind));
% 
% 
sizecurrent_min = length(current_min)+1;
sizecurrent_max = length(current_max)+1;
sizecurrent_step = length(current_step);
totalspaceneeded = sizecurrent_min + sizecurrent_max + sizecurrent_step;
if isempty(current_min)
    return
elseif isempty(current_step)
%     FinalCell{CurrentFilterValue,3}(CurrentPropertyValue,1:totalspaceneeded) = [current_min, current_max];
    return
else
    FinalCell{CurrentFilterValue,3}(CurrentPropertyValue,1:totalspaceneeded) = [strcat(current_min,'/', current_max,'/', current_step)];
end

handles.FinalCell = FinalCell;



guidata(hObject, handles);
end