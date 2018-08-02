function [xl,yl]=figure_plotSpikeCount (Param, rel,labels_flag, key)

t_go = Param.parameter_value{(strcmp('t_go',Param.parameter_name))};
t_chirp1 = Param.parameter_value{(strcmp('t_chirp1',Param.parameter_name))};
t_chirp2 = Param.parameter_value{(strcmp('t_chirp2',Param.parameter_name))};
t_sample_stim = Param.parameter_value{(strcmp('t_sample_stim',Param.parameter_name))};
time = Param.parameter_value{(strcmp('psth_t_vector',Param.parameter_name))};
psth_time_bin = Param.parameter_value{(strcmp('psth_time_bin',Param.parameter_name))};
smooth_time =  Param.parameter_value{(strcmp('smooth_time_cell_psth_for_clustering',Param.parameter_name))};
smooth_bins=ceil(smooth_time/psth_time_bin);

if strcmp(key.brain_area,'vS1')
    PSTH_L = movmean(cell2mat(fetchn((rel.PSTH_l * EPHYS.UnitPosition * EXP.SessionTraining & ANL.IncludeUnit & ANL.IncludeSession & key) & 'outcome="hit"' & 'trial_type_name="l"', 'psth_avg', 'ORDER BY unit_uid')),[smooth_bins 0], 2, 'omitnan','Endpoints','shrink');
    PSTH_R = movmean(cell2mat(fetchn((rel.PSTH_r * EPHYS.UnitPosition * EXP.SessionTraining & ANL.IncludeUnit & ANL.IncludeSession & key) & 'outcome="hit"' & 'trial_type_name="r"', 'psth_avg', 'ORDER BY unit_uid')),[smooth_bins 0], 2, 'omitnan','Endpoints','shrink');
    yl=[0,30];
else
    PSTH_L = movmean(cell2mat(fetchn((rel.PSTH_l * EPHYS.UnitPosition * EXP.SessionTraining & ANL.IncludeUnit & ANL.IncludeSession & key) & 'unit_quality!="multi"' & 'outcome="hit"' & 'trial_type_name="l"', 'psth_avg', 'ORDER BY unit_uid')),[smooth_bins 0], 2, 'omitnan','Endpoints','shrink');
    PSTH_R = movmean(cell2mat(fetchn((rel.PSTH_r * EPHYS.UnitPosition * EXP.SessionTraining & ANL.IncludeUnit & ANL.IncludeSession & key) & 'unit_quality!="multi"' & 'outcome="hit"' & 'trial_type_name="r"', 'psth_avg', 'ORDER BY unit_uid')),[smooth_bins 0], 2, 'omitnan','Endpoints','shrink');
    yl=[0,10];
end
idx2plot= (time>=-4.5 & time<2);
time = time(idx2plot);

PSTH_L = PSTH_L (:,idx2plot);
PSTH_R = PSTH_R (:,idx2plot);


%% Left and Right mean FR
L.m=nanmean(PSTH_L,1);
L.stem=nanstd(PSTH_L,1)./sqrt(size(PSTH_L,1));
R.m=nanmean(PSTH_R,1);
R.stem=nanstd(PSTH_R,1)./sqrt(size(PSTH_R,1));

% y_max = round(100*nanmax([L.m+L.stem,R.m+R.stem]))/100;
% y_min = round(100*nanmin([L.m+L.stem,R.m+R.stem]))/100;

xl=[-3.5, 2];
xlim(xl);
% yl=[0,ceil(y_max)];
ylim(yl);

hold on;
fill(t_sample_stim + [0 0 0.4 0.4], [0 100 100 0], [0.6 0.85 1], 'LineStyle', 'None');
plot([t_go t_go], [yl(1) yl(2)], 'k--','LineWidth',0.5,'clipping','off');
plot([t_chirp1 t_chirp1], [yl(1) yl(2)], 'k--','LineWidth',0.5);
plot([t_chirp2 t_chirp2], [yl(1) yl(2)], 'k--','LineWidth',0.5);

shadedErrorBar(time,R.m,R.stem,'lineprops',{'b-','markerfacecolor','b','linewidth',1});
shadedErrorBar(time,L.m,L.stem,'lineprops',{'r-','markerfacecolor','r','linewidth',1},'transparent',1);


%% Absolute selectivity
Selectivity = abs([PSTH_R - PSTH_L]);

S.m=nanmean(Selectivity,1);
S.stem=nanstd(Selectivity,1)./sqrt(size(Selectivity,1));
shadedErrorBar(time,S.m,S.stem,'lineprops',{'-','Color',[0.5 1 0],'markeredgecolor',[0.5 1 0],'markerfacecolor',[0.5 1 0],'linewidth',0.75},'transparent',1);

%% Legends
if labels_flag==1
    text(xl(1)+diff(xl)*0.5, yl(1)-diff(yl)*0.5,'Time (s)', 'FontSize',7,'HorizontalAlignment','center');
    text(xl(1)-diff(xl)*0.4, yl(1)+diff(yl)*0.5,'Spikes s^{-1}', 'FontSize',7,'HorizontalAlignment','center','Rotation',90);
    set(gca,'YTick',yl,'XTick',[-4 -2 0 2],'FontSize',6);
else
    set(gca,'YTick',yl,'XTick',[],'FontSize',6);
end
box off;