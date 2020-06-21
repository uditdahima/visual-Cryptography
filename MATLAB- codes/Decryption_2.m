% %% User-Interface Functions
%
%

function varargout = Decryption_2(varargin)
% DECRYPTION_2 MATLAB code for Decryption_2.fig
%      DECRYPTION_2, by itself, creates a new DECRYPTION_2 or raises the existing
%      singleton*.
%
%      H = DECRYPTION_2 returns the handle to a new DECRYPTION_2 or the handle to
%      the existing singleton*.
%
%      DECRYPTION_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DECRYPTION_2.M with the given input arguments.
%
%      DECRYPTION_2('Property','Value',...) creates a new DECRYPTION_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Decryption_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Decryption_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Decryption_2

% Last Modified by GUIDE v2.5 17-Apr-2018 14:15:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Decryption_2_OpeningFcn, ...
                   'gui_OutputFcn',  @Decryption_2_OutputFcn, ...
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


% --- Executes just before Decryption_2 is made visible.
function Decryption_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Decryption_2 (see VARARGIN)

% Choose default command line output for Decryption_2
handles.output = hObject;
global share1;
global share2;
global share3;

global Null;
Null=[];

share1=Null;
share2=Null;
share3=Null;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Decryption_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Decryption_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in decrypt_btn.
function decrypt_btn_Callback(hObject, eventdata, handles)
% hObject    handle to decrypt_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global share1;
global share2;
global share3;
global width;
global height;

keyvalue = get(handles.key_val,'String');
if isempty(share1) ==0 || isempty(share2) == 0 || isempty(share3) == 0
    if isempty(keyvalue) == 0
        if isempty(share1) ==1
                if isempty(share2) == 0
                    share1=share2;
                elseif isempty(share3) == 0
                    share1=share3;
                end    
        elseif isempty(share2) == 1
                share2=share1;
        elseif isempty(share3) == 1
                share3=share1;    
        end    

        disp('Size of Share 1: ');disp(size(share1));

        r=rand(size(share1,1),size(share1,2));  r=uint16(r*1000);   r=mod(r,256);
        g=rand(size(share1,1),size(share1,2));  g=uint16(g*1000);   g=mod(g,256);
        b=rand(size(share1,1),size(share1,2));  b=uint16(b*1000);   b=mod(b,256);
    
        disp(max(max(share1)));    disp(max(max(share2)));    disp(max(max(share3)));

        for i =1:3
            if(i==1)     ,s=share1;
            elseif(i==2) ,s=share2;
            else          s=share3;    
            end
    
            if max(max(s)) > 765        ,b=s; b=uint8(b/5);
            elseif max(max(s)) > 255    ,g=s; g=uint8(g/3);
            else                         r=uint8(s);
            end    
        end   
        rgbShare = cat(3,r,g,b); 
        rgbShare=uint8(rgbShare);
        [width, height, ~] = size(rgbShare);
        key = keyGen(width*height,keyvalue);
        imwrite(rgbShare, 'output.png', 'png');
        output_image = imageProcess(imread('output.png'),key);
        imwrite(output_image,'finaloutput.png','png');
        figure;
        imshow('finaloutput.png');
        msgbox('Image decrypted.');
        guidata(hObject, handles);
    else     msgbox('There is no Key Input.');
    end
else disp('There are no shares selected.');
     msgbox('There are no shares selected.');
end


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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global share1;
[file,path] = uigetfile('*.jpg;*.bmp;*.tiff;*.ppm;*.pgm;*.png','Pick an Image File','.\Encrypted_images\3_of_3','MultiSelect','off');
if file ~=0         
    File=horzcat(path,file);
    share1 = imread(File);
end
set(handles.share_1,'string',strcat('Select Share 1:',horzcat(' ',file)));
guidata(hObject, handles);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global share2;
[file,path] = uigetfile('*.jpg;*.bmp;*.tiff;*.ppm;*.pgm;*.png','Pick an Image File','.\Encrypted_images\3_of_3','MultiSelect','off');
if file ~=0    
    File=horzcat(path,file); 
    share2 = imread(File);
end
set(handles.share_2,'string',strcat('Select Share 2:',horzcat(' ',file)));
guidata(hObject, handles);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global share3;
[file,path] = uigetfile('*.jpg;*.bmp;*.tiff;*.ppm;*.pgm;*.png','Pick an Image File','.\Encrypted_images\3_of_3','MultiSelect','off');
if file ~=0         
    File=horzcat(path,file);
    share3 = imread(File);
end
set(handles.share_3,'string',strcat('Select Share 3:',horzcat(' ',file)));
guidata(hObject, handles);


% --- Executes on button press in back_btn.
function back_btn_Callback(hObject, eventdata, handles)
% hObject    handle to back_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Decryption_1;
close 'Decrypt Data Dialog Box : 3 of 3 Enhanced Visual Cryptographic Scheme';

% --- Executes on button press in reset_btn.
function reset_btn_Callback(hObject, eventdata, handles)
% hObject    handle to reset_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Resetting UI
set(handles.share_1,'string','Select Share 1:');guide
set(handles.share_2,'string','Select Share 2:');
set(handles.share_3,'string','Select Share 3:');
set(handles.key_val,'string','');

%Resetting File values
global share1;
global share2;
global share3;

global Null;

share1=Null;
share2=Null;
share3=Null;

%   %%%%%%