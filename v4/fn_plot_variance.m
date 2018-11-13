function xl=fn_plot_variance(Param, time2plot, variance_explained)
set(gca, 'FontSize',8);

t_go = Param.parameter_value{(strcmp('t_go',Param.parameter_name))};
t_chirp1 = Param.parameter_value{(strcmp('t_chirp1',Param.parameter_name))};
t_chirp2 = Param.parameter_value{(strcmp('t_chirp2',Param.parameter_name))};
t_sample_stim = Param.parameter_value{(strcmp('t_sample_stim',Param.parameter_name))};
time = Param.parameter_value{(strcmp('psth_t_vector',Param.parameter_name))};
psth_time_bin = Param.parameter_value{(strcmp('psth_time_bin',Param.parameter_name))};
smooth_time =  Param.parameter_value{(strcmp('smooth_time_cell_psth_for_clustering',Param.parameter_name))};

hold on;
fill(t_sample_stim + [0 0 0.4 0.4], [0 100 100 0], [0.6 0.85 1], 'LineStyle', 'None');
plot([t_go t_go], [0 200], 'k-','LineWidth',0.5);
plot([t_chirp1 t_chirp1], [0 200], 'k-','LineWidth',0.5);
plot([t_chirp2 t_chirp2], [0 200], 'k-','LineWidth',0.5);

colr{1}=[ 0    0.3448         0];
colr{2}=[ 0    1.0000         0];
colr{3}=[0.5000         0    0.5000];

hold on
shadedErrorBar(time2plot,variance_explained.m(1,:),variance_explained.stem(1,:),'lineprops',{'-','Color',colr{2},'markerfacecolor',colr{1},'linewidth',1,'clipping','off'});
shadedErrorBar(time2plot,variance_explained.m(2,:),variance_explained.stem(2,:),'lineprops',{'-','Color',colr{1},'markerfacecolor',colr{2},'linewidth',1,'clipping','off'});
shadedErrorBar(time2plot,variance_explained.m(3,:),variance_explained.stem(3,:),'lineprops',{'-','Color',colr{3},'markerfacecolor',colr{3},'linewidth',1,'clipping','off'});
% plot(time2plot,sum(variance_explained.m(:,:)),'-k','linewidth',1);
xlabel('Time (s)','FontSize',8);
xl=[time2plot(1) time2plot(end)];
xlim(xl);


