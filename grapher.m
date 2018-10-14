data = load('AngularVelocityData.txt');

width = 12;
height = 8.5;
alw = 0.75;
fsz = 11;
msz = 8;
lw = 1.5;

Min = data(:,1);
Max = data(:,2);
F = data(:,3);
figure()
plot( F,Min, '+','LineWidth',lw,'MarkerSize',msz) 
hold on%Plot
plot(F,Max, '+','LineWidth',lw,'MarkerSize',msz)

%myPlot(1,1,'AngularVelocity',Min,F, 'auto','auto', 'omega','f','auto','auto','angular',alw,lw,fsz,msz)

function myPlot(sizeX, sizeY, Title, X, Y, Xticks, Yticks, Xlabel, Ylabel, Xlim, Ylim, fileName, alw, lw, fsz, msz)

    figure('NumberTitle', 'Off')
    pos = get(gcf, 'Position');
    set(gcf, 'Position', [pos(1) pos(2) sizeX*100, sizeY*100]); %<- Set size
    set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
    
    
    plot(X, Y, '+','LineWidth',lw,'MarkerSize',msz) %Plot
    
    %Set limits
    xlim(Xlim);
    ylim(Ylim);
    
    xlabel(Xlabel,'Interpreter','latex')
    ylabel(Ylabel,'Interpreter','latex')
    grid on
    
    set(gca,'XTick',Xticks);
    set(gca,'YTick',Yticks);
    
    % Here we preserve the size of the image when we save it.
    set(gcf,'InvertHardcopy','on');
    set(gcf,'PaperUnits', 'centimeters');
    papersize = get(gcf, 'PaperSize');
    left = (papersize(1)- sizeX)/2;
    bottom = (papersize(2)- sizeY)/2;
    myfiguresize = [left, bottom, sizeX, sizeY];
    set(gcf,'PaperPosition', myfiguresize);
    
    print(fileName,'-depsc2','-r300');

end