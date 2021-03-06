function Sup_FS_clustering()
close all;

dir_root = 'Z:\users\Arseny\Projects\SensoryInput\SiProbeRecording\'
dir_embeded_graphics = 'Z:\users\Arseny\Projects\SensoryInput\SiProbeRecording\Graphic_for_figures\'
dir_save_figure = [dir_root 'Results\figures\v2\'];
filename = 'Sup_FS_clustering';

%Graphics
%---------------------------------
figure;
set(gcf,'DefaultAxesFontName','helvetica');
set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 23 30]);
set(gcf,'PaperOrientation','portrait');
set(gcf,'Units','centimeters','Position',get(gcf,'paperPosition')+[3 0 0 0]);


panel_width1=0.055;
panel_height1=0.06;
horizontal_distance1=0.07;
vertical_distance1=0.082;

position_x1(1)=0.07;
position_x1(2)=position_x1(1)+horizontal_distance1*4.5;

position_y1(1)=0.8;
position_y1(2)=position_y1(1)-vertical_distance1;
position_y1(3)=position_y1(2)-vertical_distance1;
position_y1(4)=position_y1(3)-vertical_distance1*1.55;


panel_width2=0.05;
panel_height2=0.065;
horizontal_distance2=0.075;
vertical_distance2=0.32;

position_x2(1)=0.58;

position_y2(1)=0.785;
position_y2(2)=position_y2(1)-vertical_distance2;

position_x3(1)=0.12;

position_y3(1)=0.7;
position_y3(2)=position_y3(1)-vertical_distance2;

columns2plot=12;
min_cluster_percent=2.5;

Param = struct2table(fetch (ANL.Parameters,'*'));


