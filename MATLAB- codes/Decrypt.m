function varargout = Decrypt(varargin)
% DECRYPT MATLAB code for Decrypt.fig
%      DECRYPT, by itself, creates a new DECRYPT or raises the existing
%      singleton*.
%
%      H = DECRYPT returns the handle to a new DECRYPT or the handle to
%      the existing singleton*.
%
%      DECRYPT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DECRYPT.M with the given input arguments.
%
%      DECRYPT('Property','Value',...) creates a new DECRYPT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Decrypt_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Decrypt_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Decrypt

% Last Modified by GUIDE v2.5 07-Mar-2018 00:11:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Decrypt_OpeningFcn, ...
                   'gui_OutputFcn',  @Decrypt_OutputFcn, ...
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


% --- Executes just before Decrypt is made visible.
function Decrypt_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Decrypt (see VARARGIN)

% Choose default command line output for Decrypt
handles.output = hObject;
global KVALUE;
if (KVALUE<100)
    set(handles.k_shares_val,'string',num2str(KVALUE,0));
end
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Decrypt wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Decrypt_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in brwse_files.
function brwse_files_Callback(hObject, eventdata, handles)
% hObject    handle to brwse_files (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im;
global width;
global height;
[file,path] = uigetfile('*.jpg;*.bmp;*.tiff;*.ppm;*.pgm;*.png','Pick an Image File','MultiSelect','on');   
disp(length(file));
set(handles.decrypt_file_lbl,'string',' Choose File(s) to Decrypt :');
set(handles.disp_area,'visible','on');
cla(handles.disp_area,'reset');
for i = 1:length(file)
    f=char(file(i));
    File=horzcat(path,f);
    disp(File);
    im = imread(File);
    [width, height, ~] = size(im);
    set(handles.decrypt_file_lbl,'string',strcat(get(handles.decrypt_file_lbl,'string'),horzcat(f,[',',' '])));
    axes(handles.disp_area);
    imshow(im);
end    
guidata(hObject, handles);


function key_val_Callback(hObject, eventdata, handles)
% hObject    handle to key_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of key_val as text
%        str2double(get(hObject,'String')) returns contents of key_val as a double


% --- Executes during object creation, after setting all properties.
function key_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to key_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in decrypt_btn.
function decrypt_btn_Callback(hObject, eventdata, handles)
% hObject    handle to decrypt_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Setting normal UI
set(handles.key_val,'BackgroundColor','white');
set(handles.key_val,'ForegroundColor','black');

keyvalue = get(handles.key_val,'String');
k = get(handles.k_shares_val,'String');
k = str2num(k);

[width height channel] = size(imread('share1.png'));
key = keyGen(width*height,keyvalue);
kn_decrypt(k);
figure();
imshow('output.png');
title('Merged k shares...');
output_image = imageProcess(imread('output.png'),key);
imwrite(output_image,'decryptedoutput.png','png');
axes(handles.disp_area)
imshow('decryptedoutput.png');
guidata(hObject, handles);
msgbox('Image successfully decrypted.');


function k_shares_val_Callback(hObject, eventdata, handles)
% hObject    handle to k_shares_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of k_shares_val as text
%        str2double(get(hObject,'String')) returns contents of k_shares_val as a double


% --- Executes during object creation, after setting all properties.
function k_shares_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to k_shares_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function n_shares_val_Callback(hObject, eventdata, handles)
% hObject    handle to n_shares_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n_shares_val as text
%        str2double(get(hObject,'String')) returns contents of n_shares_val as a double


% --- Executes during object creation, after setting all properties.
function n_shares_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n_shares_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in nav_main_page.
function nav_main_page_Callback(hObject, eventdata, handles)
% hObject    handle to nav_main_page (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
MProjectMain;
close Decrypt;

function eval_key(hObject,eventdata,handles)
% hObject    handle to encrypt_key (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(length(get(hObject,'string'))< 8)
  set(hObject,'BackgroundColor','red');
else
  set(hObject,'BackgroundColor','green');
end
set(hObject,'ForegroundColor','white');
