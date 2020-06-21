% %% User-Interface Functions
%
%

function varargout = Encrypt(varargin)
% ENCRYPT MATLAB code for Encrypt.fig
%      ENCRYPT, by itself, creates a new ENCRYPT or raises the existing
%      singleton*.
%
%      H = ENCRYPT returns the handle to a new ENCRYPT or the handle to
%      the existing singleton*.
%
%      ENCRYPT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ENCRYPT.M with the given input arguments.
%
%      ENCRYPT('Property','Value',...) creates a new ENCRYPT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Encrypt_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Encrypt_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Encrypt

% Last Modified by GUIDE v2.5 26-Nov-2019 00:00:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Encrypt_OpeningFcn, ...
                   'gui_OutputFcn',  @Encrypt_OutputFcn, ...
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
end

% --- Executes just before Encrypt is made visible.
function Encrypt_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Encrypt (see VARARGIN)

% Choose default command line output for Encrypt
handles.output = hObject;
global KVALUE;
if (KVALUE<100)
    set(handles.k_val,'string',num2str(KVALUE,0));
end  

% Update handles structure
guidata(hObject, handles);
% UIWAIT makes Encrypt wait for user response (see UIRESUME)
% uiwait(handles.figure1);
end

% --- Outputs from this function are returned to the command line.
function varargout = Encrypt_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end

