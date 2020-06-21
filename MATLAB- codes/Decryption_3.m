% %% User-Interface Functions
%
%

function varargout = Decryption_3(varargin)
% DECRYPTION_3 MATLAB code for Decryption_3.fig
%      DECRYPTION_3, by itself, creates a new DECRYPTION_3 or raises the existing
%      singleton*.
%
%      H = DECRYPTION_3 returns the handle to a new DECRYPTION_3 or the handle to
%      the existing singleton*.
%
%      DECRYPTION_3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DECRYPTION_3.M with the given input arguments.
%
%      DECRYPTION_3('Property','Value',...) creates a new DECRYPTION_3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Decryption_3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Decryption_3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Decryption_3

% Last Modified by GUIDE v2.5 17-Apr-2018 14:16:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Decryption_3_OpeningFcn, ...
                   'gui_OutputFcn',  @Decryption_3_OutputFcn, ...
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


% --- Executes just before Decryption_3 is made visible.
function Decryption_3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Decryption_3 (see VARARGIN)

% Choose default command line output for Decryption_3
handles.output = hObject;
global share1;
global share2;

global Null;

share1=Null;
share2=Null;

set(handles.figure1,'Name','Decrypt Data Dialog Box: 2 of 3 Visual Cryptographic Scheme');

global CHNG;
if CHNG == 1
    set(handles.blue_key,'visible','on');
    set(handles.blue_key_val,'visible','on');
    set(handles.green_key,'visible','on');
    set(handles.green_key_val,'visible','on');
    set(handles.func_seq_lbl,'visible','on');
    set(handles.func_seq,'visible','on');
    
    set(handles.pushbutton6,'visible','off');
    set(handles.pushbutton7,'visible','off');
    
    set(handles.figure1,'Name','Decrypt Data Dialog Box: 2 of 3 Visual Cryptographic Scheme using Randomisation');
    global share_1;
    global share_2;
    set(handles.share_1,'string',strcat('Select Share 1:',horzcat(' ',share_1,'.png')));
    set(handles.share_2,'string',strcat('Select Share 2:',horzcat(' ',share_2,'.png')));
    
    set(handles.text7,'string','Enter Red   Key:');
end    
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Decryption_3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Decryption_3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
%global CHNG;
%CHNG=0;
varargout{1} = handles.output;


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global share1;
global share2;
global width;
global height;
keyvalue = get(handles.key_val,'String');

global CHNG;
global RDBL;    global GNBL;    global RDGN;
global share_1; global share_2;

disp(CHNG);
if CHNG==1
    if strcmp(share_1,'RB Share')==1        ,share1=RDBL;
    elseif strcmp(share_1,'RG Share')==1    ,share1=RDGN;        
    elseif strcmp(share_1,'GB Share')==1    ,share1=GNBL;
    end    
    if strcmp(share_2,'RB Share')==1        ,share2=RDBL;
    elseif strcmp(share_2,'RG Share')==1    ,share2=RDGN;        
    elseif strcmp(share_2,'GB Share')==1    ,share2=GNBL;
    else                                     share2=share1;
    end    
end  

