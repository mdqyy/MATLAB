function img = fdf(filepath,show)
% m-file that can open Varian FDF imaging files in Matlab.
% Usage:    img = fdf;
%           img = fdf(path,'s')
% Your image data will be loaded into img
% if the second argument is 's' the image is displayed.
%
% Shanrong Zhang
% Department of Radiology
% University of Washington
% 
% email: zhangs@u.washington.edu
% Date: 12/19/2004
% 
% Fix Issue so it is able to open both old Unix-based and new Linux-based FDF
% Date: 11/22/2007
%
% Modified by Casper Sønderby - 22/5/2011 - loads image from input string
% or uigetfile if no path is specified
% path example: /Users/casperkaae/Dropbox/Bachelor_Projekt/scannerdata/....

warning off MATLAB:divideByZero;

if(exist('show','var')==0)
    show = 0;
end

if(nargin<1)    
    [filename pathname] = uigetfile('*.fdf','Please select a fdf file');
    filepath = [pathname filename];
end

    [fid] = fopen(filepath,'r');

num = 0;
done = false;
machineformat = 'ieee-be'; % Old Unix-based  
line = fgetl(fid);
%disp(line)
while (~isempty(line) && ~done)
    line = fgetl(fid);
    % disp(line)
    if strmatch('int    bigendian', line)
        machineformat = 'ieee-le'; % New Linux-based    
    end
    
    if strmatch('float  matrix[] = ', line)
        [token, rem] = strtok(line,'float  matrix[] = { , };');
        M(1) = str2num(token);
        M(2) = str2num(strtok(rem,', };'));
    end
    if strmatch('float  bits = ', line)
        [token, rem] = strtok(line,'float  bits = { , };');
        bits = str2num(token);
    end

    num = num + 1;
    
    if num > 41
        done = true;
    end
end

skip = fseek(fid, -M(1)*M(2)*bits/8, 'eof');

img = fread(fid, [M(1), M(2)], 'float32', machineformat);

img = img';

if(show=='s')
    figure;
    imshow(img, []); 
    colormap(gray);
    axis image;
    axis off;
end

fclose(fid);

% end of m-code
