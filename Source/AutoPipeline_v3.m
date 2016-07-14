function varargout = AutoPipeline_v3(varargin)
% AUTOPIPELINE_V3 MATLAB code for AutoPipeline_v3.fig
%      AUTOPIPELINE_V3, by itself, creates a new AUTOPIPELINE_V3 or raises the existing
%      singleton*.
%
%      H = AUTOPIPELINE_V3 returns the handle to a new AUTOPIPELINE_V3 or the handle to
%      the existing singleton*.
%
%      AUTOPIPELINE_V3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AUTOPIPELINE_V3.M with the given input arguments.
%
%      AUTOPIPELINE_V3('Property','Value',...) creates a new AUTOPIPELINE_V3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AutoPipeline_v3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AutoPipeline_v3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AutoPipeline_v3

% Last Modified by GUIDE v2.5 08-Jul-2016 10:23:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AutoPipeline_v3_OpeningFcn, ...
                   'gui_OutputFcn',  @AutoPipeline_v3_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before AutoPipeline_v3 is made visible.
function AutoPipeline_v3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AutoPipeline_v3 (see VARARGIN)

% Choose default command line output for AutoPipeline_v3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AutoPipeline_v3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = AutoPipeline_v3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in start_button.
function start_button_Callback(hObject, eventdata, handles)
% hObject    handle to start_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



addpath('Matlab_CodeGen_d3d_v6');% This folder needs to be in main folder you're reading from if not using deployable.
% This folder contains the information about filters needed to determine
% what can be modified.

% Here the code grabs the file that is the json and converts the name and
% opens the file. Also saves file in handle structure
[txtfilename txtpathname] = uigetfile('*.json','Select Pipeline');
set(handles.title_text,'String',txtfilename);

PipelineFile = [txtpathname,txtfilename];
fid = fopen(PipelineFile,'r');
PipelineCellArray = textscan(fid,'%s','delimiter','\n','whitespace','');
fclose(fid);
handles.txtfileandpathname = [txtpathname,txtfilename];

% Here we use the dream3d_json_read function to divide the .json file into
% its separate sections for reading/writing purposes. The 'banner' is saved
% for adding in when the final json is written.
[pp_parts, banner] = dream3d_json_read(PipelineCellArray);

% This adjusts the 'pp_parts' to the correct reading order for simplicity.
% This order is saved and is adjusted back to the original later in the
% code.
filter_nums = zeros(length(pp_parts),1);
for ii = 1:length(pp_parts)
    first_line = strsplit(pp_parts{ii}{1},'"');
    filter_nums(ii) = str2num(first_line{2});
    
end

[sorted_nums, index] = sort(filter_nums);

% Use sorted_pp(filter_nums+1) to map sorted_pp back to original order*****
sorted_pp = pp_parts(index);



% Getting the HumanLabel names of filters in txt file. "Human_Label" is
% what the dream3d user sees as the name of a filter.
FilterHumanLabelFind = cellfun(@(x) strfind(x, 'Filter_Human_Label'), sorted_pp, 'UniformOutput',0);

FilterHumanLabelRow = cellfun(@(x) find(~cellfun('isempty',x)),FilterHumanLabelFind, 'UniformOutput',0);

FilterCell = cell(length(FilterHumanLabelRow),1);
for jj = 1:length(FilterHumanLabelRow)
    FilterCell{jj} = sorted_pp{jj}{FilterHumanLabelRow{jj}};
end
FilterHumanLabelPopulation = cellfun(@(x) strsplit(x,'"'), FilterCell,'UniformOutput',false);
FilterHumanLabelPopulation = cellfun(@(x) x{4},FilterHumanLabelPopulation,'UniformOutput',false);
FilterHumanLabelPopulation = cellfun(@(x) x(x~=' '),FilterHumanLabelPopulation,'uniformoutput',false);

set(handles.FilterTitle_txt,'Visible','on');
set(handles.FilterListBox,'String',FilterHumanLabelPopulation,'Visible','on');

