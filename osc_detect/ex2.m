clear;
%{
load('data_ipm.mat');
SampFreq = 60;

tStart = tic;  

k2 = 1
k = 0
%for k =  0:9

Sig = a(k2,k*1200+1:(k+1)*1200);


t1 = 1:1/SampFreq : 18;
t = t1;

[m,n]=size(Sig);
time=(1:n)/SampFreq;

fre=(SampFreq/2)/(n/2):(SampFreq/2)/(n/2):(SampFreq/2);
Ts  = SST(Sig',30);
Ts = abs(Ts);
% size(Ts)
% size(fre)
% size(time)


%end
tEnd = toc(tStart)
%}
% figure
% imagesc(time,fre,abs(Ts));
% axis xy
% ylabel('Freq / Hz');
% xlabel('Time / Sec')
% title('SST');
% ind = find(Ts(:,1)==max(max(Ts(:,1))))

tStart = tic;  
load('data_vpm.mat');
period = 60*4;
div= 2
k=0;
SampFreq = 60;

Sig = a(1,k*period+1:(k+1)*period);
Sig = Sig -mean(Sig);
Ts  = SST(Sig',30);
Ts = abs(Ts);
[m,n]=size(Sig)

time=(1:n)/SampFreq;
fre=(SampFreq/2)/(n/2):(SampFreq/2)/(n/2):(SampFreq/2)/div;
  
imagesc(time,fre,Ts(1:(period/2)/div,:));

%{
figure(1,"position",[0,0,1500,800])
for k = 0:15

  Sig = a(1,k*period+1:(k+1)*period);
  subplot(4,4,k+1);
  plot(Sig);
end  


figure(2,"position",[0,0,1500,800])
for k = 0:8
  SampFreq = 60;

  Sig = a(1,k*period+1:(k+1)*period);
  Sig = Sig -mean(Sig);
  %Sig = reshape(Sig,[1,1080]);
  [m,n]=size(Sig)

  Ts  = SST(Sig',30);
  Ts = abs(Ts);
  time=(1:n)/SampFreq;
  %fre=(SampFreq/2)/(n/2):(SampFreq/2)/(n/2):(SampFreq/2);
  fre=(SampFreq/2)/(n/2):(SampFreq/2)/(n/2):(SampFreq/2)/div;
  %figure
  subplot(3,3,k+1);
  %imagesc(time,fre,Ts(1:540,:));
  imagesc(time,fre,Ts(1:(period/2)/div,:));
  %plot(sum(Ts));
  %axis xy
  %ylabel('Freq / Hz');
  %xlabel('Time / Sec')
  %title('SST');

end
  %}
tEnd = toc(tStart)
