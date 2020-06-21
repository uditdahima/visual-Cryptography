% %% User-Interface Functions
%
%

function varargout = Decryption_1(varargin)
% DECRYPTION_1 MATLAB code for Decryption_1.fig
%      DECRYPTION_1, by itself, creates a new DECRYPTION_1 or raises the existing
%      singleton*.
%
%      H = DECRYPTION_1 returns the handle to a new DECRYPTION_1 or the handle to
%      the existing singleton*.
%
%      DECRYPTION_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DECRYPTION_1.M with the given input arguments.
%
%      DECRYPTION_1('Property','Value',...) creates a new DECRYPTION_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Decryption_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Decryption_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Decryption_1

% Last Modified by GUIDE v2.5 17-Apr-2018 14:13:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Decryption_1_OpeningFcn, ...
                   'gui_OutputFcn',  @Decryption_1_OutputFcn, ...
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


% --- Executes just before Decryption_1 is made visible.
function Decryption_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Decryption_1 (see VARARGIN)

% Choose default command line output for Decryption_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Decryption_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Decryption_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global CHNG;
selectedIndex = get(handles.popupmenu1, 'value');
if selectedIndex == 1
    Decryption_2;
    close 'Decrypt Data Dialog Box 1';
elseif selectedIndex == 2
    CHNG=0;
    Decryption_3;
    close 'Decrypt Data Dialog Box 1'; 
elseif selectedIndex == 3   
    Decryption;
    close 'Decrypt Data Dialog Box 1'; 
end

% --- Executes on button press in nav_main_page.
function nav_main_page_Callback(hObject, eventdata, handles)
% hObject    handle to nav_main_page (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
MProjectMain;
close 'Decrypt Data Dialog Box 1';
%   %%%%%%
