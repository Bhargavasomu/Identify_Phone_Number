function [ number ] = Eavesdrop( audiofilename )

[num0,Fs0] = audioread('0.ogg');    % applying fourier transform for each of the digits to get frequencies
temp0 = abs(fft(num0));
freq0 = 0:Fs0/length(temp0):Fs0/2;
temp0 = temp0(1:length(temp0)/2+1);
[max_01,ind01] = max(temp0);
temp0(ind01)=NaN;
[max_02,ind02] = max(temp0);
freq01 = freq0(ind01);
freq02 = freq0(ind02);

[num1,Fs1] = audioread('1.ogg');
temp1 = abs(fft(num1));
freq1 = 0:Fs1/length(temp1):Fs1/2;
temp1 = temp1(1:length(temp1)/2+1);
[max_11,ind11] = max(temp1);
temp1(ind11) = NaN;
[max_12,ind12] = max(temp1);
freq11 = freq1(ind11);
freq12 = freq1(ind12);

[num2,Fs2] = audioread('2.ogg');
temp2 = abs(fft(num2));
freq2 = 0:Fs2/length(temp2):Fs2/2;
temp2 = temp2(1:length(temp2)/2+1);
[max_11,ind21] = max(temp2);
temp2(ind11) = NaN;
[max_12,ind22] = max(temp2);
freq21 = freq2(ind21);
freq22 = freq2(ind22);

[num3,Fs3] = audioread('3.ogg');
temp3 = abs(fft(num3));
freq3 = 0:Fs3/length(temp3):Fs3/2;
temp3 = temp3(1:length(temp3)/2+1);
[max_11,ind31] = max(temp3);
temp3(ind31) = NaN;
[max_12,ind32] = max(temp3);
freq31 = freq3(ind31);
freq32 = freq3(ind32);

[num4,Fs4] = audioread('4.ogg');
temp4 = abs(fft(num4));
freq4 = 0:Fs4/length(temp4):Fs4/2;
temp4 = temp4(1:length(temp4)/2+1);
[max_11,ind41] = max(temp4);
temp4(ind41) = NaN;
[max_12,ind42] = max(temp4);
freq41 = freq4(ind41);
freq42 = freq4(ind42);

[num5,Fs5] = audioread('5.ogg');
temp5 = abs(fft(num5));
freq5 = 0:Fs5/length(temp5):Fs5/2;
temp5 = temp5(1:length(temp5)/2+1);
[max_11,ind51] = max(temp5);
temp5(ind51) = NaN;
[max_12,ind52] = max(temp5);
freq51 = freq5(ind51);
freq52 = freq5(ind52);

[num6,Fs6] = audioread('6.ogg');
temp6 = abs(fft(num6));
freq6 = 0:Fs6/length(temp6):Fs6/2;
temp6 = temp6(1:length(temp6)/2+1);
[max_11,ind61] = max(temp6);
temp6(ind61) = NaN;
[max_12,ind62] = max(temp6);
freq61 = freq6(ind61);
freq62 = freq6(ind62);

[num7,Fs7] = audioread('7.ogg');
temp7 = abs(fft(num7));
freq7 = 0:Fs7/length(temp7):Fs7/2;
temp7 = temp7(1:length(temp7)/2+1);
[max_11,ind71] = max(temp7);
temp7(ind71) = NaN;
[max_12,ind72] = max(temp7);
freq71 = freq7(ind71);
freq72 = freq7(ind72);

[num8,Fs8] = audioread('8.ogg');
temp8 = abs(fft(num8));
freq8 = 0:Fs8/length(temp8):Fs8/2;
temp8 = temp8(1:length(temp8)/2+1);
[max_11,ind81] = max(temp8);
temp8(ind81) = NaN;
[max_12,ind82] = max(temp8);
freq81 = freq8(ind81);
freq82 = freq8(ind82);

[num9,Fs9] = audioread('9.ogg');
temp9 = abs(fft(num9));
freq9 = 0:Fs9/length(temp9):Fs9/2;
temp9 = temp9(1:length(temp9)/2+1);
[max_11,ind91] = max(temp9);
temp9(ind91) = NaN;
[max_12,ind92] = max(temp9);
freq91 = freq9(ind91);
freq92 = freq9(ind92);

[y,Fs] = audioread(audiofilename);
number = NaN;
num_seconds = length(y)/Fs;             % finding the nuber of seconds in audio file
for i = 1:num_seconds
    y1 = y((44100*(i-1))+1 : 44100*i);
    x1 = abs(fft(y1));
    freq = 0:Fs/length(x1):Fs/2;
    req = x1(1:length(x1)/2+1);
    [max_1,ind1] = max(req);            % finding the main composite 2 frequencies
    req(ind1) = NaN;
    [max_2,ind2] = max(req);
    temp1=freq(ind1);
    temp2=freq(ind2);
    f1=min(temp1,temp2);
    f2=max(temp1,temp2);
    %disp(ind1);disp(ind2);
    if f1==freq01 && f2==freq02             % matching the frequencies to the digits
        number = strcat(number,'0');
    elseif f1==freq11 && f2==freq12 
        number = strcat(number,'1');
    elseif f1==freq21 && f2==freq22 
        number = strcat(number,'2');
    elseif f1==freq31 && f2==freq32 
        number = strcat(number,'3');
    elseif f1==freq41 && f2==freq42 
        number = strcat(number,'4');
    elseif f1==freq51 && f2==freq52 
        number = strcat(number,'5');
    elseif f1==freq61 && f2==freq62
        number = strcat(number,'6');
    elseif f1==freq71 && f2==freq72 
        number = strcat(number,'7');
    elseif f1==freq81 && f2==freq82 
        number = strcat(number,'8');
    elseif f1==freq91 && f2==freq92 
        number = strcat(number,'9');
    end
end

end