% Getting the CodeLabel names of the filters in txt file. "CodeLabel" is
% the computer name for the filter names, and is easier to key off of.
FilterCodeLabelFind = cellfun(@(x) strfind(x, 'Filter_Name'), sorted_pp, 'UniformOutput',0);

FilterCodeLabelRow = cellfun(@(x) find(~cellfun('isempty',x)),FilterCodeLabelFind, 'UniformOutput',0);

FilterCodeCell = cell(length(FilterCodeLabelRow),1);
for jj = 1:length(FilterCodeLabelRow)
    FilterCodeCell{jj} = sorted_pp{jj}{FilterCodeLabelRow{jj}};
end
FilterCodeLabelPopulation = cellfun(@(x) strsplit(x,'"'), FilterCodeCell,'UniformOutput',false);
FilterCodeLabelPopulation = cellfun(@(x) x{4},FilterCodeLabelPopulation,'UniformOutput',false);
FilterCodeLabelPopulation = cellfun(@(x) x(x~=' '),FilterCodeLabelPopulation,'uniformoutput',false);

% create list of filters with inputs for later use of
% AutoPipeline_v3_input_gui. This is the list the user will read to decide
% which inputs need to be set.
fileID = fopen('input_filters_list.txt');
input_filters_names = textscan(fileID,'%s');
fclose(fileID);
input_filter_position_check = ismember(FilterCodeLabelPopulation,input_filters_names{:});
% cell == {name of filter, #}
input_filters_in_pipeline = {FilterCodeLabelPopulation(input_filter_position_check),find(input_filter_position_check)};

% create list of write filters for later use of AutoPipeline_v3_output_gui.
% This is the same process as the inputs.
fileID = fopen('write_filters_list.txt');
write_filters_names = textscan(fileID,'%s %s %s');
write_filter_position_check = ismember(FilterCodeLabelPopulation,write_filters_names{1});
output_name_check = ismember(write_filters_names{1},FilterCodeLabelPopulation);
% cell == {name of filter, #, name of output line, file ext (ie .dream3d)}
write_filters_in_pipeline = {FilterCodeLabelPopulation(write_filter_position_check), find(write_filter_position_check), write_filters_names{2}(output_name_check), write_filters_names{3}(output_name_check)};
fclose(fileID);


% Making Variables Available to Other Functions
handles.FilterHumanLabelPopulation = FilterHumanLabelPopulation;
handles.FilterCodeLabelPopulation = FilterCodeLabelPopulation;
% handles.pp_parts = pp_parts;
handles.sorted_pp = sorted_pp;
handles.sort_index = filter_nums;
handles.banner = banner;
% handles.index = index;
handles.input_filters = input_filters_in_pipeline;
handles.write_filters = write_filters_in_pipeline;





% populating properties section for the matlab gui.
FilterCodeLabel = FilterCodeLabelPopulation{get(hObject,'Value')};
FilterProperties = feval(FilterCodeLabel);
% Search for properties that are doubles, vec3s and ints, otherwise toss
IntFinder = strfind(FilterProperties{2}', 'IntWidget');
IntRow = find(~cellfun('isempty',IntFinder'));
% Vec3Finder = strfind(FilterProperties{2}', 'FloatVec3Widget');
% Vec3Row = find(~cellfun('isempty',Vec3Finder));
DoubleFinder = strfind(FilterProperties{2}', 'DoubleWidget');
DoubleRow= find(~cellfun('isempty',DoubleFinder));
% Create one array with rows needed
KeepRows = [IntRow;DoubleRow]; % or KeepRows = [IntRow; Vec3Row; DoubleRow];


% If there are no properties that are ints,doubles,vecs, leave message
if isempty(KeepRows)
    set(handles.PropertyListBox,'String','Irrelevant, Select Different Filter');
    set(handles.min_title,'Visible','off');
    set(handles.max_title,'Visible','off');
    set(handles.step_title,'Visible','off');
    set(handles.min_editbox,'Visible','off');
    set(handles.max_editbox,'Visible','off');
    set(handles.step_editbox,'Visible','off');
    set(handles.Update_button,'Visible','off');
else
    set(handles.PropertyListBox,'String',FilterProperties{1}(KeepRows));
    set(handles.min_title,'Visible','on');
    set(handles.max_title,'Visible','on');
    set(handles.step_title,'Visible','on');
    set(handles.min_editbox,'Visible','on');
    set(handles.max_editbox,'Visible','on');
    set(handles.step_editbox,'Visible','on');
    set(handles.Update_button,'Visible','on');
end

% Creat FinalCell, used for the final pipeline file making process
NumFilters = length(FilterCodeLabelPopulation);
FinalCell = cell(NumFilters,3);

for i = 1:NumFilters
    FinalCell{i} = FilterCodeLabelPopulation{i};
    CellFilterProperties = feval(FilterCodeLabelPopulation{i});
    IntFinder = strfind(CellFilterProperties{2}', 'IntWidget');
    IntRow = find(~cellfun('isempty',IntFinder'));
%     Vec3Finder = strfind(CellFilterProperties{2}', 'FloatVec3Widget');
%     Vec3Row = find(~cellfun('isempty',Vec3Finder));
    DoubleFinder = strfind(CellFilterProperties{2}', 'DoubleWidget');
    DoubleRow= find(~cellfun('isempty',DoubleFinder));
% Create one array with rows needed

if size(IntRow,1) == 1
    IntRow = transpose(IntRow);
end

    KeepRows = [IntRow; DoubleRow]; % or KeepRows = [IntRow; Vec3Row; DoubleRow];
    FinalCell{i,2} = CellFilterProperties{1}(KeepRows)';
end

handles.FinalCell = FinalCell;

% Show rest of windows in gui
set(handles.PropertyTitle_txt,'Visible','on');
set(handles.PropertyListBox,'Visible','on');
set(handles.inputs_editbox,'Visible','on');
set(handles.outputfolder_editbox,'Visible','on');
set(handles.executable_editbox,'Visible','on');
set(handles.input_selectbutton,'Visible','on');
set(handles.outputfolder_selectbutton,'Visible','on');
set(handles.executable_selectbutton,'Visible','on');
set(handles.run_button,'Visible','on');
set(handles.NumRuns,'Visible','on');
set(handles.NumRuns_text,'Visible','on');

guidata(hObject, handles);




% --- Executes on selection change in FilterListBox.
function FilterListBox_Callback(hObject, eventdata, handles)
% hObject    handle to FilterListBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns FilterListBox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from FilterListBox

% This section is the response for when a filter name is clicked on in the
% first window. Follows the same process at the beginning of the code and
% updates the 'properties' window in the gui.
FilterCodeLabelPopulation = handles.FilterCodeLabelPopulation;
FilterCodeLabel = FilterCodeLabelPopulation{get(hObject,'Value')};
FilterProperties = feval(FilterCodeLabel);
% Search for properties that are doubles, vec3s and ints, otherwise toss
IntFinder = strfind(FilterProperties{2}', 'IntWidget');
IntRow = find(~cellfun('isempty',IntFinder));
% Vec3Finder = strfind(FilterProperties{2}', 'FloatVec3Widget');
% Vec3Row = find(~cellfun('isempty',Vec3Finder));
DoubleFinder = strfind(FilterProperties{2}', 'DoubleWidget');
DoubleRow= find(~cellfun('isempty',DoubleFinder));
% Create one array with rows needed
KeepRows = [IntRow; DoubleRow];% or KeepRows = [IntRow; Vec3Row; DoubleRow];


% If there are no properties that are ints,doubles,vecs, leave message
if isempty(KeepRows)
    set(handles.PropertyListBox,'String','Irrelevant, Select Different Filter');
    set(handles.min_title,'Visible','off');
    set(handles.max_title,'Visible','off');
    set(handles.step_title,'Visible','off');
    set(handles.min_editbox,'Visible','off');
    set(handles.max_editbox,'Visible','off');
    set(handles.step_editbox,'Visible','off');
    set(handles.Update_button,'Visible','off');
else
    set(handles.PropertyListBox,'String',FilterProperties{1}(KeepRows));
    set(handles.min_title,'Visible','on');
    set(handles.max_title,'Visible','on');
    set(handles.step_title,'Visible','on');
    set(handles.min_editbox,'Visible','on');
    set(handles.max_editbox,'Visible','on');
    set(handles.step_editbox,'Visible','on');
    set(handles.Update_button,'Visible','on');
end



% --- Executes during object creation, after setting all properties.
function FilterListBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FilterListBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in PropertyListBox.
function PropertyListBox_Callback(hObject, eventdata, handles)
% hObject    handle to PropertyListBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns PropertyListBox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PropertyListBox


% --- Executes during object creation, after setting all properties.
function PropertyListBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PropertyListBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function min_editbox_Callback(hObject, eventdata, handles)
% hObject    handle to min_editbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of min_editbox as text
%        str2double(get(hObject,'String')) returns contents of min_editbox as a double


% --- Executes during object creation, after setting all properties.
function min_editbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to min_editbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function max_editbox_Callback(hObject, eventdata, handles)
% hObject    handle to max_editbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of max_editbox as text
%        str2double(get(hObject,'String')) returns contents of max_editbox as a double


% --- Executes during object creation, after setting all properties.
function max_editbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max_editbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function step_editbox_Callback(hObject, eventdata, handles)
% hObject    handle to step_editbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of step_editbox as text
%        str2double(get(hObject,'String')) returns contents of step_editbox as a double


% --- Executes during object creation, after setting all properties.
function step_editbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to step_editbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inputs_editbox_Callback(hObject, eventdata, handles)
% hObject    handle to inputs_editbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputs_editbox as text
%        str2double(get(hObject,'String')) returns contents of inputs_editbox as a double


% --- Executes during object creation, after setting all properties.
function inputs_editbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputs_editbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function outputfolder_editbox_Callback(hObject, eventdata, handles)
% hObject    handle to outputfolder_editbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of outputfolder_editbox as text
%        str2double(get(hObject,'String')) returns contents of outputfolder_editbox as a double


% --- Executes during object creation, after setting all properties.
function outputfolder_editbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to outputfolder_editbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function executable_editbox_Callback(hObject, eventdata, handles)
% hObject    handle to executable_editbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of executable_editbox as text
%        str2double(get(hObject,'String')) returns contents of executable_editbox as a double


% --- Executes during object creation, after setting all properties.
function executable_editbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to executable_editbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in input_selectbutton.
function input_selectbutton_Callback(hObject, eventdata, handles)
% hObject    handle to input_selectbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Here the code retrieves the list of input filters and uses the
% AutoPipeline_v3_input_gui function to query the user on inputs. It then
% makes this lister and accompanying information available to the rest of
% the gui.
input_filters = handles.input_filters;
% Use AutoPipeline_v3_input_gui to put everything in proper format
input_filters = AutoPipeline_v3_input_gui(input_filters);
if size(input_filters{3}{1},1) == 1
    set(handles.inputs_editbox, 'String', input_filters{3}{1});
else
    set(handles.inputs_editbox, 'String', input_filters{3}{1}{1});
end
close(gcf);

handles.input_filters = input_filters;
guidata(hObject, handles);

 
% --- Executes on button press in outputfolder_selectbutton.
function outputfolder_selectbutton_Callback(hObject, eventdata, handles)
% hObject    handle to outputfolder_selectbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Here the code retrieves the list of out filters and uses the
% AutoPipeline_v3_output_gui function to query the user on inputs. It then
% makes this lister and accompanying information available to the rest of
% the gui.
write_filters = handles.write_filters;
% Use AutoPipeline_v3_output_gui to put everything in proper format
[output_folder, file_name, confirmed_write_filters] = AutoPipeline_v3_output_gui(write_filters);
set(handles.outputfolder_editbox, 'String', output_folder);
close(gcf);

handles.output_folder = output_folder;
handles.file_name = file_name;
handles.confirmed_write_filters = confirmed_write_filters;

% put in an accept/cancel option here?
% accept = 1, works fine, accept = 0, return?
guidata(hObject, handles);

% --- Executes on button press in executable_selectbutton.
function executable_selectbutton_Callback(hObject, eventdata, handles)
% hObject    handle to executable_selectbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% This section is for the button to select the PipelineRunner.exe location.
[exefilename exepathname] = uigetfile('*.exe','Select PipelineRunner.exe');
exefullname = [exepathname,exefilename];
set(handles.executable_editbox,'String',exefullname);
handles.exefullname = exefullname;
guidata(hObject, handles);

% --- Executes on button press in run_button.
function run_button_Callback(hObject, eventdata, handles)
% hObject    handle to run_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%

% Here we retrieve the "FinalCell" which contains relevant information from
% the user inputs on min/step/max etc.
FinalCell = handles.FinalCell;

% grab numruns from the user input
NumRuns = str2num(get(handles.NumRuns,'String'));

output_folder = handles.output_folder;
file_name = handles.file_name;
pipelineexe = handles.exefullname;
NumberofFinalCell = size(FinalCell,1);

% Finding total number of properties needing to be edited. Trimming
% FinalCell down to more specific relevance.
% This flag is to determine whether or not property values are being
% changed.
Property_Changes_Flag = 0;


PropertyColumn = cellfun(@(x) ~isempty(x), FinalCell(:,3),'UniformOut',false);


if sum([PropertyColumn{:}]) > 0
   
    Property_Changes_Flag = 1;
    
    WriteCell = cell(1,4);
    WriteCellRow = 1;
    %%%% Write cell should look like ::
    %%%% {Filter #, FilterName, Property Name, Iteration} 
    for n = 1:NumberofFinalCell
        if isempty(FinalCell{n,3})
            continue
        else
            for properties = 1:length(FinalCell{n,3})
                if isempty(FinalCell{n,3}{properties})
                    continue
                else
                    WriteCell{WriteCellRow,1} = n;
                    WriteCell{WriteCellRow,2} = FinalCell{n,1};
                    WriteCell{WriteCellRow,3} = FinalCell{n,2}(properties);
                    WriteCell{WriteCellRow,4} = FinalCell{n,3}(properties);

                    WriteCellRow = WriteCellRow + 1;
                end
            end
        end
    end

    % Here we check the values the user has selected to iterate over and starts
    % to arrange the total possible configurations for .json writing
    WriteCellSize = size(WriteCell);

    iterationValues = cell(WriteCellSize(1),1);
    commandstr = 'allcomb(';
    for i = 1:WriteCellSize(1)
        A = WriteCell{i,4};
        values = cellfun(@(x) strsplit(x,'/') ,A,'UniformOutput',false);

        min = str2double(values{1}(1));
        max = str2double(values{1}(2));
        step = str2double(values{1}(3));

        iteration = min:step:max;
        if isempty(iteration)
            iterationValues(i) = {0};
        else
        iterationValues(i) = num2cell(iteration,2);
        end
        commandstr = strcat(commandstr,'iterationValues{',num2str(i),'}',',');
    end
    commandstr(length(commandstr))=')';
    iterationValues{1};

    AllCombinations = eval(commandstr); 
    
    SizeComb = size(AllCombinations);
    
    % Create Property Library for Reference
    PropertyLibraryFileName = strcat(output_folder, filesep, file_name,'_Library_',datestr(now,'ddmmmyyyy_HH_MM'),'.xlsx');
    Property_Library_Labels = {};
    for prop = 1:size(WriteCell,1)
        Property_Library_Labels(prop) = WriteCell{prop,3};
    end
    xlswrite(PropertyLibraryFileName, Property_Library_Labels, 1, 'B1');
    xlswrite(PropertyLibraryFileName, AllCombinations, 1, 'B2');
    title_line = 2;
else
    % Set SizeComb to 1 for loop purposes when writing files.
    
SizeComb = 1;
end
% Create Temporary Folders to store batch and .json files
mkdir('TempBatchFolder');
mkdir('TempPipelineFolder');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Bring in pipeline pieces and write filters etc. from earlier code
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sorted_pp = handles.sorted_pp;
banner = handles.banner;
sort_index = handles.sort_index;
sort_index = sort_index+1;
write_filters = handles.confirmed_write_filters;
input_filters = handles.input_filters;

% change input path in pipeline for all inputs::::::::
size_loop = 1;
looped_inputs = [];
looped_inputs_flag = 0;
for nn = 1:size(input_filters,1)
    % Here all paths are being changed from one slash to two for the .json
    % configuration. This is an outside requirement
    final_input = {};
    input_path = input_filters{3}{nn};
    expression = '\';
    replace = '\\\';
    final_input{nn} = regexprep(input_path, expression, replace);

    % Replace line in pipeline here::::::::
    % This section replaces the 'input' file path in the separate filters.
    % There is a checking process for whether there is more than one path.
    % If so, it recognizes the need for batch input for that specific
    % filter and passes it on for later use.
    if size(final_input{nn},1) == 1
        InputFind = strfind(sorted_pp{input_filters{2}(nn)},'"InputFile"');
        InputRow = find(~cellfun('isempty',InputFind));

        replacement_line = strcat('        "InputFile": "', final_input{nn}, '"');

        if InputRow ~= length(sorted_pp{input_filters{2}(nn)})-1
            replacement_line = strcat(replacement_line,',');
        end

        sorted_pp{input_filters{2}(nn)}(InputRow) = {replacement_line};
    else
        % this is what gets passed along for batch inputs. 
        looped_inputs = {nn, final_input{nn}};
    end

end
% check to see if the batch input is empty. If not, change the outer loop
% size from 1 to the number of batch input files.
if isempty(looped_inputs) == 0
    size_loop = size(looped_inputs{2},1);
    looped_inputs_flag = 1;
end


% outside loop here is for the size of the batch inputs. Each individual
% input file will go through all iterations before moving to next input
% file
num_pipeline = 1;
total_pipelines = size_loop * NumRuns * SizeComb(1);

h = waitbar(num_pipeline / total_pipelines, sprintf('Completing pipeline %i of %i...', num_pipeline, total_pipelines));

for num_inputs = 1:size_loop
    % Change the input file line for the batched inputs
    if looped_inputs_flag == 1
        InputFind = strfind(sorted_pp{looped_inputs{1}},'"InputFile"');
        InputRow = find(~cellfun('isempty',InputFind));
        replacement_line = strcat('        "InputFile": "', looped_inputs{2}{num_inputs}, '"');

        if InputRow ~= length(sorted_pp{looped_inputs{1}})-1
                replacement_line = strcat(replacement_line,',');
        end

        sorted_pp{looped_inputs{1}}(InputRow) = {replacement_line};
    end

% This loop is for the total number of runs the user entered, if they have
% a desire to repeat the overall process.
    for qq = 1:NumRuns


% This loop is for each individual iteration possibility for the different
% .jsons
        for n = 1:SizeComb(1)
            
            
            
            
            % For file naming purposes
            iter_number = sprintf('%06d',n);
            
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Check here if properties are being changed, if so, change them
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if Property_Changes_Flag
                property_values_for_run = AllCombinations(n,:);
                % Find and edit parameter string for each combination. This
                % goes through each value and changes the line related to the
                % correct property
                for q = 1:length(property_values_for_run)
                    Number = num2str(property_values_for_run(q));
                    Filter = WriteCell{q,1};
                    Property = WriteCell{q,3};
                    Property = Property{1};

                    PropertyFind = strfind(sorted_pp{Filter}, Property);
                    PropertyRow = find(~cellfun('isempty',PropertyFind));
                    Replacement_Property_Line = strsplit(sorted_pp{Filter}{PropertyRow},':');
                    Replacement_Property_Line = [Replacement_Property_Line{1},': ',Number];

                    if PropertyRow ~= length(sorted_pp{Filter})-1
                        Replacement_Property_Line = strcat(Replacement_Property_Line,',');
                    end

                    sorted_pp{Filter}{PropertyRow} = Replacement_Property_Line;
                end
            end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Here change output lines in pipeline for file save locations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                
                
                
                % Find and edit filters with outputs              :::::::::::::::::
                output_final = [];
                output_path = strsplit(output_folder,'\');
                for kk = 1:[length(output_path)]
                    output_final = strcat(output_final,output_path(kk),'\\');
                end
                output_final = output_final{1};

                for oo = 1:length(write_filters{1})
                    Filter = write_filters{2}(oo);
                    output_line = write_filters{3}{oo};
                    OutputFind = strfind(sorted_pp{Filter},output_line);
                    OutputRow = find(~cellfun('isempty',OutputFind));

                    output_file_name = strcat(output_final,file_name,'_iter',num2str(iter_number),'_','run',num2str(qq),write_filters{4}{oo});

                    
                    
                    Replacement_Output_Line = strsplit(sorted_pp{Filter}{OutputRow},':');
                    Replacement_Output_Line = [Replacement_Output_Line{1},': "',output_final,file_name,'_iter',num2str(n),'_','run',num2str(qq),write_filters{4}{oo},'"'];

                    if OutputRow ~= length(sorted_pp{Filter})-1
                        Replacement_Output_Line = strcat(Replacement_Output_Line,',');
                    end

                    sorted_pp{Filter}{OutputRow} = Replacement_Output_Line;
                end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % Name and open .json for writing to temorary folder
            fname = strcat(pwd,filesep,'TempPipelineFolder',filesep,file_name,'_iter',num2str(n),'_','run',num2str(qq),'.json');
            
            % Label Library Line
            xlswrite(PropertyLibraryFileName, {strcat(file_name,'_iter',num2str(n),'_','run',num2str(qq))}, 1, strcat('A',num2str(title_line)));
            title_line = title_line + 1;
            
            clear fid;
            fid = fopen(fname,'w+');

            first_line = '{';
            last_line = '}';
            % Reorder sorted_pp to match original .json
            write_parts = sorted_pp(sort_index);
            % Writing pipeline .json files

            fprintf(fid,'%s',first_line);
            fprintf(fid,'\r\n');
            for z = 1:length(write_parts)
                for y = 1:length(write_parts{z})
                    fprintf(fid,'%s',write_parts{z}{y});
                    fprintf(fid,'\r\n');
                end
            end
            for x = 1:length(banner)
                fprintf(fid,'%s',banner{x});
                fprintf(fid,'\r\n');
            end
            fprintf(fid,'%s',last_line);

            % Writing batch files
            batname = strcat(pwd,filesep,'tempbatchfolder',filesep,'batch.bat');
            batid = fopen(batname,'w+');
            b = strcat(pipelineexe,' -p "',...
                fname,'"');
            fprintf(batid,'%s',b);
            fprintf(batid,'\r\n');
            fprintf(batid,'exit');

            % Run the batch file, i.e. execute the pipeline
            if mod(n,10) == 0
                fprintf('i''m on file.... %i of %i in run %i\r',n,SizeComb(1),qq);
            end
            doscommand = sprintf('%s %s',batname);
            dos(doscommand);
            fclose all;
            
            num_pipeline = num_pipeline + 1;
            set( get(findobj(h,'type','axes'),'title'), 'string', sprintf('Completing pipeline %i of %i...', num_pipeline, total_pipelines));
            waitbar(num_pipeline / total_pipelines)
        end
    end
end    


close(h)
fclose all;
% rmdir('TempBatchFolder','s');
% rmdir('TempPipelineFolder','s');


% --- Executes on button press in Update_button.
function Update_button_Callback(hObject, eventdata, handles)
% hObject    handle to Update_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Here we use the GUIsaver function to save the user inputs for
% min/step/max
GUIsaver(hObject, handles);
handles = guidata(hObject);



function NumRuns_Callback(hObject, eventdata, handles)
% hObject    handle to NumRuns (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumRuns as text
%        str2double(get(hObject,'String')) returns contents of NumRuns as a double


% --- Executes during object creation, after setting all properties.
function NumRuns_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumRuns (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
