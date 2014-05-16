function varargout = AutoPiplineGUI(varargin)
%AUTOPIPLINEGUI M-file for AutoPiplineGUI.fig
%      AUTOPIPLINEGUI, by itself, creates a new AUTOPIPLINEGUI or raises the existing
%      singleton*.
%
%      H = AUTOPIPLINEGUI returns the handle to a new AUTOPIPLINEGUI or the handle to
%      the existing singleton*.
%
%      AUTOPIPLINEGUI('Property','Value',...) creates a new AUTOPIPLINEGUI using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to AutoPiplineGUI_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      AUTOPIPLINEGUI('CALLBACK') and AUTOPIPLINEGUI('CALLBACK',hObject,...) call the
%      local function named CALLBACK in AUTOPIPLINEGUI.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AutoPiplineGUI

% Last Modified by GUIDE v2.5 16-May-2014 15:26:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AutoPiplineGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @AutoPiplineGUI_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before AutoPiplineGUI is made visible.
function AutoPiplineGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for AutoPiplineGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AutoPiplineGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = AutoPiplineGUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in samplebutton.
function samplebutton_Callback(hObject, eventdata, handles)
% hObject    handle to samplebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filenamesample pathnamesample] = uigetfile('*.dream3d','Select Sample');
fullpathnamesample = strcat(pathnamesample, filenamesample);
set(handles.sampleinputdisplay,'String',fullpathnamesample);


function sampleinputdisplay_Callback(hObject, eventdata, handles)
% hObject    handle to sampleinputdisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sampleinputdisplay as text
%        str2double(get(hObject,'String')) returns contents of sampleinputdisplay as a double


% --- Executes during object creation, after setting all properties.
function sampleinputdisplay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sampleinputdisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pipelinebutton.
function pipelinebutton_Callback(hObject, eventdata, handles)
% hObject    handle to pipelinebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename pathname] = uigetfile('*.txt','Select Pipeline');
fullpathname = strcat(pathname, filename);
set(handles.pipelinedisplay,'String',fullpathname);



function pipelinedisplay_Callback(hObject, eventdata, handles)
% hObject    handle to pipelinedisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pipelinedisplay as text
%        str2double(get(hObject,'String')) returns contents of pipelinedisplay as a double


