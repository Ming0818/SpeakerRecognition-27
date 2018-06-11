for i = 1:10
file = sprintf('%s%d.wav','g',i);
input('You have 2 seconds to say your name. Press enter when ready to record--> ');
y = wavrecord(88200,44100);
sound(y,44100);
wavwrite(y,44100,file);
end 