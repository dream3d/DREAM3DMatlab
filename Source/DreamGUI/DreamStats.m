function varargout = DreamStats(varargin)
% DREAMSTATS MATLAB code for DreamStats.fig
%      DREAMSTATS, by itself, creates a new DREAMSTATS or raises the existing
%      singleton*.
%
%      H = DREAMSTATS returns the handle to a new DREAMSTATS or the handle to
%      the existing singleton*.
%
%      DREAMSTATS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DREAMSTATS.M with the given input arguments.
%
%      DREAMSTATS('Property','Value',...) creates a new DREAMSTATS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DreamStats_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DreamStats_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DreamStats

% Last Modified by GUIDE v2.5 21-May-2014 14:03:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DreamStats_OpeningFcn, ...
                   'gui_OutputFcn',  @DreamStats_OutputFcn, ...
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


% --- Executes just before DreamStats is made visible.
function DreamStats_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DreamStats (see VARARGIN)

% Choose default command line output for DreamStats
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DreamStats wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DreamStats_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function diameter_cutoff_Callback(hObject, eventdata, handles)
% hObject    handle to diameter_cutoff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of diameter_cutoff as text
%        str2double(get(hObject,'String')) returns contents of diameter_cutoff as a double


% --- Executes during object creation, after setting all properties.
function diameter_cutoff_CreateFcn(hObject, eventdata, handles)
% hObject    handle to diameter_cutoff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in refresh_button.
function refresh_button_Callback(hObject, eventdata, handles)
% hObject    handle to refresh_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
DiameterCutoffValue = get(handles.diameter_cutoff,'String');
RefreshedData = Diameter_Data(Diameter_Data < DiameterCutoffValue);
set(handles.data_table,'Data',RefreshedData);


% Makes and displays stats for stats table
Table_Statistics = get(handles.data_table,'Data');
stats{1} = size(Table_Statistics,1); % Number of rows
stats{2} = min(Table_Statistics);
stats{3} = max(Table_Statistics);
stats{4} = mean(Table_Statistics);
stats{5} = median(Table_Statistics);
stats{6} = std(Table_Statistics);
set(handles.data_stats,'Data',stats');


% Creates the plot
h12=probplot('lognormal',Diameter_Data);
        grid on; %grid minor;
        %         title('Minor Axis Diameter Distribution','fontsize',22);
        title(' ')
        xlabel(' ','FontSize',6);
        ylabel(' ','FontSize',6);
%         set(gca,'FontSize',12) % set the tick label font size
%         set(h12,'MarkerFaceColor',[0.800000011920929 0.800000011920929 0.800000011920929],...
%             'MarkerEdgeColor',[0 0 0],'MarkerSize',14,'linewidth',2,'Color',[0 0 1]);
        legend('Lognormal','EqDiameters','Location','SE');
% plot(handles.prob_table,h12);


% --- Executes on button press in D3D_button.
function D3D_button_Callback(hObject, eventdata, handles)
% hObject    handle to D3D_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename pathname] = uigetfile('*.dream3d','Select Dream3d File');
set(handles.D3D_display,'String',filename);
d3d_fullname = strcat(pathname,filename);
Diameter_Data = h5read(d3d_fullname,'/DataContainers/VolumeDataContainer/CellFeatureData/EquivalentDiameters');
Diameter_Data = Diameter_Data';
set(handles.data_table,'Data',Diameter_Data);

% Makes and displays stats for stats table
Table_Statistics = get(handles.data_table,'Data');
stats{1} = size(Table_Statistics,1); % Number of rows
stats{2} = min(Table_Statistics);
stats{3} = max(Table_Statistics);
stats{4} = mean(Table_Statistics);
stats{5} = median(Table_Statistics);
stats{6} = std(Table_Statistics);
set(handles.data_stats,'Data',stats');

% Creates the plot
h12=probplot('lognormal',Diameter_Data);
        grid on; %grid minor;
        %         title('Minor Axis Diameter Distribution','fontsize',22);
        title(' ')
        xlabel(' ','FontSize',6);
        ylabel(' ','FontSize',6);
%         set(gca,'FontSize',12) % set the tick label font size
%         set(h12,'MarkerFaceColor',[0.800000011920929 0.800000011920929 0.800000011920929],...
%             'MarkerEdgeColor',[0 0 0],'MarkerSize',14,'linewidth',2,'Color',[0 0 1]);
        legend('Lognormal','EqDiameters','Location','SE');
% plot(handles.prob_table,h12);
        
% --- Executes when entered data in editable cell(s) in data_table.
function data_table_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to data_table (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