if isempty(share1) ==0 || isempty(share2) == 0
    if isempty(keyvalue) == 0
        if isempty(share1) ==1
                if isempty(share2) == 0 ,share1=share2;
                end    
        elseif isempty(share2) == 1     ,share2=share1;
        end    
        
        temp1 = share1(:,:,2);
        temp2 = share2(:,:,2);    
    
        r = temp1;
        g = temp1;
        b = temp1;

        if temp1(1,1) == 0 && temp2(1,1) == 128
            r = share1(:,:,1);
            g = share1(:,:,3);
            b = share2(:,:,3);
        elseif temp1(1,1) == 0 && temp2(1,1) == 255
            r = share1(:,:,1);
            g = share1(:,:,3);
            b = share2(:,:,3);
        elseif temp1(1,1) == 128 && temp2(1,1) == 0
            r = share1(:,:,1);
            g = share2(:,:,3);
            b = share1(:,:,3);
        elseif temp1(1,1) == 128 && temp2(1,1) == 255
            r = share1(:,:,1);
            g = share2(:,:,1);
            b = share1(:,:,3);
        elseif temp1(1,1) == 255 && temp2(1,1) == 0
            r = share2(:,:,1);
            g = share1(:,:,1);
            b = share1(:,:,3);
        elseif temp1(1,1) == 255 && temp2(1,1) == 128
            r = share2(:,:,1);
            g = share1(:,:,1);
            b = share1(:,:,3);
        end

        keyb='';  keyg='';   func='';
            global RED;
            global BLUE;
            global GREEN;
            disp(CHNG);
            if CHNG ==1
                keyb=get(handles.blue_key_val,'string');
                keyg=get(handles.green_key_val,'string');
                func=get(handles.func_seq,'string');
    
                f=parse_func_seq(func);
                disp('Function Sequence is: ');disp(f);
                disp(class(f));
                rf=f;
                n=size(f,2);
                for i= 1:size(f,2)
                    rf(1,i)=f(1,n);
                    n=n-1;
                end
                disp('Reverse Function Sequence is: ');disp(rf);
    
                keyr=uint16(str2double(keyvalue));   disp(keyr);
                keyg=uint16(str2double(keyg));       disp(keyg);
                keyb=uint16(str2double(keyb));       disp(keyb);
        
                disp(size(rf));
                disp(size(keyr));
                disp(size(r));
    
                %Recovering RED Share
                %Applying function sequence for Red Key
                r=funct_encrypt(1,rf,keyr,1,r);

                %Recovering GREEN Share
                %Applying function sequence for Green Key
                g=funct_encrypt(1,rf,keyg,1,g);
    
                %Recovering BLUE Share
                %Applying function sequence for Blue Key
                b=funct_encrypt(1,rf,keyb,1,b);

                if(r == RED)  ,  disp('Exp Successful');
                else             disp('Exp Un-Successful');
                end    
                if(b == BLUE) ,  disp('Exp Successful');
                else             disp('Exp Un-Successful');
                end    
                if(g == GREEN),  disp('Exp Successful');
                else             disp('Exp Un-Successful');
                end     
    
                rgbShare = uint8(cat(3,r,g,b));
                [width, height, ~] = size(rgbShare);
                imwrite(rgbShare, 'finaloutput.png', 'png');
            else
                rgbShare = cat(3,r,g,b);
                [width, height, ~] = size(rgbShare);
                imwrite(rgbShare, 'output.png', 'png');
                key = keyGen(width*height,keyvalue);
                output_image = imageProcess(imread('output.png'),key);
                imwrite(output_image,'finaloutput.png','png');
            end    

    figure;
    imshow('finaloutput.png');
    msgbox('Image Decrypted.');
    guidata(hObject, handles);
    else    msgbox('There is no Key Input.');
    end
else if CHNG == 0
            disp('There are no shares selected.');
            msgbox('There are no shares selected.');
    else    msgbox('You need to first generate shares.');   
     end
end    

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global share1;
[file,path] = uigetfile('*.jpg;*.bmp;*.tiff;*.ppm;*.pgm;*.png','Pick an Image File','.\Encrypted_images\2_of_3','MultiSelect','off');
if file ~=0         
    File=horzcat(path,file);
    share1 = imread(File);
    set(handles.share_1,'string',strcat('Select Share 1:',horzcat(' ',file)));
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


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global share2;
[file,path] = uigetfile('*.jpg;*.bmp;*.tiff;*.ppm;*.pgm;*.png','Pick an Image File','.\Encrypted_images\2_of_3','MultiSelect','off');
if file ~=0         
    File=horzcat(path,file);
    share2 = imread(File);
    set(handles.share_2,'string',strcat('Select Share 2:',horzcat(' ',file)));
end    
guidata(hObject, handles);



function blue_key_val_Callback(hObject, eventdata, handles)
% hObject    handle to blue_key_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of blue_key_val as text
%        str2double(get(hObject,'String')) returns contents of blue_key_val as a double


% --- Executes during object creation, after setting all properties.
function blue_key_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to blue_key_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function green_key_val_Callback(hObject, eventdata, handles)
% hObject    handle to green_key_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of green_key_val as text
%        str2double(get(hObject,'String')) returns contents of green_key_val as a double

% --- Executes during object creation, after setting all properties.
function green_key_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to green_key_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function func_seq_Callback(hObject, eventdata, handles)
% hObject    handle to func_seq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of func_seq as text
%        str2double(get(hObject,'String')) returns contents of func_seq as a double


% --- Executes during object creation, after setting all properties.
function func_seq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to func_seq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in back_btn.
function back_btn_Callback(hObject, eventdata, handles)
% hObject    handle to back_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global CHNG;
if CHNG==1
        Decryption;
        close 'Decrypt Data Dialog Box: 2 of 3 Visual Cryptographic Scheme using Randomisation';
else    Decryption_1;
        close 'Decrypt Data Dialog Box: 2 of 3 Visual Cryptographic Scheme';    
end

% --- Executes on button press in reset_btn.
function reset_btn_Callback(hObject, eventdata, handles)
% hObject    handle to reset_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Resetting UI
set(handles.share_1,'string','Select Share 1:');
set(handles.share_2,'string','Select Share 2:');
set(handles.key_val,'string','');
global CHNG;    global Null;

if CHNG ==1
    set(handles.blue_key_val,'string','');
    set(handles.green_key_val,'string','');
    set(handles.func_seq,'string','');
end

%Resetting File values
global share1;  global share2;
share1=Null;    share2=Null;

%   %%%%%%