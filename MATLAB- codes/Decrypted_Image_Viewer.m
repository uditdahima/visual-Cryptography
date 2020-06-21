function varargout = Decrypted_Image_Viewer(varargin)
% DECRYPTED_IMAGE_VIEWER MATLAB code for Decrypted_Image_Viewer.fig
%      DECRYPTED_IMAGE_VIEWER, by itself, creates a new DECRYPTED_IMAGE_VIEWER or raises the existing
%      singleton*.
%
%      H = DECRYPTED_IMAGE_VIEWER returns the handle to a new DECRYPTED_IMAGE_VIEWER or the handle to
%      the existing singleton*.
%
%      DECRYPTED_IMAGE_VIEWER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DECRYPTED_IMAGE_VIEWER.M with the given input arguments.
%
%      DECRYPTED_IMAGE_VIEWER('Property','Value',...) creates a new DECRYPTED_IMAGE_VIEWER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Decrypted_Image_Viewer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Decrypted_Image_Viewer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Decrypted_Image_Viewer

% Last Modified by GUIDE v2.5 12-Mar-2018 13:03:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Decrypted_Image_Viewer_OpeningFcn, ...
                   'gui_OutputFcn',  @Decrypted_Image_Viewer_OutputFcn, ...
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


% --- Executes just before Decrypted_Image_Viewer is made visible.
function Decrypted_Image_Viewer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Decrypted_Image_Viewer (see VARARGIN)

% Choose default command line output for Decrypted_Image_Viewer
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Decrypted_Image_Viewer wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Decrypted_Image_Viewer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in save_btn.
function save_btn_Callback(hObject, eventdata, handles)
% hObject    handle to save_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over axes background.
function axes2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