% --- Executes during object creation, after setting all properties.
function pipelinedisplay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pipelinedisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in outputfilepath.
function outputfilepath_Callback(hObject, eventdata, handles)
% hObject    handle to outputfilepath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
dname = uigetdir('C:\','Select Output Path');
set(handles.outputdisplay,'String',dname);


function outputdisplay_Callback(hObject, eventdata, handles)
% hObject    handle to outputdisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of outputdisplay as text
%        str2double(get(hObject,'String')) returns contents of outputdisplay as a double


% --- Executes during object creation, after setting all properties.
function outputdisplay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to outputdisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function HulkSmash_Callback(hObject, eventdata, handles)
% hObject    handle to HulkSmash (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HulkSmash as text
%        str2double(get(hObject,'String')) returns contents of HulkSmash as a double


% --- Executes during object creation, after setting all properties.
function HulkSmash_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HulkSmash (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MisorToldisplay_Callback(hObject, eventdata, handles)
% hObject    handle to MisorToldisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MisorToldisplay as text
%        str2double(get(hObject,'String')) returns contents of MisorToldisplay as a double


% --- Executes during object creation, after setting all properties.
function MisorToldisplay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MisorToldisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MADdisplay_Callback(hObject, eventdata, handles)
% hObject    handle to MADdisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MADdisplay as text
%        str2double(get(hObject,'String')) returns contents of MADdisplay as a double


% --- Executes during object creation, after setting all properties.
function MADdisplay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MADdisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CAxisToldisplay_Callback(hObject, eventdata, handles)
% hObject    handle to CAxisToldisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CAxisToldisplay as text
%        str2double(get(hObject,'String')) returns contents of CAxisToldisplay as a double


% --- Executes during object creation, after setting all properties.
function CAxisToldisplay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CAxisToldisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in exebutton.
function exebutton_Callback(hObject, eventdata, handles)
% hObject    handle to exebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename1 pathname1] = uigetfile('*.exe','Select Pipeline.exe');
fullpathname1 = strcat(pathname1, filename1);
set(handles.exedisplay,'String',fullpathname1);



function exedisplay_Callback(hObject, eventdata, handles)
% hObject    handle to exedisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of exedisplay as text
%        str2double(get(hObject,'String')) returns contents of exedisplay as a double


% --- Executes during object creation, after setting all properties.
function exedisplay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to exedisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in Ampersand.
function Ampersand_Callback(hObject, eventdata, handles)
% hObject    handle to Ampersand (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Ampersand


% --- Executes on button press in runbutton.
function runbutton_Callback(hObject, eventdata, handles)
% hObject    handle to runbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Sets the variables for the inputs from GUI
sample = get(handles.sampleinputdisplay,'String');
[samplepath,samplename,sampleext] = fileparts(sample);
pipelinetxt = get(handles.pipelinedisplay,'String');
MisorTol = str2num(get(handles.MisorToldisplay,'String'));
MAD = str2num(get(handles.MADdisplay,'String'));
CAxisTol = str2num(get(handles.CAxisToldisplay,'String'));
d3dpath = get(handles.outputdisplay,'String');
name = get(handles.HulkSmash,'String');
pipedotexe = get(handles.exedisplay,'String');
R = strsplit(d3dpath,'\\');
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
if get(handles.Ampersand,'Value') == get(handles.Ampersand,'Max')
    ampersand = '&';
else
    ampersand = '';
end


fit = fopen(pipelinetxt,'r'); %opens the predetermined pipeline
A = textscan(fit,'%s','delimiter','\n');

%   Find the pertinent lines
SampleFind = strfind(A{1}, 'InputFile=');
SampleRow = find(~cellfun('isempty',SampleFind));

MisorTolFind = strfind(A{1}, 'MisorientationTolerance');
MisorTolRow = find(~cellfun('isempty', MisorTolFind));

MADFind = strfind(A{1}, 'MultiplesOfAverage');
MADRow = find(~cellfun('isempty', MADFind));

CAxisTolFind = strfind(A{1}, 'CAxisTolerance');
CAxisTolRow = find(~cellfun('isempty', CAxisTolFind));

D3DwriteFind = strfind(A{1}, 'OutputFile');
D3DwriteRow = find(~cellfun('isempty', D3DwriteFind));

CSVwriteFind = strfind(A{1}, 'FeatureDataFile');
CSVwriteRow = find(~cellfun('isempty', CSVwriteFind));

%   Create Temporary Folders
mkdir('TempBatchFolder')
mkdir('TempPipelineFolder')

for i = 1:length(MisorTol)
    for j = 1:length(MAD)
        for k = 1:length(CAxisTol)
            
            % file names for pipeline files
            fname = strcat('TempPipelineFolder\',name,'-MisorTol',...
                num2str(MisorTol(i)),'-MAD',num2str(MAD(j)*10),'-CAxisTol',...
                num2str(CAxisTol(k)),'.txt');
            clear fid;
            fid = fopen(fname,'w+');
            % path and name for written dream3d files.  Need double slashes
            % for pipelinerunner.exe
        
            
            outputfile = strcat(d3doutputpath,name,'-MisorTol',...
                num2str(MisorTol(i)),'-MAD',num2str(MAD(j)*10),'-CAxisTol',...
                num2str(CAxisTol(k)),'.dream3d');
            [path,newname,ext] = fileparts(outputfile);
            
            
            % Rewriting pipeline file lines
            A{1}{SampleRow} = strcat('InputFile=',inputfile,samplename,sampleext);
            A{1}{MisorTolRow} = strcat('MisorientationTolerance=',...
                num2str(MisorTol(i)));
            A{1}{MADRow} = strcat('MultiplesOfAverage=',num2str(MAD(j)));
            A{1}{CAxisTolRow} = strcat('CAxisTolerance=',num2str(CAxisTol(k)));
            A{1}{D3DwriteRow} = strcat('OutputFile=',outputfile);
            A{1}{CSVwriteRow} = strcat('FeatureDataFile=',path,filesep,newname,'.csv');
            
            % Writing pipeline files
            for n = 1:length(A{1})
                fprintf(fid,'%s',A{1}{n});
                fprintf(fid,'\r\n');
            end
            
            % Writing batch files
            batname = 'tempbatchfolder\batch.bat';
            batid = fopen(batname,'w+');
            b = strcat(pipedotexe,' -p "',...
                'c:\users\weihintj\documents\matlab\',fname,'"');
            fprintf(batid,'%s',b);
            fprintf(batid,'\r\n');
            fprintf(batid,'exit');
            
            % Run the batch file, i.e. execute the pipeline
            doscommand = sprintf('%s %s',batname,ampersand);
            dos(doscommand);
            
            fclose all;
        end
    end
end

pause(10);

fclose all;
rmdir('TempBatchFolder','s');
rmdir('TempPipelineFolder','s');
close all
