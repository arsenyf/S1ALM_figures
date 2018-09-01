function  figure_plot_svm(svm_performance,t,legend_flag,key)

colr{2} = [1 0 1];
colr{1} = [0.5 0.5 0.5];
colr{3} = [0.75 0.75 0];

hold on;
Param = struct2table(fetch (ANL.Parameters,'*'));

t_go = Param.parameter_value{(strcmp('t_go',Param.parameter_name))};
t_chirp1 = Param.parameter_value{(strcmp('t_chirp1',Param.parameter_name))};
t_chirp2 = Param.parameter_value{(strcmp('t_chirp2',Param.parameter_name))};
t_sample_stim = Param.parameter_value{(strcmp('t_sample_stim',Param.parameter_name))};

yl=[50 100];
xl=[t(1) 1];

fill(t_sample_stim + [0 0 0.4 0.4], [0 100 100 0], [0.6 0.85 1], 'LineStyle', 'None');
plot([t_go t_go], [yl(1) yl(2)], 'k-','LineWidth',0.5,'clipping','off');
plot([t_chirp1 t_chirp1], [yl(1) yl(2)], 'k-','LineWidth',0.5,'clipping','off');
plot([t_chirp2 t_chirp2], [yl(1) yl(2)], 'k-','LineWidth',0.5,'clipping','off');

num=1;
if ~isempty(svm_performance(num).all)
    shadedErrorBar(t,svm_performance(num).m,svm_performance(num).stem,'lineprops',{'-','Color',colr{1},'markeredgecolor',colr{1},'markerfacecolor',colr{1},'linewidth',1});
end
num=2;
if ~isempty(svm_performance(num).all)
    shadedErrorBar(t,svm_performance(num).m,svm_performance(num).stem,'lineprops',{'-','Color',colr{2},'markeredgecolor',colr{2},'markerfacecolor',colr{2},'linewidth',1});
end
num=3;
if ~isempty(svm_performance(num).all)
    shadedErrorBar(t,svm_performance(num).m,svm_performance(num).stem,'lineprops',{'-','Color',colr{3},'markeredgecolor',colr{3},'markerfacecolor',colr{3},'linewidth',1});
end

xlim(xl);
ylim(yl);
if legend_flag==1
    text(-0.5+0.5,30,'vS1 left','FontSize',7,'Color',colr{1} );
    plot([-1.25 -0.75]+0.5,[30 30],'-','LineWidth',1,'Color',colr{1} ,'Clipping','off');
    text(3.5+1,30,'ALM left','FontSize',7,'Color',colr{2} );
    plot([2.75 3.25]+1,[30 30],'-','LineWidth',1,'Color',colr{2} ,'Clipping','off');
    text(8+1.5,30,'ALM right','FontSize',7,'Color',colr{3} );
    plot([7.25 7.75]+1.5,[30 30],'-','LineWidth',1,'Color',colr{3} ,'Clipping','off');
    text(-5,30,'Time (s)','FontSize',7,'HorizontalAlignment','left');
    text(xl(1)-diff(xl)*0.4, yl(1)+diff(yl)*0.5,sprintf('Decoder perform. \n(%%)'), 'FontSize',7,'HorizontalAlignment','center','Rotation',90);
    set(gca,'YTick',[50, 100],'FontSize',6,'XTick',[-2:2:0]);
    text(xl(1)-diff(xl)*0.8, yl(1)+diff(yl)*1.35, 'h', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
else
    set(gca,'YTick',[],'FontSize',6,'XTick',[-2:2:0]);
end

if strcmp(key.sensory_or_motor,'sensory')
    text(xl(1)+diff(xl)*0.5, yl(1)+diff(yl)*1.25,'Sensory', 'FontSize',7,'HorizontalAlignment','center');
elseif strcmp(key.sensory_or_motor,'motor')
    text(xl(1)+diff(xl)*0.5, yl(1)+diff(yl)*1.25,'Motor', 'FontSize',7,'HorizontalAlignment','center');
else
    text(xl(1)+diff(xl)*0.5, yl(1)+diff(yl)*1.25,'Sensory/Motor', 'FontSize',7,'HorizontalAlignment','center');
end
box off;
text(-1, yl(1)+diff(yl)*1, 'Delay', ...
    'fontsize', 6,'HorizontalAlignment','center');
