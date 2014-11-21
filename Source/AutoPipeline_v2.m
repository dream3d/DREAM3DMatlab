function varargout = AutoPipeline_v2(varargin)
% AUTOPIPELINE_V2 MATLAB code for AutoPipeline_v2.fig
%      AUTOPIPELINE_V2, by itself, creates a new AUTOPIPELINE_V2 or raises the existing
%      singleton*.
%
%      H = AUTOPIPELINE_V2 returns the handle to a new AUTOPIPELINE_V2 or the handle to
%      the existing singleton*.
%
%      AUTOPIPELINE_V2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AUTOPIPELINE_V2.M with the given input arguments.
%
%      AUTOPIPELINE_V2('Property','Value',...) creates a new AUTOPIPELINE_V2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AutoPipeline_v2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AutoPipeline_v2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AutoPipeline_v2

% Last Modified by GUIDE v2.5 19-Aug-2014 15:03:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AutoPipeline_v2_OpeningFcn, ...
                   'gui_OutputFcn',  @AutoPipeline_v2_OutputFcn, ...
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


% --- Executes just before AutoPipeline_v2 is made visible.
function AutoPipeline_v2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AutoPipeline_v2 (see VARARGIN)

% Choose default command line output for AutoPipeline_v2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AutoPipeline_v2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = AutoPipeline_v2_OutputFcn(hObject, eventdata, handles) 
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
[txtfilename txtpathname] = uigetfile('*.txt','Select Pipeline');
set(handles.title_text,'String',txtfilename);
PipelineFile = strcat(txtpathname,txtfilename);
fid = fopen(PipelineFile,'r');
PipelineCellArray = textscan(fid,'%s','delimiter','\n');
handles.txtfilename = txtfilename;
% Getting the HumanLabel names of filters in txt file
FilterHumanLabelFind = strfind(PipelineCellArray{1}, 'Filter_Human_Label=');
FilterFilterHumanLabelRow = find(~cellfun('isempty',FilterHumanLabelFind));
FilterMatrix = PipelineCellArray{1}(FilterFilterHumanLabelRow);
FilterHumanLabelPopulation = cellfun(@(x) x(20:end), FilterMatrix,'UniformOutput',false);
FilterHumanLabelPopulation = cellfun(@(x) x(x~=' '),FilterHumanLabelPopulation,'UniformOutput',false);
set(handles.FilterTitle_txt,'Visible','on');
set(handles.FilterListBox,'String',FilterHumanLabelPopulation,'Visible','on');

% Getting the CodeLabel names of the filters in txt file
FilterCodeLabelFind = strfind(PipelineCellArray{1}, 'Filter_Name=');
FilterFilterCodeLabelRow = find(~cellfun('isempty',FilterCodeLabelFind));
FilterCodeMatrix = PipelineCellArray{1}(FilterFilterCodeLabelRow);
FilterCodeLabelPopulation = cellfun(@(x) x(13:end), FilterCodeMatrix,'UniformOutput',false);

% Making Variables Available to Other Functions
handles.FilterHumanLabelPopulation = FilterHumanLabelPopulation;
handles.FilterCodeLabelPopulation = FilterCodeLabelPopulation;



% populating properties
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
    KeepRows = [IntRow; DoubleRow]; % or KeepRows = [IntRow; Vec3Row; DoubleRow];
    FinalCell{i,2} = CellFilterProperties{1}(KeepRows);
end
handles.FinalCell = FinalCell;

% Show rest of windows
set(handles.PropertyTitle_txt,'Visible','on');
set(handles.PropertyListBox,'Visible','on');
% set(handles.min_title,'Visible','on');
% set(handles.max_title,'Visible','on');
% set(handles.step_title,'Visible','on');
% set(handles.min_editbox,'Visible','on');
% set(handles.max_editbox,'Visible','on');
% set(handles.step_editbox,'Visible','on');
% set(handles.Update_button,'Visible','on');
set(handles.dream3d_editbox,'Visible','on');
set(handles.outputfolder_editbox,'Visible','on');
set(handles.executable_editbox,'Visible','on');
set(handles.dream3d_selectbutton,'Visible','on');
set(handles.outputfolder_selectbutton,'Visible','on');
set(handles.executable_selectbutton,'Visible','on');
set(handles.run_button,'Visible','on');
set(handles.concurrent_checkbox,'Visible','on');

guidata(hObject, handles);




% --- Executes on selection change in FilterListBox.
function FilterListBox_Callback(hObject, eventdata, handles)
% hObject    handle to FilterListBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns FilterListBox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from FilterListBox
FilterCodeLabelPopulation = handles.FilterCodeLabelPopulation;
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



function dream3d_editbox_Callback(hObject, eventdata, handles)
% hObject    handle to dream3d_editbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dream3d_editbox as text
%        str2double(get(hObject,'String')) returns contents of dream3d_editbox as a double


% --- Executes during object creation, after setting all properties.
function dream3d_editbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dream3d_editbox (see GCBO)
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


% --- Executes on button press in dream3d_selectbutton.
function dream3d_selectbutton_Callback(hObject, eventdata, handles)
% hObject    handle to dream3d_selectbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[d3dfilename d3dpathname] = uigetfile('*.dream3d','Select Sample');
d3dfullname = strcat(d3dpathname,d3dfilename);
set(handles.dream3d_editbox,'String',d3dfullname);

% --- Executes on button press in outputfolder_selectbutton.
function outputfolder_selectbutton_Callback(hObject, eventdata, handles)
% hObject    handle to outputfolder_selectbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
outputfoldername = uigetdir(pwd,'Select Output Folder');
set(handles.outputfolder_editbox,'String',outputfoldername);

