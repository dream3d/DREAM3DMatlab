function varargout = DreamGUI(varargin)
% DREAMGUI MATLAB code for DreamGUI.fig
%      DREAMGUI, by itself, creates a new DREAMGUI or raises the existing
%      singleton*.
%
%      H = DREAMGUI returns the handle to a new DREAMGUI or the handle to
%      the existing singleton*.
%
%      DREAMGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DREAMGUI.M with the given input arguments.
%
%      DREAMGUI('Property','Value',...) creates a new DREAMGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DreamGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DreamGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DreamGUI

% Last Modified by GUIDE v2.5 19-May-2014 14:19:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DreamGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @DreamGUI_OutputFcn, ...
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


% --- Executes just before DreamGUI is made visible.
function DreamGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DreamGUI (see VARARGIN)

% Choose default command line output for DreamGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DreamGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DreamGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in SampleButton.
function SampleButton_Callback(hObject, eventdata, handles)
% hObject    handle to SampleButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filenamesample pathnamesample] = uigetfile('*.dream3d','Select Sample');
fullpathnamesample = strcat(pathnamesample, filenamesample);
set(handles.InputSampleDisplay,'String',fullpathnamesample);


function InputSampleDisplay_Callback(hObject, eventdata, handles)
% hObject    handle to InputSampleDisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of InputSampleDisplay as text
%        str2double(get(hObject,'String')) returns contents of InputSampleDisplay as a double


% --- Executes during object creation, after setting all properties.
function InputSampleDisplay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to InputSampleDisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PipelineButton.
function PipelineButton_Callback(hObject, eventdata, handles)
% hObject    handle to PipelineButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename pathname] = uigetfile('*.txt','Select Pipeline');
fullpathname = strcat(pathname, filename);
set(handles.PipelineDisplay,'String',fullpathname);



function PipelineDisplay_Callback(hObject, eventdata, handles)
% hObject    handle to PipelineDisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PipelineDisplay as text
%        str2double(get(hObject,'String')) returns contents of PipelineDisplay as a double


% --- Executes during object creation, after setting all properties.
function PipelineDisplay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PipelineDisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in OutputFilePath.
function OutputFilePath_Callback(hObject, eventdata, handles)
% hObject    handle to OutputFilePath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
dname = uigetdir('C:\','Select Output Path');
set(handles.OutputDisplay,'String',dname);


function OutputDisplay_Callback(hObject, eventdata, handles)
% hObject    handle to OutputDisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of OutputDisplay as text
%        str2double(get(hObject,'String')) returns contents of OutputDisplay as a double


% --- Executes during object creation, after setting all properties.
function OutputDisplay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OutputDisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function HulkSmashEverything_Callback(hObject, eventdata, handles)
% hObject    handle to HulkSmashEverything (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HulkSmashEverything as text
%        str2double(get(hObject,'String')) returns contents of HulkSmashEverything as a double


% --- Executes during object creation, after setting all properties.
function HulkSmashEverything_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HulkSmashEverything (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MisorTolDisplay_Callback(hObject, eventdata, handles)
% hObject    handle to MisorTolDisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MisorTolDisplay as text
%        str2double(get(hObject,'String')) returns contents of MisorTolDisplay as a double


% --- Executes during object creation, after setting all properties.
function MisorTolDisplay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MisorTolDisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MADDisplay_Callback(hObject, eventdata, handles)
% hObject    handle to MADDisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MADDisplay as text
%        str2double(get(hObject,'String')) returns contents of MADDisplay as a double


% --- Executes during object creation, after setting all properties.
function MADDisplay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MADDisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CAxisTolDisplay_Callback(hObject, eventdata, handles)
% hObject    handle to CAxisTolDisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CAxisTolDisplay as text
%        str2double(get(hObject,'String')) returns contents of CAxisTolDisplay as a double


% --- Executes during object creation, after setting all properties.
function CAxisTolDisplay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CAxisTolDisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in exeButton.
function exeButton_Callback(hObject, eventdata, handles)
% hObject    handle to exeButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename1 pathname1] = uigetfile('*.exe','Select Pipeline.exe');
fullpathname1 = strcat(pathname1, filename1);
set(handles.exeDisplay,'String',fullpathname1);


function exeDisplay_Callback(hObject, eventdata, handles)
% hObject    handle to exeDisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of exeDisplay as text
%        str2double(get(hObject,'String')) returns contents of exeDisplay as a double


% --- Executes during object creation, after setting all properties.
function exeDisplay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to exeDisplay (see GCBO)
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


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on button press in RunButton.
function RunButton_Callback(hObject, eventdata, handles)
% hObject    handle to RunButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Sets the variables for the inputs from GUI
sample = get(handles.InputSampleDisplay,'String');
[samplepath,samplename,sampleext] = fileparts(sample);
pipelinetxt = get(handles.PipelineDisplay,'String');
MisorTol = str2num(get(handles.MisorTolDisplay,'String'));
MAD = str2num(get(handles.MADDisplay,'String'));
CAxisTol = str2num(get(handles.CAxisTolDisplay,'String'));
d3dpath = get(handles.OutputDisplay,'String');
name = get(handles.HulkSmashEverything,'String');
pipedotexe = get(handles.exeDisplay,'String');
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

% Find the pertinent lines
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

% Create Temporary Folders
mkdir('TempBatchFolder')
mkdir('TempPipelineFolder')

for i = 1:length(MisorTol)
    for j = 1:length(MAD)
        for k = 1:length(CAxisTol)
            
            % file names for pipeline files
            currentfolder = pwd;
            
            fname = strcat(pwd,filesep,'TempPipelineFolder\',name,'-MisorTol',...
                num2str(MisorTol(i)),'-MAD',num2str(MAD(j)*10),'-CAxisTol',...
                num2str(CAxisTol(k)),'.txt');
            clear fid;
            fid = fopen(fname,'w+');
            % path and name for written dream3d files. Need double slashes
            % for pipelinerunner.exe
        
            
            outputfile = strcat(d3doutputpath,name,'-MisorTol',...
                num2str(MisorTol(i)),'-MAD',num2str(MAD(j)*10),'-CAxisTol',...
                num2str(CAxisTol(k)),'.dream3d');
            [d3dpath,newname,ext] = fileparts(outputfile);
            
            
            % Rewriting pipeline file lines
            A{1}{SampleRow} = strcat('InputFile=',inputfile,samplename,sampleext);
            A{1}{MisorTolRow} = strcat('MisorientationTolerance=',...
                num2str(MisorTol(i)));
            A{1}{MADRow} = strcat('MultiplesOfAverage=',num2str(MAD(j)));
            A{1}{CAxisTolRow} = strcat('CAxisTolerance=',num2str(CAxisTol(k)));
            A{1}{D3DwriteRow} = strcat('OutputFile=',outputfile);
            A{1}{CSVwriteRow} = strcat('FeatureDataFile=',d3dpath,filesep,newname,'.csv');
            
            % Writing pipeline files
            for n = 1:length(A{1})
                fprintf(fid,'%s',A{1}{n});
                fprintf(fid,'\r\n');
            end
            
            % Writing batch files
            batname = strcat(pwd,filesep,'tempbatchfolder\batch.bat');
            batid = fopen(batname,'w+');
            b = strcat(pipedotexe,' -p "',...
                fname,'"');
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
%rmdir('TempBatchFolder','s');
%rmdir('TempPipelineFolder','s');
close all
