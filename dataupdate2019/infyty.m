clear;
clc;
close all;


% ind_cazorzi=1;
% 
% if ind_cazorzi==1;
%    load datals_uk;
%    dy_caz=dy_obs; clear dy_obs;
%     pi_caz=pi_obs; clear pi_obs;
%      i_caz=i_obs; clear i_obs;
%       dq_caz=dq_obs; clear dq_obs;
%        de_caz=de_obs; clear de_obs;
%        
% end;
    



country='UK';  

% Australia	Belgium	Canada	Denmark	France	Netherlands	Norway	Southafrica	Southkorea	Spain	Sweden	Switzerland	UK.
output_name=['infyty',country];

data0=xlsread('data_gmz_May2019.xlsx',country); %1 date, 2 gdp, 3 core cpi, 4 policy rate, 5 nominal exchange
                                     %6 oecd export price 7 oecd import
                                     %price 8 g10 terms of trade 9
                                     %(optional) cpi. All data are from
                                     %Haver: 1960Q1-2018Q1
                                     
%data0=xlsread('data_gmz_0709.xlsx',country);

ind_mac=1;    if ind_mac==1; data0(:,1)=[]; end;   % use Mac will read the date series.                                 
nsamstart=1960.25;
  

piyty=100*(log(data0(5:end,2))-log(data0(1:end-4,2)));
    
nsamstart=nsamstart+0.25*4;    % Lost four observation when differencing the data 
   
 nstart=(1983.25-nsamstart)*4+1;
 nend=(2018.25-nsamstart)*4+1;
 
  htime=1983.25:0.25:2018.25;    



 piytyobs=piyty(nstart:nend,1)-mean(piyty(nstart:nend,1));
 
 figure; plot(htime, piytyobs);
 
 varname=genvarname(['piyty',country]);
 
 eval([varname '=piytyobs']);
 
% save('infyty',varname)
 
 save('infyty',varname,'-append')
 
    %     eval([rnatclose '= 4*median(StateVard(9,nPreSample+1:end,:),3);']);


% save(output_name,'dy_obs','pi_obs','i_obs','dq_obs','de_obs','dqg10_obs')
 
% To uncomment this part, set nend=2014; 
%  corr(de_obs, de_caz)
%  corr(dq_obs, dq_caz)
%  corr(dqg10_obs, dq_caz)
%  figure
%  plot(htime,dq_obs), hold on; plot(htime,dq_caz); legend('update','Cazorzi')
% 





