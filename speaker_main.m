name = input ('Enter the name that must be recognized -- >','s');
ytemp = zeros (88200,20);
r = zeros (10,1);
for j = 1:10
    file = sprintf('%s%d.wav','g',j);
    [t, fs] = wavread(file);
    s = abs (t);
    start = 1;
    last = 88200;
    for i = 1:88200
        if s (i) >=.1 && i <=7000
            start = 1;
            break  
        end
        if s (i) >=.1 && i > 7000
            start = i-7000;
            break  
        end
    end
    for i = 1:88200
        k = 88201-i;
        if s (k)>=.1 && k>=81200
            last = 88200;
            break  
        end
        if s (k)>= .1 && k <81200
            last = k + 7000;
            break  
        end 
    end
    r (j) = last-start;
    ytemp (1: last - start + 1,2 * j) = t (start:last);
    ytemp (1: last - start + 1,(2*j - 1)) = t (start:last);
end
% The rows of the matrix are truncated to the smallest length 
% of the 10 recordings. 
y = zeros (min (r),20);
for i = 1:20
    y (:,i) = ytemp (1:min (r),i);
end
% Convert the individual columns into frequency
% domain by applying the Fast Fourier Transform. 
%Then take the modulus squared of all the entries in the matrix. 
fy = fft (y);fy = fy.*conj (fy);
% Normalize the spectra of each recording and place into the matrix fn. 
%Only frequiencies upto 600 are needed to represent the speech of most 
% humans. 
fn = zeros (600,20);
for i = 1:20
    fn (1:600,i) = fy (1:600,i)/sqrt(sum (abs (fy (1:600,i)).^2));
end
% Find the average vector pu 
pu = zeros (600,1);
for i = 1:20
    pu = pu + fn (1:600,i);
end
pu = pu/20;
% Normalize the average vector 
tn = pu/sqrt(sum (abs (pu).^2));
% Find the Standard Deviation 
std = 0;
for i = 1:20
    std = std + sum (abs (fn (1:600,i)-tn).^2);
end
std = sqrt (std/19);
%%%%%%%% Verification Process %%%%%%%% 
input ('You will have 2 seconds to say your name. Press enter when ready')
% Record Voice and confirm if the user is happy with their recording 
usertemp = wavrecord (88200,44100);
sound (usertemp,44100);
'';
rec = input ('Are you happy with this recording? \nPress 1 to record again or just press enter toproceed--> ');
while rec == 1
rec =0;
input ('You will have 2 seconds to say your name. Press enter when ready')
usertemp = wavrecord (88200,44100);
sound (usertemp,44100);
rec = input ('Are you happy with this recording? \nPress 1 to record again or just press enter toproceed--> ');
end
% Crop recording to a window that just contains the speech 
s = abs (usertemp);
start = 1;
last = 88200;
for i = 1:88200
if s (i) >=.1 && i <=5000
    start = 1;
    break  
end
if s (i) >=.1 && i > 5000
    start = i-5000;
    break  
end
end
for i = 1:88200
    k = 88201-i;
    if s (k)>=.1 && k>=83200
        last = 88200;
        break  
    end
    if s (k)>= .1 && k <83200
        last = k + 5000;
        break  
    end
end
% Transform the recording with FFT and normalize 
user = usertemp (start:last);
userftemp = fft (user);
userftemp = userftemp.*conj (userftemp);
userf = userftemp (1:600);
userfn = userf/sqrt(sum (abs (userf).^2));
% Plot the spectra of the recording along with the average normal vector holdon;
subplot (2,1,1);
plot (userfn)
title ('Normalized Frequency Spectra Of Recording')
subplot (2,1,2);
plot (tn);
title ('Normalized Frequency Spectra of Average')
% Confirm weather user's voice is within two standard deviations of mean. 
s = sqrt (sum (abs (userfn - tn).^2));

if s < 2*std
    name = strcat ('HELLO----',name,' !!!!');
else 
    name = strcat ('YOU ARE NOT---- ',name,' !!!!');
end