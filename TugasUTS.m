function varargout = TugasUTS(varargin)
% TUGASUTS M-file for TugasUTS.fig
%      TUGASUTS, by itself, creates a new TUGASUTS or raises the existing
%      singleton*.
%
%      H = TUGASUTS returns the handle to a new TUGASUTS or the handle to
%      the existing singleton*.
%
%      TUGASUTS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TUGASUTS.M with the given input arguments.
%
%      TUGASUTS('Property','Value',...) creates a new TUGASUTS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TugasUTS_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TugasUTS_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TugasUTS

% Last Modified by GUIDE v2.5 08-Dec-2019 22:19:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TugasUTS_OpeningFcn, ...
                   'gui_OutputFcn',  @TugasUTS_OutputFcn, ...
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


% --- Executes just before TugasUTS is made visible.
function TugasUTS_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TugasUTS (see VARARGIN)

% Choose default command line output for TugasUTS
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TugasUTS wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TugasUTS_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[rawname rawpath]=uigetfile({'*.jpeg;*.png';'*.jpg'},'Ambil File Image');
fullname = [rawpath rawname];
if rawpath
    set(handles.edit2,'String', fullname);
else
    set(handles.edit2,'String', 'Please Select an Image');
    return;
end

x = imread(fullname);
axes(handles.axes1)
imshow(x)

x = im2bw(x)
x = x*2-1;
% x = im2uint8(x)
x = reshape(transpose(x),[],1);
% membuat variabel global
handles.xp=x;
guidata(hObject,handles)

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

load bobot
a=hardlims(W*handles.xp);
a2=transpose(reshape(a,[3 5]))
% [a p1 p2 p3 p4]
% imshow(a2)
% [a p1 p2 p3 p4]
% answer
% n1 = norm(a-p1)
% n2 = norm(a-p2)
% n3 = norm(a-p3)
% n4 = norm(a-p4)
% n5 = norm(a-p5)
% [n1 n2 n3 n4 n5]
rawData = [p1 p2 p3 p4 p5];
targetNumber = [5 6 7 8 9];
[rowsD, colsD]=size(rawData)
found = 0
for k=1:colsD
    target = rawData(:,k)
    if (target == a)
        found = k
    end
end
if found > 0
    set(handles.edit1,'String',targetNumber(found));
else
    set(handles.edit1,'String','Pattern not found');
end
% if a == p1
%     set(handles.edit1,'String','5');
% elseif a == p2
%     set(handles.edit1,'String','6');
% elseif a == p3
%     set(handles.edit1,'String','7');
% elseif a == p4
%     set(handles.edit1,'String','8');
% elseif a == p5
%     set(handles.edit1,'String','9');
% else
%     %     hitung normalization
%     %     datalatih = [p1 p2 p4];
%     %     target = [5 6 8];
%     %     network = newff(datalatih,target,[4,1]);
%     %     network = train(network,datalatih,target);
%     angka = sim(network,a);
%     set(handles.edit1,'String',angka);
% end


axes(handles.axes2);
imshow(a2);


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
