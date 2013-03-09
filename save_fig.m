function save_fig(filename,LineWidth,dimensions,Fontsize)
%dimensions: figure dimensions in centimeters [widthcm, hightcm]
%set fontsize to NaN or -1 to keep the current fontsize settings.

if nargin < 2 || isempty(LineWidth) 
    LineWidth = 2;
end

if nargin < 4
    Fontsize = 14;
end

%set fontsize
if Fontsize ~= -1
    obj = findall(gcf,'type','Text'); set(obj,'FontSize',Fontsize)
    obj = findall(gcf,'type','axes'); set(obj,'FontSize',Fontsize)
    set(gca,'FontSize',Fontsize)
end
%Set LineWidth
obj = findall(gcf,'type','Line'); set(obj,'LineWidth',LineWidth)

%Maybe a little redundant

%If the paper size is not default set it.
if nargin < 3 
   dimensions(1) = 15;
   dimensions(2) = 12;
end

set(gcf,'PaperPositionMode','manual');
set(gcf,'PaperUnits','centimeters');
set(gcf,'PaperPosition',[1 1 dimensions(1) dimensions(2)]);
try
    print(gcf,'-depsc',[filename '.eps'])
catch 
    warning('Could not save EPS file')
end
saveas(gcf,filename,'fig')
saveas(gcf,filename,'png')