function [cf_ gof_] = adcmfit_3(tm,ADCM)
%same as adcmfit_2, but also fits ADC to the ADCm data
 tm = tm(:);
 ADCM = ADCM(:);



% --- Create fit ---                                        %on if robust fitting
fo_ = fitoptions('method','NonlinearLeastSquares','Robust','Off','Lower',[0 0 0],'Upper',[15 1 5],'DiffMinChange',1.0000000000000000623e-09,'TolFun',9.9999999999999995475e-08,'TolX',9.9999999999999995475e-08);
ok_ = isfinite(tm) & isfinite(ADCM);
if ~all( ok_ )
    warning( 'GenerateMFile:IgnoringNansAndInfs',...
        'Ignoring NaNs and Infs in data.' );
end
st_ = [0.80000000000000000416 0.50000000000000004441 1.00000];
set(fo_,'Startpoint',st_);
ft_ = fittype(['ADC*(1-sigma*exp(-AXR*tm))'],...
    'dependent',{'ADCM'},'independent',{'tm'},...
    'coefficients',{'AXR', 'sigma', 'ADC'});

% Fit this model using new data
[cf_ gof_] = fit(tm(ok_),ADCM(ok_),ft_,fo_);
% Alternatively uncomment the following lines to use coefficients from the
% original fit. You can use this choice to plot the original fit against new
% data.
%    cv_ = { 0.003801454702637618345, 0.15012008612495458815};
%    cf_ = cfit(ft_,cv_{:});

