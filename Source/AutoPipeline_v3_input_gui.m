function varargout = AutoPipeline_v3_input_gui(varargin)
% AUTOPIPELINE_V3_INPUT_GUI MATLAB code for AutoPipeline_v3_input_gui.fig
%      AUTOPIPELINE_V3_INPUT_GUI, by itself, creates a new AUTOPIPELINE_V3_INPUT_GUI or raises the existing
%      singleton*.
%
%      H = AUTOPIPELINE_V3_INPUT_GUI returns the handle to a new AUTOPIPELINE_V3_INPUT_GUI or the handle to
%      the existing singleton*.
%
%      AUTOPIPELINE_V3_INPUT_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AUTOPIPELINE_V3_INPUT_GUI.M with the given input arguments.
%
%      AUTOPIPELINE_V3_INPUT_GUI('Property','Value',...) creates a new AUTOPIPELINE_V3_INPUT_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AutoPipeline_v3_input_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AutoPipeline_v3_input_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AutoPipeline_v3_input_gui

% Last Modified by GUIDE v2.5 19-Apr-2016 10:10:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AutoPipeline_v3_input_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @AutoPipeline_v3_input_gui_OutputFcn, ...
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


% --- Executes just before AutoPipeline_v3_input_gui is made visible.
function AutoPipeline_v3_input_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AutoPipeline_v3_input_gui (see VARARGIN)

% Choose default command line output for AutoPipeline_v3_input_gui
input_filters = varargin{1};
set(handles.gui_in_listbox,'String',input_filters{1});
handles.input_filters = input_filters;


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AutoPipeline_v3_input_gui wait for user response (see UIRESUME)
uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = AutoPipeline_v3_input_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.input_filters;


% --- Executes on selection change in gui_in_listbox.
function gui_in_listbox_Callback(hObject, eventdata, handles)
% hObject    handle to gui_in_listbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input_filters = handles.input_filters;
selected_input_value = get(handles.gui_in_listbox,'Value');
selected_input = input_filters{1}{selected_input_value};
ui_dialog = ['Select Input For ', selected_input];
[inputfilename, inputpathname] = uigetfile('*',ui_dialog,'MultiSelect','on');

if class(inputfilename) == 'char'
    input = [inputpathname, inputfilename];
else
    input = cellfun(@(x) strcat(inputpathname, x), inputfilename,'UniformOutput',false);
    input = input';
end

input_filters{3}{selected_input_value} = input;

handles.input_filters = input_filters;

guidata(hObject, handles);
% Hints: contents = cellstr(get(hObject,'String')) returns gui_in_listbox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from gui_in_listbox


% --- Executes during object creation, after setting all properties.
function gui_in_listbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gui_in_listbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
uiresume;
