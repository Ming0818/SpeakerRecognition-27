function varargout = MFCC_Method(varargin)
% MFCC_METHOD M-file for MFCC_Method.fig
%      MFCC_METHOD, by itself, creates a new MFCC_METHOD or raises the existing
%      singleton*.
%
%      H = MFCC_METHOD returns the handle to a new MFCC_METHOD or the handle to
%      the existing singleton*.
%
%      MFCC_METHOD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MFCC_METHOD.M with the given input arguments.
%
%      MFCC_METHOD('Property','Value',...) creates a new MFCC_METHOD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MFCC_Method_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MFCC_Method_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MFCC_Method

% Last Modified by GUIDE v2.5 12-Dec-2013 01:51:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MFCC_Method_OpeningFcn, ...
                   'gui_OutputFcn',  @MFCC_Method_OutputFcn, ...
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


% --- Executes just before MFCC_Method is made visible.
function MFCC_Method_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MFCC_Method (see VARARGIN)

% Choose default command line output for MFCC_Method
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MFCC_Method wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MFCC_Method_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in AVoiceRecord.
function AVoiceRecord_Callback(hObject, eventdata, handles)
% hObject    handle to AVoiceRecord (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fs = 10000;
t = hamming(4000);
w = [t ; zeros(6000,1)];
f = (1:10000);
mel(f) = 2595 * log(1 + f / 700);
tri = triang(100);
win1 = [tri ; zeros(9900,1)];
win2 = [zeros(50,1) ; tri ; zeros(9850,1)];
win3 = [zeros(100,1) ; tri ; zeros(9800,1)];
win4 = [zeros(150,1) ; tri ; zeros(9750,1)];
win5 = [zeros(200,1) ; tri ; zeros(9700,1)];
win6 = [zeros(250,1) ; tri ; zeros(9650,1)];
win7 = [zeros(300,1) ; tri ; zeros(9600,1)];
win8 = [zeros(350,1) ; tri ; zeros(9550,1)];
win9 = [zeros(400,1) ; tri ; zeros(9500,1)];
win10 = [zeros(450,1) ; tri ; zeros(9450,1)];
win11 = [zeros(500,1) ; tri ; zeros(9400,1)];
win12 = [zeros(550,1) ; tri ; zeros(9350,1)];
win13 = [zeros(600,1) ; tri ; zeros(9300,1)];
win14 = [zeros(650,1) ; tri ; zeros(9250,1)];
win15 = [zeros(700,1) ; tri ; zeros(9200,1)];
win16 = [zeros(750,1) ; tri ; zeros(9150,1)];
win17 = [zeros(800,1) ; tri ; zeros(9100,1)];
win18 = [zeros(850,1) ; tri ; zeros(9050,1)];
win19 = [zeros(900,1) ; tri ; zeros(9000,1)];
win20 = [zeros(950,1) ; tri ; zeros(8950,1)];
x = wavrecord(1 * fs, fs,'double');
axes(findobj('Tag','axes2'));
hold on;
plot(x);
wavplay(x);
i = 1;
while abs(x(i)) <0.05
i = i + 1;
end
x(1 : i) = [];
x(6000 : 10000) = 0;
x1 = x.* w;mx = fft(x1);
nx = abs(mx(floor(mel(f))));
nx = nx./ max(nx);
nx1 = nx.* win1;
nx2 = nx.* win2;
nx3 = nx.* win3;
nx4 = nx.* win4;
nx5 = nx.* win5;
nx6 = nx.* win6;
nx7 = nx.* win7;
nx8 = nx.* win8;
nx9 = nx.* win9;
nx10 = nx.* win10;
nx11 = nx.* win11;
nx12 = nx.* win12;
nx13 = nx.* win13;
nx14 = nx.* win14;
nx15 = nx.* win15;
nx16 = nx.* win16;
nx17 = nx.* win17;
nx18 = nx.* win18;
nx19 = nx.* win19;
nx20 = nx.* win20;
sx1 = sum(nx1.^ 2);
sx2 = sum(nx2.^ 2);
sx3 = sum(nx3.^ 2);
sx4 = sum(nx4.^ 2);
sx5 = sum(nx5.^ 2);
sx6 = sum(nx6.^ 2);
sx7 = sum(nx7.^ 2);
sx8 = sum(nx8.^ 2);
sx9 = sum(nx9.^ 2);
sx10 = sum(nx10.^ 2);
sx11 = sum(nx11.^ 2);
sx12 = sum(nx12.^ 2);
sx13 = sum(nx13.^ 2);
sx14 = sum(nx14.^ 2);
sx15 = sum(nx15.^ 2);
sx16 = sum(nx16.^ 2);
sx17 = sum(nx17.^ 2);
sx18 = sum(nx18.^ 2);
sx19 = sum(nx19.^ 2);
sx20 = sum(nx20.^ 2);
sx = [sx1, sx2, sx3, sx4, sx5, sx6, sx7, sx8, sx9, sx10, sx11, sx12, sx13, sx14, sx15, sx16, sx17,sx18, sx19, sx20];
sx = log(sx);dx = dct(sx);
fid = fopen('sample.dat','w');
fwrite(fid, dx,'real*8');
fclose(fid);

% --- Executes on button press in BVoiceRecord.
function BVoiceRecord_Callback(hObject, eventdata, handles)
% hObject    handle to BVoiceRecord (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fs = 10000;% ����� ������� 
t = hamming(4000);% Hamming window
w = [t ; zeros(6000,1)];
f = (1:10000);
mel(f) = 2595 * log(1 + f / 700);% Mel ������� ���������� ���� ���������� ����� 
tri = triang(100);
win1 = [tri ; zeros(9900,1)];% ���������� ������ ?��?�� ��������� ���������� �����.
win2 = [zeros(50,1) ; tri ; zeros(9850,1)];% ���������� �?���� ������� 
win3 = [zeros(100,1) ; tri ; zeros(9800,1)];
win4 = [zeros(150,1) ; tri ; zeros(9750,1)];
win5 = [zeros(200,1) ; tri ; zeros(9700,1)];
win6 = [zeros(250,1) ; tri ; zeros(9650,1)];
win7 = [zeros(300,1) ; tri ; zeros(9600,1)];
win8 = [zeros(350,1) ; tri ; zeros(9550,1)];
win9 = [zeros(400,1) ; tri ; zeros(9500,1)];
win10 = [zeros(450,1) ; tri ; zeros(9450,1)];
win11 = [zeros(500,1) ; tri ; zeros(9400,1)];
win12 = [zeros(550,1) ; tri ; zeros(9350,1)];
win13 = [zeros(600,1) ; tri ; zeros(9300,1)];
win14 = [zeros(650,1) ; tri ; zeros(9250,1)];
win15 = [zeros(700,1) ; tri ; zeros(9200,1)];
win16 = [zeros(750,1) ; tri ; zeros(9150,1)];
win17 = [zeros(800,1) ; tri ; zeros(9100,1)];
win18 = [zeros(850,1) ; tri ; zeros(9050,1)];
win19 = [zeros(900,1) ; tri ; zeros(9000,1)];
win20 = [zeros(950,1) ; tri ; zeros(8950,1)];
y = wavrecord(1 * fs, fs,'double'); %���� ?� ������ �������� �������� ����� ����� �����.
axes(findobj('Tag','axes3'));
hold on;
plot(y);
wavplay(y);
i = 1;
while abs(y(i)) < 0.05 % ��������� ����������� 
i = i + 1;
end
y(1 : i) = [];
y(6000 : 10000) = 0;
y1 = y.* w;
my = fft(y1); %  ���������� �?���� ��������
ny = abs(my(floor(mel(f)))); % Mel warping 
ny = ny./ max(ny);
ny1 = ny.* win1;
ny2 = ny.* win2;
ny3 = ny.* win3;
ny4 = ny.* win4;
ny5 = ny.* win5;
ny6 = ny.* win6;
ny7 = ny.* win7;
ny8 = ny.* win8;
ny9 = ny.* win9;
ny10 = ny.* win10;
ny11 = ny.* win11;
ny12 = ny.* win12;
ny13 = ny.* win13;
ny14 = ny.* win14;
ny15 = ny.* win15;
ny16 = ny.* win16;
ny17 = ny.* win17;
ny18 = ny.* win18;
ny19 = ny.* win19;
ny20 = ny.* win20;
sy1 = sum(ny1.^ 2);
sy2 = sum(ny2.^ 2);
sy3 = sum(ny3.^ 2);
sy4 = sum(ny4.^ 2);
sy5 = sum(ny5.^ 2);
sy6 = sum(ny6.^ 2);
sy7 = sum(ny7.^ 2);
sy8 = sum(ny8.^ 2);
sy9 = sum(ny9.^ 2);
sy10 = sum(ny10.^ 2);% ���� �?���� ������� ������ �����������
sy11 = sum(ny11.^ 2);% ����������� ������ �?������ ���������� ?���� �����
sy12 = sum(ny12.^ 2);
sy13 = sum(ny13.^ 2);
sy14 = sum(ny14.^ 2);
sy15 = sum(ny15.^ 2);
sy16 = sum(ny16.^ 2);
sy17 = sum(ny17.^ 2);
sy18 = sum(ny18.^ 2);
sy19 = sum(ny19.^ 2);
sy20 = sum(ny20.^ 2);
sy = [sy1, sy2, sy3, sy4, sy5, sy6, sy7, sy8, sy9, sy10, sy11, sy12, sy13, sy14, sy15, sy16, sy17,sy18, sy19, sy20];
sy = log(sy);
dy = dct(sy);% ������ �?������ �������� Log DCT ���������� �����.
fid = fopen('sample.dat','r');
dx = fread(fid, 20,'real*8');% feature vector -��� ���� ?���� ��� �����.
fclose(fid);
dx = dx.';
MSE=(sum((dx - dy).^ 2)) / 20;% ������� �������� ������ ������ ���������� �����.
if MSE<5
    fprintf('\n\nYou are the same user\n\n');
    msg1='You are the same user';
    color1='green';
    %Grant=wavread('Grant.wav'); % �Access Granted�
    %wavplay(Grant); 
else fprintf('\n\nYou are not a same user\n\n');
    msg1 = 'You are not a same user';
    color1='red';
    %Deny=wavread('Deny.wav'); % �Access Denied�
    %wavplay(Deny); 
end 

set(handles.Result, 'String', msg1,'BackgroundColor',color1);

function Result_Callback(hObject, eventdata, handles)
% hObject    handle to Result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Result as text
%        str2double(get(hObject,'String')) returns contents of Result as a double


% --- Executes during object creation, after setting all properties.
function Result_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
