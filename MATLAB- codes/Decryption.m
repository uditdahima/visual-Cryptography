% %% User-Interface Functions
%
%

function varargout = Decryption(varargin)
% DECRYPTION MATLAB code for Decryption.fig
%      DECRYPTION, by itself, creates a new DECRYPTION or raises the existing
%      singleton*.
%
%      H = DECRYPTION returns the handle to a new DECRYPTION or the handle to
%      the existing singleton*.
%
%      DECRYPTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DECRYPTION.M with the given input arguments.
%
%      DECRYPTION('Property','Value',...) creates a new DECRYPTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Decryption_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Decryption_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Decryption

% Last Modified by GUIDE v2.5 06-May-2020 22:21:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Decryption_OpeningFcn, ...
                   'gui_OutputFcn',  @Decryption_OutputFcn, ...
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


% --- Executes just before Decryption is made visible.
function Decryption_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Decryption (see VARARGIN)

% Choose default command line output for Decryption
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Decryption wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Decryption_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in share1.
function share1_Callback(hObject, eventdata, handles)
% hObject    handle to share1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns share1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from share1
global share_1;
contents = cellstr(get(hObject,'String'));
share_1=contents{get(hObject,'Value')};
disp(share_1);


% --- Executes during object creation, after setting all properties.
function share1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to share1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in next_btn.
function next_btn_Callback(hObject, eventdata, handles)
% hObject    handle to next_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global CHNG;
CHNG=1;
Decryption_3;
close 'Decrypt Data Dialog Box 2';

% --- Executes on button press in back_btn.
function back_btn_Callback(hObject, eventdata, handles)
% hObject    handle to back_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Decryption_1;
close 'Decrypt Data Dialog Box 2';


% --- Executes on selection change in share2.
function share2_Callback(hObject, eventdata, handles)
% hObject    handle to share2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns share2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from share2
global share_2;
contents = cellstr(get(hObject,'String'));
share_2=contents{get(hObject,'Value')};
disp(share_2);

% --- Executes during object creation, after setting all properties.
function share2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to share2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%   %%%%%%
