% The current code produces data from 1975Q1 to 2019Q4

% Direction for updating data:
% (1) update the name of the excel file,the current data file is read into
% the variable "data0" by: data0=xlsread('data_gmz_May2019.xlsx',country);
% (2) change the end date of the data by: nend=(2019-nsamstart)*4+1; 2019
% is the fourth quarter of 2018
% (3) Update the data for all the six countries:country='Canada'; Valid
% country name includes " Australia		Canada		Southkorea		Sweden	Switzerland	UK"

% Ren Zhang: renz@bgsu.edu, May 5 2019




clear;
clc;
close all;


    

country='UK';  

% Australia		Canada		Southkorea		Sweden	Switzerland	UK.
output_name=['datagmz_',country];

%data0=xlsread('data_gmz_0706.xlsx',country); %1 date, 2 gdp, 3 core cpi, 4 policy rate, 5 nominal exchange
                                     %6 oecd export price 7 oecd import
                                     %price 8 g10 terms of trade 9
                                     %(optional) cpi. All data are from
                                     %Haver: 1960Q1-2018Q1
                                     
data0=xlsread('data_gmz_May2019.xlsx',country);

ind_mac=1;    if ind_mac==1; data0(:,1)=[]; end;   % use Mac will read the date series.                                 
nsamstart=1960.25;
  

dy=100*(log(data0(2:end,1))-log(data0(1:end-1,1)));
pi=100*(log(data0(2:end,2))-log(data0(1:end-1,2)));
int=data0(2:end,3);
de=100*(log(data0(2:end,4))-log(data0(1:end-1,4)));
de=-de;                                % The exchange rate data is the opposite to the concept in LS2007
dpex=100*(log(data0(2:end,5))-log(data0(1:end-1,5))); 
dpim=100*(log(data0(2:end,6))-log(data0(1:end-1,6)));
dq=dpex-dpim; % In LS2007, q=P_{H,t}/P_{F,t}
dq_g10=100*(log(data0(2:end,7))-log(data0(1:end-1,7)));
    
nsamstart=nsamstart+0.25;    % Lost one observation when differencing the data 
   
 nstart=(1975.25-nsamstart)*4+1;
 nend=(2019-nsamstart)*4+1;
 
  htime=nstart:1:nend;    


 dy_obs=dy(nstart:nend,1);
 pi_obs=pi(nstart:nend,1);
 i_obs=int(nstart:nend,1);
 de_obs=de(nstart:nend,1);
 dq_obs=dq(nstart:nend,1);
 dqg10_obs=dq_g10(nstart:nend,1);

 save(output_name,'dy_obs','pi_obs','i_obs','dq_obs','de_obs','dqg10_obs')
 
% To uncomment this part, set nend=2014; 
%  corr(de_obs, de_caz)
%  corr(dq_obs, dq_caz)
%  corr(dqg10_obs, dq_caz)
%  figure
%  plot(htime,dq_obs), hold on; plot(htime,dq_caz); legend('update','Cazorzi')
% 