% --- Executes on button press in executable_selectbutton.
function executable_selectbutton_Callback(hObject, eventdata, handles)
% hObject    handle to executable_selectbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[exefilename exepathname] = uigetfile('*.exe','Select PipelineRunner.exe');
exefullname = strcat(exepathname,exefilename);
set(handles.executable_editbox,'String',exefullname);

% --- Executes on button press in run_button.
function run_button_Callback(hObject, eventdata, handles)
% hObject    handle to run_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%
FinalCell = handles.FinalCell

pipelinetxt = handles.txtfilename;
sample = get(handles.dream3d_editbox,'String');
[samplepath,samplename,sampleext] = fileparts(sample);
outputpath = get(handles.outputfolder_editbox,'String');
pipelineexe = get(handles.executable_editbox,'String');
if get(handles.concurrent_checkbox,'Value') == get(handles.concurrent_checkbox,'Max')
    ampersand = '&';
else
    ampersand = '';
end
NumberofFinalCell = length(FinalCell);
NewParameters = cell(1,NumberofFinalCell)';
for q = 1:NumberofFinalCell
    NewParameters{q} = FinalCell{q,3};
end
FinalCellValuesRows = find(~cellfun('isempty', NewParameters));
PropertyString = NewParameters(FinalCellValuesRows);
% PropertyStringMat = cell2mat(PropertyString)
PropertyCell = FinalCellValuesRows + length(FinalCell);
WriteFilterNames = FinalCell(FinalCellValuesRows);
WritePropertyNames = FinalCell(PropertyCell);
% creating matrix of iterations
iterationValues = cell(length(PropertyString),1);
commandstr = 'allcomb(';
for i = 1:length(PropertyString)
    A = PropertyString(i,:);
    values = cellfun(@(x) strsplit(x,'/') ,A,'UniformOutput',false);
    values{1};
    min = str2double(values{1}(1));
    max = str2double(values{1}(2));
    step = str2double(values{1}(3));
    iteration = [min:step:max];
    iterationValues(i) = num2cell(iteration,2);
    commandstr = strcat(commandstr,'iterationValues{',num2str(i),'}',',');
end
commandstr(length(commandstr))=')';
AllCombinations = eval(commandstr)
SizeComb = size(AllCombinations);

% Create Temporary Folders
mkdir('TempBatchFolder')
mkdir('TempPipelineFolder')

fit = fopen(pipelinetxt,'r'); %opens the predetermined pipeline
A = textscan(fit,'%s','delimiter','\n');
% set up file location, name, etc.
R = strsplit(outputpath,'\\');
            R = R(~cellfun('isempty',R));
            for w = 1:length(R)
                e(w) = strcat(R(w),'\\');
            end
            d3doutputpath = cell2mat(e);
I = strsplit(samplepath,'\\');
            I = I(~cellfun('isempty',I));
             for o = 1:length(I)
                u(o) = strcat(I(o),'\\');
             end
            inputfile = cell2mat(u);
            
InputFind = strfind(A{1}, 'InputFile=');
InputRow = find(~cellfun('isempty',InputFind));
A{1}{InputRow} = strcat('InputFile=',inputfile,samplename,sampleext);






sizeAllComb = size(AllCombinations);
for n = 1:sizeAllComb(1)
    Properties = AllCombinations(n,:);
    % Name pipeline file as iteration of AllCombinations
    d3doutputfile = strcat(d3doutputpath,samplename,'-',num2str(n),'.dream3d');
    csvoutputfile = strcat(d3doutputpath,samplename,'-',num2str(n),'.csv');
    D3DwriteFind = strfind(A{1}, 'OutputFile');
    D3DwriteRow = find(~cellfun('isempty', D3DwriteFind));
    CSVwriteFind = strfind(A{1}, 'FeatureDataFile');
    CSVwriteRow = find(~cellfun('isempty', CSVwriteFind));
    A{1}{D3DwriteRow} = strcat('OutputFile=',d3doutputfile);
    A{1}{CSVwriteRow} = strcat('FeatureDataFile=',csvoutputfile);
    
    
    
    % Find and edit parameter string for each combination
    for q = 1:length(Properties)
        Number = Properties(q);
        Property = WritePropertyNames(q);
        Property = cell2mat(Property{1});
        PropertyFind = strfind(A{1}, Property);
        PropertyRow = find(~cellfun('isempty',PropertyFind));
        A{1}{PropertyRow} = strcat(Property,'=',num2str(Number));
    end
    
%         A{1}
%         
% currentfolder = pwd;
%             
% fname = strcat(pwd,filesep,'TempPipelineFolder\',samplename,'-',num2str(n),'.txt');
% clear fid;
% fid = fopen(fname,'w+');
% % Writing pipeline files
%     for z = 1:length(A{1})
%                 fprintf(fid,'%s',A{1}{z});
%                 fprintf(fid,'\r\n');
%     end
% % Writing batch files
% batname = strcat(pwd,filesep,'tempbatchfolder\batch.bat');
% batid = fopen(batname,'w+');
% b = strcat(pipelineexe,' -p "',...
%     fname,'"');
% fprintf(batid,'%s',b);
% fprintf(batid,'\r\n');
% fprintf(batid,'exit');
%             
% % Run the batch file, i.e. execute the pipeline
% doscommand = sprintf('%s %s',batname,ampersand);
% dos(doscommand);
%             
% fclose all;
end
    
    



fclose all;
% rmdir('TempBatchFolder','s');
% rmdir('TempPipelineFolder','s');

% --- Executes on button press in concurrent_checkbox.
function concurrent_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to concurrent_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of concurrent_checkbox


% --- Executes on button press in Update_button.
function Update_button_Callback(hObject, eventdata, handles)
% hObject    handle to Update_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
GUIsaver(hObject, handles);
handles = guidata(hObject);