% --- Executes on button press in brwse_files.
function brwse_files_Callback(hObject, eventdata, handles)
% hObject    handle to brwse_files (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im;
global width;
global height;
[file,path] = uigetfile('*.jpg;*.bmp;*.tiff;*.ppm;*.pgm;*.png','Pick an Image File','MultiSelect','off');
File=horzcat(path,file);
disp(File);
im = imread(File);
[width, height, ~] = size(im);
set(handles.file_lbl,'string',strcat(' Choose File to Encrypt :  ',horzcat(' ',file)));
set(handles.disp_area,'visible','on');
cla(handles.disp_area,'reset');
axes(handles.disp_area);
imshow(im);
guidata(hObject, handles);
end

function encrypt_key_Callback(hObject, eventdata, handles)
% hObject    handle to encrypt_key (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of encrypt_key as text
%        str2double(get(hObject,'String')) returns contents of encrypt_key as a double
end

% --- Executes during object creation, after setting all properties.
function encrypt_key_CreateFcn(hObject, eventdata, handles)
% hObject    handle to encrypt_key (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function green_key_val_Callback(hObject, eventdata, handles)
% hObject    handle to green_key_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of green_key_val as text
%        str2double(get(hObject,'String')) returns contents of green_key_val as a double
end

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
end


function blue_key_val_Callback(hObject, eventdata, handles)
% hObject    handle to blue_key_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of blue_key_val as text
%        str2double(get(hObject,'String')) returns contents of blue_key_val as a double
end

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
end


% --- Executes on button press in encrypt_btn.
function encrypt_btn_Callback(hObject, eventdata, handles)
% hObject    handle to encrypt_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global width;
global height;
global im;

global CHNG;

keyvalue = get(handles.encrypt_key,'String');
if strlength(keyvalue)>7
    key = keyGen(width*height,keyvalue);
    encrypted_im = imageProcess(im,key);

    L1r=encrypted_im(:, :, 1);
    L1g=encrypted_im(:, :, 2);
    L1b=encrypted_im(:, :, 3);

    selectedIndex = get(handles.scheme_name, 'value');
    if selectedIndex ==1

        cd='.\Encrypted_images\3_of_3';

        figure;
        subplot(1,3,1),imshow(L1r);
        title('Red Share');
        temp=L1b;
        L1b=uint16(temp)*5;
        subplot(1,3,2),imshow(L1b);
        title('Blue Share');
        temp=L1g;
        L1g=uint16(temp)*3;
        subplot(1,3,3),imshow(L1g);
        title('Green Share');

        imwrite(L1r, fullfile(cd, 'RedShare.png')); 
        imwrite(L1g, fullfile(cd, 'GreenShare.png'));
        imwrite(L1b, fullfile(cd, 'BlueShare.png'));

    elseif selectedIndex ==2

        L2b=L1b;
        L2r=L1r;
        L2g=L1g;
        %Generating Fused Shares : RG and GB and BR

        L2b(:,:)=0;
        L2r(:,:)=255;
        L2g(:,:)=128;

        cd='.\Encrypted_images\2_of_3';
        RG=cat(3,L1r,L2b,L1g);
        GB=cat(3,L1g,L2r,L1b);
        RB=cat(3,L1r,L2g,L1b);

        imwrite(RG, fullfile(cd, 'RGShare.png'));    
        imwrite(GB, fullfile(cd, 'GBShare.png'));
        imwrite(RB, fullfile(cd, 'BRShare.png'));

        figure;
        %Generating and Saving Individual Share : RED
        subplot(1,3,1),imshow(RG);
        title('RG Share');    
        %Generating and Saving Individual Share : BLUE
        subplot(1,3,2),imshow(GB);
        title('GB Share');
        %Generating and Saving Individual Share : GREEN
        subplot(1,3,3),imshow(RB);
        title('BR Share');

    elseif selectedIndex == 3

        global FUNC;
        % Choice to Parse Function Sequence or not
        if CHNG == 1
                f=parse_func_seq(get(handles.func_seq,'string'));
                FUNC=f;

        else    f=FUNC;    
        end    

        keyr=str2num(get(handles.encrypt_key,'String'));
        keyb=str2num(get(handles.blue_key_val,'String'));
        keyg=str2num(get(handles.green_key_val,'String'));

        L1r=im(:, :, 1);
        L1g=im(:, :, 2);
        L1b=im(:, :, 3);

        global RED;
        global GREEN;
        global BLUE;

        RED=L1r;
        GREEN=L1g;
        BLUE=L1b;

        %Function Sequnce Evaluation with L1r
        red=(funct_encrypt(1,f,keyr,0,L1r));

        %Function Sequnce Evaluation with L1g
        green=(funct_encrypt(1,f,keyg,0,L1g));

        %Function Sequnce Evaluation with L1b
        blue=(funct_encrypt(1,f,keyb,0,L1b));

        CHNG=1;

        L2b=blue;
        L2r=red;
        L2g=green;
        %Generating Fused Shares : RG and GB and BR

        L2b(:,:)=0;
        L2r(:,:)=255;
        L2g(:,:)=128;

        cd='.\Encrypted_images\2_of_3';
        RG=cat(3,red,L2b,green);
        GB=cat(3,green,L2r,blue);
        RB=cat(3,red,L2g,blue);

        global RDGN;
        global GNBL;
        global RDBL;

        RDGN=RG;
        GNBL=GB;
        RDBL=RB;

        RG=double(RG);
        GB=double(GB);
        RB=double(RB);

        imwrite(RG, fullfile(cd, 'RGShare.png'));    
        imwrite(GB, fullfile(cd, 'GBShare.png'));
        imwrite(RB, fullfile(cd, 'BRShare.png'));

        figure;
        %Generating and Saving Individual Share : RED
        subplot(1,3,1),imshow(RG);
        title('RG Share');    
        %Generating and Saving Individual Share : BLUE
        subplot(1,3,2),imshow(GB);
        title('GB Share');
        %Generating and Saving Individual Share : GREEN
        subplot(1,3,3),imshow(RB);
        title('BR Share');
    end
    guidata(hObject, handles);
    msgbox('Shares generated.');
    % if CHNG==1
    %     Decryption;
    %     close Encrypt;
    % end    
end
end

% --- Executes on button press in nav_main_page.
function nav_main_page_Callback(hObject, eventdata, handles)
% hObject    handle to nav_main_page (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
MProjectMain;
close 'Encrypt Data Dialog Box';
end


% --- Executes on selection change in scheme_name.
function scheme_name_Callback(hObject, eventdata, handles)
% hObject    handle to scheme_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns scheme_name contents as cell array
%        contents{get(hObject,'Value')} returns selected item from scheme_name
num=get(hObject,'value');
switch num
    case 3    
        set(handles.green_key,'visible','on');
        set(handles.green_key_val,'visible','on');
        set(handles.blue_key,'visible','on');
        set(handles.blue_key_val,'visible','on');
        set(handles.func_seq_lbl,'visible','on');
        set(handles.func_seq,'visible','on');
        set(handles.key_lbl,'string',' Enter Red Key :');
        generate_funcSeq(4);
        global FUNC;
        str=num2str(FUNC);
        s='';
        for i=1:size(str,2)
            if      isspace(str(1,i))
            else
                 if  i<size(str,2) 
                        s=strcat(s,str(1,i),'.');
                 else   s=strcat(s,str(1,i));
                 end    
            end
        end
            disp(str);disp(s);
        set(handles.func_seq,'string',s);
        global CHNG;
        CHNG=0;
    otherwise
        set(handles.green_key,'visible','off');
        set(handles.green_key_val,'visible','off');
        set(handles.blue_key,'visible','off');
        set(handles.blue_key_val,'visible','off');
        set(handles.func_seq_lbl,'visible','off');
        set(handles.func_seq,'visible','off');
        set(handles.key_lbl,'string',' Enter Key :');
end
end

% --- Executes during object creation, after setting all properties.
function scheme_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to scheme_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

function func_seq_Callback(hObject, eventdata, handles)
% hObject    handle to func_seq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of func_seq as text
%        str2double(get(hObject,'String')) returns contents of func_seq as a double
global CHNG;
CHNG=1;
end

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
end
%   %%%%%%




%Programmer - Defined Functions
%
%
function eval_key(hObject,eventdata,handles)
% hObject    handle to encrypt_key (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%@(hObject,eventdata)Encrypt('eval_key',hObject,eventdata,guidata(hObject))
if(length(get(hObject,'string'))< 8)
  set(hObject,'BackgroundColor','red');
else
  set(hObject,'BackgroundColor','green');
end
set(hObject,'ForegroundColor','white');
end

function generate_funcSeq(len)
    %Generating and Storing Function Sequence
    global FUNC;
    FUNC=funct_encrypt(0,0,0,len,0);
    %Enables checking Generated Function Sequence on the command line
        %disp('Function Sequence is : ');disp(f);
end
%   %%%%%%
