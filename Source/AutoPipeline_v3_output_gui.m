function varargout = AutoPipeline_v3_output_gui(varargin)
% AUTOPIPELINE_V3_OUTPUT_GUI MATLAB code for AutoPipeline_v3_output_gui.fig
%      AUTOPIPELINE_V3_OUTPUT_GUI, by itself, creates a new AUTOPIPELINE_V3_OUTPUT_GUI or raises the existing
%      singleton*.
%
%      H = AUTOPIPELINE_V3_OUTPUT_GUI returns the handle to a new AUTOPIPELINE_V3_OUTPUT_GUI or the handle to
%      the existing singleton*.
%
%      AUTOPIPELINE_V3_OUTPUT_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AUTOPIPELINE_V3_OUTPUT_GUI.M with the given input arguments.
%
%      AUTOPIPELINE_V3_OUTPUT_GUI('Property','Value',...) creates a new AUTOPIPELINE_V3_OUTPUT_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AutoPipeline_v3_output_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AutoPipeline_v3_output_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only on
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AutoPipeline_v3_output_gui

% Last Modified by GUIDE v2.5 12-Apr-2016 10:12:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AutoPipeline_v3_output_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @AutoPipeline_v3_output_gui_OutputFcn, ...
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


% --- Executes just before AutoPipeline_v3_output_gui is made visible.
function AutoPipeline_v3_output_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AutoPipeline_v3_output_gui (see VARARGIN)

% Choose default command line output for AutoPipeline_v3_output_gui

write_filters = varargin{1};
set(handles.gui_out_listbox,'String',write_filters{1});
set(handles.gui_out_listbox,'Max',length(write_filters{1}));
handles.write_filters = write_filters;


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AutoPipeline_v3_output_gui wait for user response (see UIRESUME)
uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = AutoPipeline_v3_output_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.outputfoldername;
varargout{2} = handles.save_name;
varargout{3} = handles.confirmed_write_filters;


% --- Executes on selection change in gui_out_listbox.
function gui_out_listbox_Callback(hObject, eventdata, handles)
% hObject    handle to gui_out_listbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns gui_out_listbox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from gui_out_listbox


% --- Executes during object creation, after setting all properties.
function gui_out_listbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gui_out_listbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function gui_out_editbox1_Callback(hObject, eventdata, handles)
% hObject    handle to gui_out_editbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%set(handles.gui_out_editbox1,'String','');
% Hints: get(hObject,'String') returns contents of gui_out_editbox1 as text
%        str2double(get(hObject,'String')) returns contents of gui_out_editbox1 as a double


% --- Executes during object creation, after setting all properties.
function gui_out_editbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gui_out_editbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
write_filters = handles.write_filters;
listbox_values = get(handles.gui_out_listbox,'value');
save_name = get(handles.gui_out_editbox1,'String');
outputfoldername = uigetdir(pwd,'Select Output Folder');

confirmed_write_filters = {write_filters{1}(listbox_values), write_filters{2}(listbox_values), write_filters{3}(listbox_values), write_filters{4}(listbox_values)};

handles.outputfoldername = outputfoldername;
handles.save_name = save_name;
handles.confirmed_write_filters = confirmed_write_filters;

guidata(hObject, handles);
uiresume;