%% Recording locations
axes('position', [position_x1(1)-0.03 position_y1(1) 0.06 0.06]); hold on ;
xl = [0 134];
yl = [0 135];
fig1_a = imread([dir_embeded_graphics 'left_vS1.jpg']);
fig1_a=flipdim(fig1_a,1);
imagesc(fig1_a);
set(gca,'Xlim',xl,'Ylim',yl);
text(xl(1)-diff(xl)/3.2, yl(1)+diff(yl)*1.15, 'a', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
text(xl(1)+diff(xl)*0.5, yl(1)+diff(yl)*1.1,'vS1 left','FontSize',7,'FontWeight','bold','Color',[0.5 0.5 0.5],'HorizontalAlignment','center');
axis off;
axis tight;
axis equal;

axes('position', [position_x1(1)-0.03 position_y1(1)-0.08 0.06 0.06]); hold on ;
xl = [0 121];
yl = [0 115];
fig1_a = imread([dir_embeded_graphics 'left_ALM.jpg']);
fig1_a=flipdim(fig1_a,1);
imagesc(fig1_a);
set(gca,'Xlim',xl,'Ylim',yl);
text(xl(1)-diff(xl)/3.2, yl(1)+diff(yl)*1.15, 'b', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
text(xl(1)+diff(xl)*0.5, yl(1)+diff(yl)*1.1,'ALM left','FontSize',7,'FontWeight','bold','Color',[1 0 1],'HorizontalAlignment','center');
axis off;
axis tight;
axis equal;

axes('position', [position_x1(1)-0.03 position_y1(1)-0.16 0.06 0.06]); hold on ;
xl = [0 152];
yl = [0 116];
fig1_a = imread([dir_embeded_graphics 'right_ALM.jpg']);
fig1_a=flipdim(fig1_a,1);
imagesc(fig1_a);
set(gca,'Xlim',xl,'Ylim',yl);
text(xl(1)-diff(xl)/3.2, yl(1)+diff(yl)*1.15, 'c', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
text(xl(1)+diff(xl)*0.5, yl(1)+diff(yl)*1.1,'ALM right','FontSize',7,'FontWeight','bold','Color',[0.75 0.75 0],'HorizontalAlignment','center');
axis off;
axis tight;
axis equal;

%% Raster plots and PSTHs
rel.PSTH_l = (EPHYS.Unit * EPHYS.UnitCellType * ANL.PSTHAdaptiveAverage & ANL.IncludeUnit & 'outcome="hit"' & 'trial_type_name="l"');
rel.PSTH_r = (EPHYS.Unit * EPHYS.UnitCellType * ANL.PSTHAdaptiveAverage & ANL.IncludeUnit & 'outcome="hit"' & 'trial_type_name="r"');

rel.spikes_l = ANL.TrialSpikesGoAligned * EPHYS.Unit * EPHYS.UnitPosition * EXP.BehaviorTrial * EXP.TrialName & ANL.IncludeUnit &  'outcome="hit"' & 'early_lick="no early"' & 'trial_type_name="l"' ;
rel.spikes_r = ANL.TrialSpikesGoAligned * EPHYS.Unit * EPHYS.UnitPosition  * EXP.BehaviorTrial * EXP.TrialName & ANL.IncludeUnit & 'outcome="hit"' & 'early_lick="no early"' & 'trial_type_name="r"';


%%vS1
k.unit_uid=3187; x=1; y=1; flag_xlable=0; flag_ylable=0; figure_plot_PSTH_FS(k,x,y,Param, rel, flag_xlable, flag_ylable, 1) % 2111
k.unit_uid=2253; x=2; y=1; flag_xlable=0; flag_ylable=0; figure_plot_PSTH_FS(k,x,y,Param, rel, flag_xlable, flag_ylable, 2)
k.unit_uid=2066; x=3; y=1; flag_xlable=0; flag_ylable=0; figure_plot_PSTH_FS(k,x,y,Param, rel, flag_xlable, flag_ylable, 3)

%%Left ALM
k.unit_uid=3974; x=1; y=2; flag_xlable=0; flag_ylable=0; figure_plot_PSTH_FS(k,x,y,Param, rel, flag_xlable, flag_ylable, 5)
k.unit_uid=2460; x=2; y=2; flag_xlable=0; flag_ylable=0; figure_plot_PSTH_FS(k,x,y,Param, rel, flag_xlable, flag_ylable, 6)
k.unit_uid=2588; x=3; y=2; flag_xlable=0; flag_ylable=0; figure_plot_PSTH_FS(k,x,y,Param, rel, flag_xlable, flag_ylable, 7)

%%Right ALM
k.unit_uid=2918; x=1; y=3; flag_xlable=1; flag_ylable=1; figure_plot_PSTH_FS(k,x,y,Param, rel, flag_xlable, flag_ylable, 9)
k.unit_uid=4770; x=2; y=3; flag_xlable=1; flag_ylable=0; figure_plot_PSTH_FS(k,x,y,Param, rel, flag_xlable, flag_ylable, 10)
k.unit_uid=2852; x=3; y=3; flag_xlable=1; flag_ylable=0; figure_plot_PSTH_FS(k,x,y,Param, rel, flag_xlable, flag_ylable, 11)



key=[];


%% Selectivity

% Left vS1
key.brain_area = 'vS1';
key.hemisphere = 'left';
key.training = 'regular';
key.cell_type = 'FS';
axes('position',[position_x1(2), position_y1(1), panel_width1*1.1, panel_height1]);
labels_flag=0;
[xl,yl]=figure_plotSpikeCount (Param, rel, labels_flag, key);
yl = [0 45];
text(xl(1)+diff(xl)*0.5, yl(1)+diff(yl)*1.2, 'Selectivity', ...
    'fontsize', 7,'HorizontalAlignment','center','Color',[0.5 1 0],'FontWeight','bold');
text(-0.9, yl(1)+diff(yl)*1.05, 'Delay', ...
    'fontsize', 6,'HorizontalAlignment','center');
text(xl(1)-diff(xl)*0.5, yl(1)+diff(yl)*1.05, 'd', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
set(gca,'Ylim',yl,'Ytick',yl);

% Left ALM
key.brain_area = 'ALM';
key.hemisphere = 'left';
key.training = 'regular';
key.cell_type = 'FS';
axes('position',[position_x1(2), position_y1(2), panel_width1*1.1, panel_height1]);
labels_flag=0;
[xl,yl]=figure_plotSpikeCount (Param, rel, labels_flag, key);
yl = [0 30];
set(gca,'Ylim',yl,'Ytick',yl);

%% Right ALM
key.brain_area = 'ALM';
key.hemisphere = 'right';
key.training = 'regular';
key.cell_type = 'FS';
axes('position',[position_x1(2), position_y1(3), panel_width1*1.1, panel_height1]);
labels_flag=1;
[xl,yl]=figure_plotSpikeCount (Param, rel, labels_flag, key);
yl = [0 30];
set(gca,'Ylim',yl,'Ytick',yl);
text(xl(1)+diff(xl)*0.5, yl(1)-diff(yl)*0.5,'Time (s)', 'FontSize',7,'HorizontalAlignment','center');
    text(xl(1)-diff(xl)*0.4, yl(1)+diff(yl)*0.5,'Spikes s^{-1}', 'FontSize',7,'HorizontalAlignment','center','Rotation',90);







%% Recording locations vS1
axes('position', [position_x2(1)-0.115 position_y2(1)+0.015 0.06, 0.06]); hold on ;
xl = [0 134];
yl = [0 135];
fig1_a = imread([dir_embeded_graphics 'left_vS1.jpg']);
fig1_a=flipdim(fig1_a,1);
imagesc(fig1_a);
set(gca,'Xlim',xl,'Ylim',yl);
text(xl(1)+diff(xl)*0.5, yl(1)+diff(yl)*1.1,'vS1 left','FontSize',7,'FontWeight','bold','Color',[0 0 0],'HorizontalAlignment','center');
axis off;
axis tight;
axis equal;

%Recording locations in ALM
axes('position', [position_x3(1)-0.115 position_y3(2)+0.09 0.06 0.06]); hold on ;
xl = [0 121];
yl = [0 115];
fig1_a = imread([dir_embeded_graphics 'left_ALM.jpg']);
fig1_a=flipdim(fig1_a,1);
imagesc(fig1_a);
set(gca,'Xlim',xl,'Ylim',yl);
text(xl(1)+diff(xl)*0.5, yl(1)+diff(yl)*1.4,sprintf('ALM \nleft & right'),'FontSize',7,'FontWeight','bold','Color',[0 0 0],'HorizontalAlignment','center');
axis off;
axis tight;
axis equal;


% fetch Param
Param = struct2table(fetch (ANL.Parameters,'*'));
time = Param.parameter_value{(strcmp('psth_t_vector',Param.parameter_name))};
psth_time_bin = Param.parameter_value{(strcmp('psth_time_bin',Param.parameter_name))};
smooth_time = Param.parameter_value{(strcmp('smooth_time_cell_psth_for_clustering',Param.parameter_name))};
smooth_bins=ceil(smooth_time/psth_time_bin);


%% vS1

% fetch Cluster
key.brain_area = 'vS1'
key.hemisphere = 'left'
key.training_type = 'regular'
key.unit_quality = 'ok or good' %'ok or good'
key.cell_type = 'FS'


k = key;
if contains(k.unit_quality,'all')
    k = rmfield(k,'unit_quality');
end

rel_unit=(EPHYS.Unit);
rel_cluster = (ANL.UnitHierarCluster2 * rel_unit.proj('unit_quality->temp','unit_uid')) & k;
key_cluster = fetch(rel_cluster);
UnitCluster  = struct2table(fetch(rel_cluster,'*', 'ORDER BY unit_uid'));
key_cluster = rmfield(key_cluster,{'hemisphere','brain_area','cell_type','unit_quality','training_type','heirar_cluster_time_st','heirar_cluster_time_end'});
% idx_time2plot = (time>= UnitCluster.heirar_cluster_time_st(1)) & (time<=UnitCluster.heirar_cluster_time_end(1));
idx_time2plot = (time>= -3.5 & (time<=2));

time2plot = time(idx_time2plot);
%fetch Unit
Unit = struct2table(fetch((EPHYS.Unit * EPHYS.UnitPosition * EXP.SessionTraining * EXP.SessionID * ANL.IncludeSession- ANL.ExcludeSession) & key_cluster & ANL.IncludeUnit ,'*', 'ORDER BY unit_uid'));
session_uid = unique(Unit.session_uid);

L.labels = {'hit','miss','ignore'};
R.labels = {'hit','miss','ignore'};

%% Hit
% fetch and smooth PSTH
rel= ((ANL.PSTHAdaptiveAverage * EPHYS.Unit) & key_cluster & ANL.IncludeUnit * ANL.IncludeSession- ANL.ExcludeSession) & 'outcome="hit"' ;
L.PSTH{1} = movmean(cell2mat(fetchn(rel  & 'trial_type_name="l"', 'psth_avg', 'ORDER BY unit_uid')) ,[smooth_bins 0], 2, 'omitnan','Endpoints','shrink');
R.PSTH{1} = movmean(cell2mat(fetchn(rel  & 'trial_type_name="r"', 'psth_avg', 'ORDER BY unit_uid')) ,[smooth_bins 0], 2, 'omitnan','Endpoints','shrink');

L.num_trials{1} = (fetchn(rel  & 'trial_type_name="l"', 'num_trials_averaged', 'ORDER BY unit_uid'));
R.num_trials{1} = (fetchn(rel  & 'trial_type_name="r"', 'num_trials_averaged', 'ORDER BY unit_uid'));

peak_LR_hit_units = nanmax([L.PSTH{1},R.PSTH{1}],[],2);

%% Miss
% fetch and smooth PSTH
rel= ((ANL.PSTHAverageLR * EPHYS.Unit) & key_cluster & ANL.IncludeUnit * ANL.IncludeSession- ANL.ExcludeSession) & 'outcome="miss"';
L.PSTH{2} = movmean(cell2mat(fetchn(rel  & 'trial_type_name="l"', 'psth_avg', 'ORDER BY unit_uid')) ,[smooth_bins 0], 2, 'omitnan','Endpoints','shrink');
R.PSTH{2} = movmean(cell2mat(fetchn(rel  & 'trial_type_name="r"', 'psth_avg', 'ORDER BY unit_uid')) ,[smooth_bins 0], 2, 'omitnan','Endpoints','shrink');
L.num_trials{2} = (fetchn(rel  & 'trial_type_name="l"', 'num_trials_averaged', 'ORDER BY unit_uid'));
R.num_trials{2} = (fetchn(rel  & 'trial_type_name="r"', 'num_trials_averaged', 'ORDER BY unit_uid'));


% %% Ignore
% % fetch and smooth PSTH
% rel= ((ANL.PSTHAdaptiveAverage * EPHYS.Unit) & key_cluster) & 'outcome="ignore"';
% L.PSTH{3} = movmean(cell2mat(fetchn(rel  & 'trial_type_name="l"', 'psth_avg', 'ORDER BY unit_uid')) ,[smooth_bins 0], 2, 'omitnan','Endpoints','shrink');
% R.PSTH{3} = movmean(cell2mat(fetchn(rel  & 'trial_type_name="r"', 'psth_avg', 'ORDER BY unit_uid')) ,[smooth_bins 0], 2, 'omitnan','Endpoints','shrink');
% L.num_trials{3} = (fetchn(rel  & 'trial_type_name="l"', 'num_trials_averaged', 'ORDER BY unit_uid'));
% R.num_trials{3} = (fetchn(rel  & 'trial_type_name="r"', 'num_trials_averaged', 'ORDER BY unit_uid'));



% Select cluster to plot
cl_id=UnitCluster.heirar_cluster_id;
cluster_percent=100*histcounts(cl_id,1:1:numel(unique(cl_id))+1)/numel(cl_id);
clusters_2plot = find(cluster_percent>=min_cluster_percent);
[~,cluster_order] = sort (cluster_percent(clusters_2plot),'descend');
cluster_order=cluster_order(1:min([numel(clusters_2plot),columns2plot*2]));

axes('position',[position_x2(1), 0.93, panel_width2, panel_height2]);
percent_of_all = sum(cluster_percent(clusters_2plot));
% text( 0,0 , sprintf('%s %s side   Training: %s    CellQuality: %s  Cell-type: %s    \n \n Includes: %d units,   %.1f %% in these clusters:' ,...
%     key.brain_area, key.hemisphere, key.training_type, key.unit_quality, key.cell_type, size(UnitCluster,1), percent_of_all),'HorizontalAlignment','Left','FontSize', 10);
axis off;
box off;

plot_counter=0;
for ii = cluster_order
    i = clusters_2plot(ii);
    idx2plot = find(cl_id==i);
    
    
    axes('position',[position_x2(1)+horizontal_distance2*(mod(plot_counter,columns2plot)), position_y2(1)+0.02, panel_width2, panel_height2*0.6]);
    title(sprintf('Cluster %d \n %.1f %% cells\n',plot_counter+1, cluster_percent(i) ),'FontSize',8);
    axis off; box off;
    xl=([0 3]);
    xlim(xl);
    yl=[0 1];
    ylim(yl);
    if mod(plot_counter,columns2plot)==0
        text(xl(1)-diff(xl)*1.05, yl(1)+diff(yl)*1.3, 'e', ...
            'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
        text(xl(1)-diff(xl)*1.05, yl(1)-diff(yl)*0.9, 'f', ...
            'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
        text(xl(1)+diff(xl)*0.5, yl(1)+diff(yl)*1.35, 'Delay', ...
            'fontsize', 6, 'fontname', 'helvetica','HorizontalAlignment','Center');
    end
    
    %% Cluster Pure L vs Pure R PSTH
    axes('position',[position_x2(1)+horizontal_distance2*(mod(plot_counter,columns2plot)), position_y2(floor(plot_counter/columns2plot)+1), panel_width2, panel_height2]);
    flag_xlabel=0;
    ylab='Correct'; num=1;
    legend_flag=1;
    [peak_FR] = fn_plotCluster (plot_counter, columns2plot, Param,time2plot, idx2plot, idx_time2plot,  L, R, num, [], flag_xlabel, peak_LR_hit_units,ylab, legend_flag);
    
    axes('position',[position_x2(1)+horizontal_distance2*(mod(plot_counter,columns2plot)), position_y2(floor(plot_counter/columns2plot)+1)-0.1, panel_width2, panel_height2]);
    flag_xlabel=1;
    ylab='Error'; num=2;
    legend_flag=1;
    [~] = fn_plotCluster (plot_counter, columns2plot, Param,time2plot, idx2plot, idx_time2plot,  L, R, num, [], flag_xlabel, peak_LR_hit_units,ylab, legend_flag);
    
    %     axes('position',[position_x(1)+horizontal_distance*(mod(plot_counter,columns2plot)), position_y(floor(plot_counter/columns2plot)+1)-0.2, panel_width, panel_height]);
    %     flag_xlabel=1;
    %     ylab='No lick'; num=3;
    %     legend_flag=1;
    %     [~] = fn_plotCluster (plot_counter, columns2plot, Param,time2plot, idx2plot, idx_time2plot,  L, R, num, peak_FR,flag_xlabel, peak_LR_hit_units,ylab, legend_flag);
    
    plot_counter = plot_counter +1;
    
end






%% ALM
% fetch Cluster
key.brain_area = 'ALM'
key.hemisphere = 'both'
key.training_type = 'regular'
key.unit_quality = 'ok or good' %'ok or good'
key.cell_type = 'FS'


k = key;
if contains(k.unit_quality,'all')
    k = rmfield(k,'unit_quality');
end

rel_unit=(EPHYS.Unit);
rel_cluster = (ANL.UnitHierarCluster2 * rel_unit.proj('unit_quality->temp','unit_uid')) & k;
key_cluster = fetch(rel_cluster);
UnitCluster  = struct2table(fetch(rel_cluster,'*', 'ORDER BY unit_uid'));
key_cluster = rmfield(key_cluster,{'hemisphere','brain_area','cell_type','unit_quality','training_type','heirar_cluster_time_st','heirar_cluster_time_end'});
% idx_time2plot = (time>= UnitCluster.heirar_cluster_time_st(1)) & (time<=UnitCluster.heirar_cluster_time_end(1));
idx_time2plot = (time>= -3.5 & (time<=2));

time2plot = time(idx_time2plot);

%fetch Unit
Unit = struct2table(fetch((EPHYS.Unit * EPHYS.UnitPosition * EXP.SessionTraining * EXP.SessionID) & key_cluster & ANL.IncludeUnit,'*', 'ORDER BY unit_uid'));
session_uid = unique(Unit.session_uid);

L.labels = {'hit','miss','ignore'};
R.labels = {'hit','miss','ignore'};

%% Hit
% fetch and smooth PSTH
rel= ((ANL.PSTHAdaptiveAverage * EPHYS.Unit) & key_cluster & ANL.IncludeUnit) & 'outcome="hit"';
L.PSTH{1} = movmean(cell2mat(fetchn(rel  & 'trial_type_name="l"', 'psth_avg', 'ORDER BY unit_uid')) ,[smooth_bins 0], 2, 'omitnan','Endpoints','shrink');
R.PSTH{1} = movmean(cell2mat(fetchn(rel  & 'trial_type_name="r"', 'psth_avg', 'ORDER BY unit_uid')) ,[smooth_bins 0], 2, 'omitnan','Endpoints','shrink');

L.num_trials{1} = (fetchn(rel  & 'trial_type_name="l"', 'num_trials_averaged', 'ORDER BY unit_uid'));
R.num_trials{1} = (fetchn(rel  & 'trial_type_name="r"', 'num_trials_averaged', 'ORDER BY unit_uid'));

peak_LR_hit_units = nanmax([L.PSTH{1},R.PSTH{1}],[],2);

%% Miss
% fetch and smooth PSTH
rel= ((ANL.PSTHAverageLR * EPHYS.Unit) & key_cluster & ANL.IncludeUnit) & 'outcome="miss"';
L.PSTH{2} = movmean(cell2mat(fetchn(rel  & 'trial_type_name="l"', 'psth_avg', 'ORDER BY unit_uid')) ,[smooth_bins 0], 2, 'omitnan','Endpoints','shrink');
R.PSTH{2} = movmean(cell2mat(fetchn(rel  & 'trial_type_name="r"', 'psth_avg', 'ORDER BY unit_uid')) ,[smooth_bins 0], 2, 'omitnan','Endpoints','shrink');
L.num_trials{2} = (fetchn(rel  & 'trial_type_name="l"', 'num_trials_averaged', 'ORDER BY unit_uid'));
R.num_trials{2} = (fetchn(rel  & 'trial_type_name="r"', 'num_trials_averaged', 'ORDER BY unit_uid'));


% %% Ignore
% % fetch and smooth PSTH
% rel= ((ANL.PSTHAdaptiveAverage * EPHYS.Unit) & key_cluster) & 'outcome="ignore"';
% L.PSTH{3} = movmean(cell2mat(fetchn(rel  & 'trial_type_name="l"', 'psth_avg', 'ORDER BY unit_uid')) ,[smooth_bins 0], 2, 'omitnan','Endpoints','shrink');
% R.PSTH{3} = movmean(cell2mat(fetchn(rel  & 'trial_type_name="r"', 'psth_avg', 'ORDER BY unit_uid')) ,[smooth_bins 0], 2, 'omitnan','Endpoints','shrink');
% L.num_trials{3} = (fetchn(rel  & 'trial_type_name="l"', 'num_trials_averaged', 'ORDER BY unit_uid'));
% R.num_trials{3} = (fetchn(rel  & 'trial_type_name="r"', 'num_trials_averaged', 'ORDER BY unit_uid'));



% Select cluster to plot
cl_id=UnitCluster.heirar_cluster_id;
cluster_percent=100*histcounts(cl_id,1:1:numel(unique(cl_id))+1)/numel(cl_id);
clusters_2plot = find(cluster_percent>=min_cluster_percent);
[~,cluster_order] = sort (cluster_percent(clusters_2plot),'descend');
cluster_order=cluster_order(1:min([numel(clusters_2plot),columns2plot*2]));

% axes('position',[position_x2(1), 0.93, panel_width2, panel_height2]);
% percent_of_all = sum(cluster_percent(clusters_2plot));
% % text( 0,0 , sprintf('%s %s side   Training: %s    CellQuality: %s  Cell-type: %s    \n \n Includes: %d units,   %.1f %% in these clusters:' ,...
% %     key.brain_area, key.hemisphere, key.training_type, key.unit_quality, key.cell_type, size(UnitCluster,1), percent_of_all),'HorizontalAlignment','Left','FontSize', 10);
% axis off;
% box off;

plot_counter=0;
for ii = cluster_order
    i = clusters_2plot(ii);
    idx2plot = find(cl_id==i);
    
    %% Percent cells in different hemispheres, for each cluster (mean/stem across sessions)
    axes('position',[position_x3(1)+horizontal_distance2*(mod(plot_counter,columns2plot)), position_y3(floor(plot_counter/columns2plot)+2)+0.1, panel_width2, panel_height2*0.6]);
    for i_suid = 1:1:numel(session_uid)
        idx_in_session = find(Unit.session_uid == session_uid(i_suid));
        cells_in_Session (i_suid) = numel(idx_in_session);
        cluster_percent_in_session(i_suid) =     100*sum(ismember(idx_in_session,idx2plot))/numel(idx_in_session);
        session_hemis(i_suid) = Unit.hemisphere(idx_in_session(1));
    end
    L_percent = cluster_percent_in_session(contains(session_hemis,'left') & cells_in_Session>=0);
    HemisL.mean=mean(L_percent);
    HemisL.stem=std(L_percent)/sqrt(numel(L_percent));
    
    R_percent = cluster_percent_in_session(contains(session_hemis,'right') & cells_in_Session>=0);
    if (~isempty (L_percent) && ~isempty (R_percent)) %i.e. if there are recordings from both left and right hemispheres
        HemisR.mean=mean(R_percent);
        HemisR.stem=std(R_percent)/sqrt(numel(R_percent));
        pvalue_HemisLR = ranksum(L_percent,R_percent); %Wilcoxon rank sum test (non paired-samples)
        %     [~, pvalue_HemisLR]= ttest2(L_percent,R_percent); %Wilcoxon rank sum test (non paired-samples)
        if pvalue_HemisLR<=0.001
            pvalue_star='***';
        elseif pvalue_HemisLR<=0.01
            pvalue_star='**';
        elseif pvalue_HemisLR <=0.05
            pvalue_star='*';
        else
            pvalue_star='';
        end
        
        hold on;
        bar(1,HemisL.mean,'facecolor',[1 0 1],'edgecolor', [1 0 1], 'BarWidth', 0.7);
        bar(2,HemisR.mean,'facecolor',[0.75 0.75 0],'edgecolor', [0.75 0.75 0], 'BarWidth', 0.7);
        errorbar_myown( [1 2], [HemisL.mean HemisR.mean], [0 0], [HemisL.stem HemisR.stem],  '.k', 0.1 );
        xl=([0 3]);
        yl=([0 max([HemisL.mean+HemisL.stem, HemisR.mean+ HemisR.stem,eps])]);
        xlim(xl);
        ylim(yl);
        text(2,max([(HemisR.mean+ HemisR.stem)*1.2, 1]),pvalue_star,'FontSize',12,'FontWeight','bold','HorizontalAlignment','center');
        set(gca,'xtick',[1,2],'xticklabels',{'L','R'},'ytick',[0 floor(yl(2))],'FontSize',7);
        if mod(plot_counter,columns2plot)==0
            ylabel(sprintf('%% cells in\n   hemisphere'),'FontSize',8);
            text(xl(1)-diff(xl)*1.05, yl(1)+diff(yl)*1.75, 'g', ...
                'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
            text(xl(1)-diff(xl)*1.05, yl(1)-diff(yl)*0.8, 'h', ...
                'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
            text(xl(1)-diff(xl)*1.05, yl(1)-diff(yl)*3.3, 'i', ...
                'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
            text(xl(1)+diff(xl)*0.5, yl(1)-diff(yl)*0.77, 'Delay', ...
                'fontsize', 6, 'fontname', 'helvetica','HorizontalAlignment','Center');
        end
    end
    title(sprintf('Cluster %d \n %.1f %% cells\n',plot_counter+1, cluster_percent(i) ),'FontSize',8);
    
    %% Cluster Pure L vs Pure R PSTH
    axes('position',[position_x3(1)+horizontal_distance2*(mod(plot_counter,columns2plot)), position_y3(floor(plot_counter/columns2plot)+2), panel_width2, panel_height2]);
    flag_xlabel=0;
    ylab='Correct'; num=1;
    legend_flag=1;
    [peak_FR] = fn_plotCluster (plot_counter, columns2plot, Param,time2plot, idx2plot, idx_time2plot,  L, R, num, [], flag_xlabel, peak_LR_hit_units,ylab, legend_flag);
    
    axes('position',[position_x3(1)+horizontal_distance2*(mod(plot_counter,columns2plot)), position_y3(floor(plot_counter/columns2plot)+2)-0.1, panel_width2, panel_height2]);
    flag_xlabel=1;
    ylab='Error'; num=2;
    legend_flag=1;
    [~] = fn_plotCluster (plot_counter, columns2plot, Param,time2plot, idx2plot, idx_time2plot,  L, R, num, [], flag_xlabel, peak_LR_hit_units,ylab, legend_flag);
    
    %     axes('position',[position_x(1)+horizontal_distance*(mod(plot_counter,columns2plot)), position_y(floor(plot_counter/columns2plot)+1)-0.2, panel_width, panel_height]);
    %     flag_xlabel=1;
    %     ylab='No lick'; num=3;
    %     legend_flag=1;
    %     [~] = fn_plotCluster (plot_counter, columns2plot, Param,time2plot, idx2plot, idx_time2plot,  L, R, num, peak_FR,flag_xlabel, peak_LR_hit_units,ylab, legend_flag);
    
    plot_counter = plot_counter +1;
    
end





if isempty(dir(dir_save_figure))
    mkdir (dir_save_figure)
end
figure_name_out=[ dir_save_figure filename];
eval(['print ', figure_name_out, ' -dtiff -cmyk -r300']);
% eval(['print ', figure_name_out, ' -painters -dpdf -cmyk -r200']);
eval(['print ', figure_name_out, ' -dpdf -cmyk -r200']);


end