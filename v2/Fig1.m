function Fig1() % MATLAB R2017a
close all;

dir_root = 'Z:\users\Arseny\Projects\SensoryInput\SiProbeRecording\'
dir_embeded_graphics = 'Z:\users\Arseny\Projects\SensoryInput\SiProbeRecording\Graphic_for_figures\'
dir_save_figure = ['D:\Arseny\S1ALM_figures\v2\'];
% dir_save_figure = [dir_root 'Results\figures\v2\'];
filename = 'Fig1_v2';


%Graphics
%---------------------------------
figure;
set(gcf,'DefaultAxesFontName','helvetica');
set(gcf,'PaperUnits','centimeters','PaperPosition',[0.5 7 21 21]);
set(gcf,'PaperOrientation','portrait');
set(gcf,'Units','centimeters','Position',get(gcf,'paperPosition')+[3 0 0 0]);

panel_width=0.055;
panel_height=0.06;
horizontal_distance=0.07;
vertical_distance=0.082;

position_x(1)=0.07;
position_x(2)=position_x(1)+horizontal_distance;
position_x(3)=position_x(2)+horizontal_distance;
position_x(4)=position_x(3)+horizontal_distance;
position_x(5)=position_x(4)+horizontal_distance;
position_x(6)=position_x(5)+horizontal_distance;
position_x(7)=position_x(6)+horizontal_distance*0.6;

position_y(1)=0.59;
position_y(2)=position_y(1)-vertical_distance;
position_y(3)=position_y(2)-vertical_distance;
position_y(4)=position_y(3)-vertical_distance*1.55;

Param = struct2table(fetch (ANL.Parameters,'*'));

%% Drift diffusion
axes('position', [0.04 0.67 0.12 0.12]); hold on ;
xl = [0 501];
yl = [0 366];
fig1_a = imread([dir_embeded_graphics 'drift_diffusion.jpg']);
fig1_a=flipdim(fig1_a,1);
imagesc(fig1_a);
set(gca,'Xlim',xl,'Ylim',yl);
text(xl(1)-diff(xl)/10, yl(1)+diff(yl)/1.03, 'a', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
axis off;
axis tight;
axis equal;

%% Models
axes('position', [0.16 0.645 0.17 0.17]); hold on ;
xl = [0 997];
yl = [0 402];
fig1_a = imread([dir_embeded_graphics 'models.jpg']);
fig1_a=flipdim(fig1_a,1);
imagesc(fig1_a);
set(gca,'Xlim',xl,'Ylim',yl);
text(xl(1)-diff(xl)/100, yl(1)+diff(yl)/1.03, 'b', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
axis off;
axis tight;
axis equal;

%% Histology
axes('position', [0.33 0.7 0.08 0.1]); hold on ;
xl = [0 464];
yl = [0 365];
fig1_a = imread([dir_embeded_graphics 'histology.jpg']);
fig1_a=flipdim(fig1_a,1);
imagesc(fig1_a);
set(gca,'Xlim',xl,'Ylim',yl);
text(xl(1)-diff(xl)/100, yl(1)+diff(yl)/1.03, 'c', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
axis off;
axis tight;
axis equal;

%% Mouse brain
axes('position', [0.33 0.66 0.08 0.1]); hold on ;
xl = [0 1184];
yl = [0 877];
fig1_a = imread([dir_embeded_graphics 'mouse_brain.jpg']);
fig1_a=flipdim(fig1_a,1);
imagesc(fig1_a);
set(gca,'Xlim',xl,'Ylim',yl);
% text(xl(1)-diff(xl)/100, yl(1)+diff(yl)/1.03, 'a', ...
%     'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
axis off;
axis tight;
axis equal;

%% Task schematics
axes('position', [0.41 0.67 0.13 0.12]); hold on ;
xl = [0 422];
yl = [0 306];
fig1_a = imread([dir_embeded_graphics 'Fig1_behavior_schamatic.jpg']);
fig1_a=flipdim(fig1_a,1);
imagesc(fig1_a);
set(gca,'Xlim',xl,'Ylim',yl);
text(xl(1)+diff(xl)/50, yl(1)+diff(yl)/1.03, 'd', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
axis off;
axis tight;
axis equal;


%% Recording locations
axes('position', [position_x(1)-0.03 0.59 0.06 0.06]); hold on ;
xl = [0 134];
yl = [0 135];
fig1_a = imread([dir_embeded_graphics 'left_vS1.jpg']);
fig1_a=flipdim(fig1_a,1);
imagesc(fig1_a);
set(gca,'Xlim',xl,'Ylim',yl);
text(xl(1)-diff(xl)/3.2, yl(1)+diff(yl)*1.15, 'e', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
text(xl(1)+diff(xl)*0.5, yl(1)+diff(yl)*1.1,'vS1 left','FontSize',7,'FontWeight','bold','Color',[0.5 0.5 0.5],'HorizontalAlignment','center');
axis off;
axis tight;
axis equal;

axes('position', [position_x(1)-0.03 0.51 0.06 0.06]); hold on ;
xl = [0 121];
yl = [0 115];
fig1_a = imread([dir_embeded_graphics 'left_ALM.jpg']);
fig1_a=flipdim(fig1_a,1);
imagesc(fig1_a);
set(gca,'Xlim',xl,'Ylim',yl);
text(xl(1)-diff(xl)/3.2, yl(1)+diff(yl)*1.15, 'f', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
text(xl(1)+diff(xl)*0.5, yl(1)+diff(yl)*1.1,'ALM left','FontSize',7,'FontWeight','bold','Color',[1 0 1],'HorizontalAlignment','center');
axis off;
axis tight;
axis equal;

axes('position', [position_x(1)-0.03 0.43 0.06 0.06]); hold on ;
xl = [0 152];
yl = [0 116];
fig1_a = imread([dir_embeded_graphics 'right_ALM.jpg']);
fig1_a=flipdim(fig1_a,1);
imagesc(fig1_a);
set(gca,'Xlim',xl,'Ylim',yl);
text(xl(1)-diff(xl)/3.2, yl(1)+diff(yl)*1.15, 'g', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
text(xl(1)+diff(xl)*0.5, yl(1)+diff(yl)*1.1,'ALM right','FontSize',7,'FontWeight','bold','Color',[0.75 0.75 0],'HorizontalAlignment','center');
axis off;
axis tight;
axis equal;

%% Raster plots and PSTHs
rel.PSTH_l = (EPHYS.Unit * ANL.PSTHAdaptiveAverage & 'outcome="hit"' & 'trial_type_name="l"');
rel.PSTH_r = (EPHYS.Unit * ANL.PSTHAdaptiveAverage & 'outcome="hit"' & 'trial_type_name="r"');

rel.spikes_l = ANL.TrialSpikesGoAligned * EPHYS.Unit * EXP.BehaviorTrial * EXP.TrialName & 'outcome="hit"' & 'early_lick="no early"' & 'trial_type_name="l"';
rel.spikes_r = ANL.TrialSpikesGoAligned * EPHYS.Unit * EXP.BehaviorTrial * EXP.TrialName & 'outcome="hit"' & 'early_lick="no early"' & 'trial_type_name="r"';


%%vS1
k.unit_uid=3172; x=1; y=1; flag_xlable=0; flag_ylable=0; figure_plot_PSTH(k,x,y,Param, rel, flag_xlable, flag_ylable, 1)
k.unit_uid=2122; x=2; y=1; flag_xlable=0; flag_ylable=0; figure_plot_PSTH(k,x,y,Param, rel, flag_xlable, flag_ylable, 2)
k.unit_uid=2143; x=3; y=1; flag_xlable=0; flag_ylable=0; figure_plot_PSTH(k,x,y,Param, rel, flag_xlable, flag_ylable, 3)
k.unit_uid=2260; x=4; y=1; flag_xlable=0; flag_ylable=0; figure_plot_PSTH(k,x,y,Param, rel, flag_xlable, flag_ylable, 4)

%%Left ALM
k.unit_uid=1811; x=1; y=2; flag_xlable=0; flag_ylable=0; figure_plot_PSTH(k,x,y,Param, rel, flag_xlable, flag_ylable, 5)
k.unit_uid=1915; x=2; y=2; flag_xlable=0; flag_ylable=0; figure_plot_PSTH(k,x,y,Param, rel, flag_xlable, flag_ylable, 6)
k.unit_uid=2015; x=3; y=2; flag_xlable=0; flag_ylable=0; figure_plot_PSTH(k,x,y,Param, rel, flag_xlable, flag_ylable, 7)
k.unit_uid=2402; x=4; y=2; flag_xlable=0; flag_ylable=0; figure_plot_PSTH(k,x,y,Param, rel, flag_xlable, flag_ylable, 8)

%%Right ALM
k.unit_uid=4822; x=1; y=3; flag_xlable=1; flag_ylable=1; figure_plot_PSTH(k,x,y,Param, rel, flag_xlable, flag_ylable, 9)
k.unit_uid=4757; x=2; y=3; flag_xlable=1; flag_ylable=0; figure_plot_PSTH(k,x,y,Param, rel, flag_xlable, flag_ylable, 10)
k.unit_uid=4611; x=3; y=3; flag_xlable=1; flag_ylable=0; figure_plot_PSTH(k,x,y,Param, rel, flag_xlable, flag_ylable, 11)
k.unit_uid=5157; x=4; y=3; flag_xlable=1; flag_ylable=0; figure_plot_PSTH(k,x,y,Param, rel, flag_xlable, flag_ylable, 12)

% k.unit_uid=2817; x=1; y=3; flag_xlable=1; flag_ylable=1; figure_plot_PSTH(k,x,y,Param, rel, flag_xlable, flag_ylable, 9)
% k.unit_uid=4607; x=2; y=3; flag_xlable=1; flag_ylable=0; figure_plot_PSTH(k,x,y,Param, rel, flag_xlable, flag_ylable, 10)
% k.unit_uid=4611; x=3; y=3; flag_xlable=1; flag_ylable=0; figure_plot_PSTH(k,x,y,Param, rel, flag_xlable, flag_ylable, 11)
% k.unit_uid=4666; x=4; y=3; flag_xlable=1; flag_ylable=0; figure_plot_PSTH(k,x,y,Param, rel, flag_xlable, flag_ylable, 12)

key=[];


%% Selectivity

% Left vS1
key.brain_area = 'vS1';
key.hemisphere = 'left';
key.training = 'regular';
axes('position',[position_x(7), position_y(1), panel_width, panel_height]);
labels_flag=0;
[xl,yl]=figure_plotSpikeCount (Param, rel, labels_flag, key);
text(xl(1)+diff(xl)*0.5, yl(1)+diff(yl)*1.1, 'Selectivity', ...
    'fontsize', 7,'HorizontalAlignment','center');
text(xl(1)-diff(xl)*0.55, yl(1)+diff(yl)*1.15, 'h', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');

% Left ALM
key.brain_area = 'ALM';
key.hemisphere = 'left';
key.training = 'regular';
axes('position',[position_x(7), position_y(2), panel_width, panel_height]);
labels_flag=0;
[xl,yl]=figure_plotSpikeCount (Param, rel, labels_flag, key);

%% Right ALM
key.brain_area = 'ALM';
key.hemisphere = 'right';
key.training = 'regular';
axes('position',[position_x(7), position_y(3), panel_width, panel_height]);
labels_flag=1;
[xl,yl]=figure_plotSpikeCount (Param, rel, labels_flag, key);

%% SVM Decoder
key=[]; k=[];

key.flag_include_distractor_trials=1;
% key.training_type ='regular';

rel=ANL.SVMdecoder * ANL.SessionPosition * EXP.SessionTraining ;
% All trials
key.sensory_or_motor=[];
smooth_flag=0;
t = fetch1(rel,'time_vector_svm', 'LIMIT 1');
legend_flag=1;
axes('position',[position_x(1), position_y(4), panel_width, panel_height]);
svm_performance = fn_fetch_svm_performance(key,rel, smooth_flag);
figure_plot_svm(svm_performance,t,legend_flag,key);

rel=ANL.SVMdecoderSensoryMotor * ANL.SessionPosition * EXP.SessionTraining ;
% Sensory only
key.sensory_or_motor='sensory';
smooth_flag=1;
legend_flag=0;
axes('position',[position_x(2), position_y(4), panel_width, panel_height]);
svm_performance = fn_fetch_svm_performance(key,rel, smooth_flag);
figure_plot_svm(svm_performance,t,legend_flag,key);

% Motor only
key.sensory_or_motor='motor';
smooth_flag=1;
legend_flag=0;
axes('position',[position_x(3), position_y(4), panel_width, panel_height]);
svm_performance = fn_fetch_svm_performance(key,rel, smooth_flag);
figure_plot_svm(svm_performance,t,legend_flag,key);

%% SVM Decoder Time
key=[]; k=[];
key.flag_include_distractor_trials=1;
rel=ANL.SVMdecoderTime * ANL.SessionPosition * EXP.SessionTraining ;
t = fetch1(rel,'time_vector_svm', 'LIMIT 1');
% key.training_type ='regular';

key.brain_area = 'ALM';
key.hemisphere = 'left';
key.sensory_or_motor = '';
label_flag=1;
last_label=0;
c_lims=[50 100];
axes('position',[position_x(4)+0.03, position_y(4), panel_width, panel_height]);
svm_performance_mat = (fetchn(rel & key,'svm_performance_mean_time_mat'));
time_mat=[];
for i=1:1:46%size(svm_performance_mat,1)
    time_mat(i,:,:)=svm_performance_mat{i};
end
time_mat = 100*squeeze(mean(time_mat,1));
figure_plot_svm_time_rotation(t, time_mat, position_x(4)+0.03, position_y(4), panel_width, panel_height, label_flag, c_lims, last_label, key);
% freezeColors;


key=[]; k=[];
key.flag_include_distractor_trials=1;
rel=ANL.SVMdecoderSensoryMotorTime * ANL.SessionPosition * EXP.SessionTraining ;
t = fetch1(rel,'time_vector_svm', 'LIMIT 1');
% key.training_type ='regular';

key.brain_area = 'ALM';
key.hemisphere = 'left';
key.sensory_or_motor = 'sensory';
label_flag=0;
last_label=0;
c_lims=[50 75];
axes('position',[position_x(5)+0.035, position_y(4), panel_width, panel_height]);
svm_performance_mat = (fetchn(rel & key,'svm_performance_mean_time_mat'));
time_mat=[];
for i=1:1:size(svm_performance_mat,1)
    time_mat(i,:,:)=svm_performance_mat{i};
end
time_mat = 100*squeeze(mean(time_mat,1));
figure_plot_svm_time_rotation(t, time_mat, position_x(5)+0.035, position_y(4), panel_width, panel_height, label_flag, c_lims, last_label, key);
% freezeColors;

key.sensory_or_motor = 'motor';
label_flag=0;
last_label=1;
c_lims=[50 100];
axes('position',[position_x(6)+0.04, position_y(4), panel_width, panel_height]);
svm_performance_mat = (fetchn(rel & key,'svm_performance_mean_time_mat'));
time_mat=[];
for i=1:1:size(svm_performance_mat,1)
    time_mat(i,:,:)=svm_performance_mat{i};
end
time_mat = 100*squeeze(mean(time_mat,1));
figure_plot_svm_time_rotation(t, time_mat, position_x(6)+0.04, position_y(4), panel_width, panel_height, label_flag, c_lims, last_label, key);
% freezeColors;

if isempty(dir(dir_save_figure))
    mkdir (dir_save_figure)
end
figure_name_out=[ dir_save_figure filename];
eval(['print ', figure_name_out, ' -dtiff -cmyk -r300']);
eval(['print ', figure_name_out, ' -painters -dpdf -cmyk -r200']);


end




