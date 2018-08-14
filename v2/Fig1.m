function Fig1() % MATLAB R2017a
close all;

dir_root = 'Z:\users\Arseny\Projects\SensoryInput\SiProbeRecording\'
dir_embeded_graphics = 'Z:\users\Arseny\Projects\SensoryInput\SiProbeRecording\Graphic_for_figures\'
dir_save_figure = [dir_root 'Results\figures\v2\'];
filename = 'Fig1_v2';


%Graphics
%---------------------------------
figure;
set(gcf,'DefaultAxesFontName','helvetica');
set(gcf,'PaperUnits','centimeters','PaperPosition',[0.5 7 23 25]);
set(gcf,'PaperOrientation','portrait');
set(gcf,'Units','centimeters','Position',get(gcf,'paperPosition')+[3 -10 0 0]);


panel_width1=0.11;
panel_height1=0.09;
horizontal_distance1=0.16;
vertical_distance1=0.11;

panel_width2=0.055;
panel_height2=0.06;
horizontal_distance2=0.07;
vertical_distance2=0.082;

position_x1(1)=0.06;
position_x1(2)=position_x1(1)+horizontal_distance1;
position_x1(3)=position_x1(2)+horizontal_distance1;
position_x1(4)=position_x1(3)+horizontal_distance1;
position_x1(5)=position_x1(4)+horizontal_distance1;
position_x1(6)=position_x1(5)+horizontal_distance1;
position_x1(7)=position_x1(6)+horizontal_distance1*0.6;

position_y1(1)=0.85;
position_y1(2)=position_y1(1)-vertical_distance1;
position_y1(3)=position_y1(2)-vertical_distance1*1.1;

position_x2(1)=0.07;
position_x2(2)=position_x2(1)+horizontal_distance2;
position_x2(3)=position_x2(2)+horizontal_distance2;
position_x2(4)=position_x2(3)+horizontal_distance2;
position_x2(5)=position_x2(4)+horizontal_distance2;
position_x2(6)=position_x2(5)+horizontal_distance2;
position_x2(7)=position_x2(6)+horizontal_distance2*0.6;

position_y2(1)=0.63;
position_y2(2)=position_y2(1)-vertical_distance2;
position_y2(3)=position_y2(2)-vertical_distance2;
position_y2(4)=position_y2(3)-vertical_distance2*1.55;

Param = struct2table(fetch (ANL.Parameters,'*'));

%% Drift diffusion

axes('position',[position_x1(1) position_y1(1)+0.02  panel_width1 panel_height1*0.8]);
hold on;
xl=[0 1];
yl=[-1 1];
plot([xl(1) xl(2)],[0 0],'-','LineWidth',1,'Color',[0.5 0.5 0.5],'Clipping','off');
plot([xl(1) xl(2)],[-1 -1],'-','LineWidth',1,'Color',[1 0 0],'Clipping','off');
plot([xl(1) xl(2)],[1 1],'-','LineWidth',1,'Color',[0 0 1],'Clipping','off');
time=0:0.02:1;
x1=time*0 +1; x1=time*1; x1=x1+(rand(1,numel(x1))*0.75-0.75/2);
x2=time*0 +1; x2=time*-1; x2=x2+(rand(1,numel(x2))*0.75-0.75/2);
plot(time,x1,'Color',[0 0 1],'LineWidth',0.75);
plot(time,x2,'Color',[1 0 0],'LineWidth',0.75);
xlim(xl);
ylim(yl);
set(gca, 'Xtick', [], 'Ytick',[], 'TickLabelInterpreter', 'None', 'FontSize', 6, 'XTickLabelRotation', 0,'TickDir','out');
text(xl(1)+diff(xl)*0.5, yl(2)*1.3,sprintf('Drift diffusion model'),'FontWeight','bold','FontSize',7,'HorizontalAlignment','center');
text(xl(1)-diff(xl)*0.25, yl(1)+diff(yl)*0.5,'Activity (a.u.)', 'FontSize',7,'HorizontalAlignment','center','Rotation',90);
text(0.7, 0.2 ,sprintf('Right'),'FontSize',6,'HorizontalAlignment','left','Color',[0 0 1]);
text(0.7, -0.2 ,sprintf('Left'),'FontSize',6,'HorizontalAlignment','left','Color',[1 0 0]);
text(xl(1)-diff(xl)*0.3, yl(1)+diff(yl)*1.3, 'a', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
text(xl(1)+diff(xl)*0.5, yl(1)-diff(yl)*0.2,'Time (s)', 'FontSize',7,'HorizontalAlignment','center');
box off;

%% Models - integrator
axes('position',[position_x1(2) position_y1(1)  panel_width1 panel_height1]);
hold on;
xl = [0 353];
yl = [0 333];
fig1_a = imread([dir_embeded_graphics 'hypothesis_integrator.jpg']);
fig1_a=flipdim(fig1_a,1);
imagesc(fig1_a);
set(gca,'Xlim',xl,'Ylim',yl);
text(xl(1)+diff(xl)*0.5, yl(2)*1.15,sprintf('Integrator'),'FontWeight','bold','FontSize',7,'HorizontalAlignment','center');
text(xl(1)-diff(xl)*0.05, yl(1)+diff(yl)*1.2, 'b', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
axis off;
axis tight;

%% Models - attractor
axes('position',[position_x1(3) position_y1(1)  panel_width1 panel_height1]);
hold on;
xl = [0 388];
yl = [0 316];
fig1_a = imread([dir_embeded_graphics 'hypothesis_attractor.jpg']);
fig1_a=flipdim(fig1_a,1);
imagesc(fig1_a);
set(gca,'Xlim',xl,'Ylim',yl);
text(xl(1)+diff(xl)*0.55, yl(2)*1.15,sprintf('Discrete attractor'),'FontWeight','bold','FontSize',7,'HorizontalAlignment','center');
text(xl(1)-diff(xl)*0.05, yl(1)+diff(yl)*1.2, 'c', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
axis off;
axis tight;


%% Histology
axes('position',[position_x1(1)-0.01 position_y1(2)  panel_width1*1.1 panel_height1*1.11]);
xl = [0 243];
yl = [0 205];
fig1_a = imread([dir_embeded_graphics 'histology.jpg']);
% fig1_a=flipdim(fig1_a,1);
imagesc(fig1_a);
set(gca,'Xlim',xl,'Ylim',yl);
text(xl(1)-diff(xl)*0.2, yl(1)-diff(yl)*0.02, 'd', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
axis off;
axis tight;
% axis equal;

%% Mouse brain
axes('position',[position_x1(2)-0.04 position_y1(2)-0.01  panel_width1*1.3 panel_height1*1.3]);
xl = [0 932];
yl = [0 982];
fig1_a = imread([dir_embeded_graphics 'mouse_brain.jpg']);
% fig1_a=flipdim(fig1_a,1);
imagesc(fig1_a);
set(gca,'Xlim',xl,'Ylim',yl);
text(xl(1)+diff(xl)*0.01, yl(1)+diff(yl)*0.02, 'e', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
axis off;
axis tight;
axis equal;

%% Task schematics
axes('position',[position_x1(3)-0.01 position_y1(2)+0.03  panel_width1*0.8 panel_height1]);
xl = [0 278];
yl = [0 184];
fig1_a = imread([dir_embeded_graphics 'Fig1_behavior_schamatic.jpg']);
% fig1_a=flipdim(fig1_a,1);
imagesc(fig1_a);
set(gca,'Xlim',xl,'Ylim',yl);
axis off;
axis tight;
axis equal;

axes('position',[position_x1(3)-0.05 position_y1(2)-0.005  panel_width1*1.5 panel_height1*0.35]);
xl=[-3.5 1];
yl=[0 1];
hold on;
time=-5:0.01:5;
x1=time*0; x1(time>=-2.15 & time<-2.0)=1;
x2=time*0; x2(time>=-3 & time<-2.85)=1;
x3=time*0; x3(time>=0 & time<0.1)=1;
plot(time,x1,'LineWidth',0.75,'Color',[0 0 0]);
plot(time,x2,'LineWidth',0.75,'Color',[0 0 0]);
plot(time,x3,'LineWidth',0.75,'Color',[0 0 0]);
plot([xl(1) xl(2)],[0 0],'LineWidth',1,'Color',[0 0 0]);
x = 0:0.01:pi;
y = repmat(sin(x),4)*0.6+0.5;
plot(linspace(-2.5,-2.1,4*numel(x)),y,'Color',[0.6 0.85 1],'LineWidth',1,'Clipping','off')
plot(linspace(-2.5,-2.1,4*numel(x)),y+2.4,'Color',[0.6 0.85 1],'LineWidth',1,'Clipping','off')
xlim(xl);
ylim(yl);
set(gca, 'Xtick', [-3:1:0], 'Ytick',[], 'TickLabelInterpreter', 'None', 'FontSize', 6, 'XTickLabelRotation', 0,'TickDir','out');
text(-3, yl(1)+diff(yl)*1.4,sprintf('Sample'),'FontWeight','bold','FontSize',7,'HorizontalAlignment','left');
text(-1.5, yl(1)+diff(yl)*1.4,sprintf('Delay'),'FontWeight','bold','FontSize',7,'HorizontalAlignment','left');
text(+0.1, yl(1)+diff(yl)*1.4,sprintf('Response'),'FontWeight','bold','FontSize',7,'HorizontalAlignment','left');
text(xl(1)+diff(xl)*1, yl(1)+diff(yl)*-0.35,sprintf('Time (s)'),'FontSize',7,'HorizontalAlignment','center');
text(xl(1)-diff(xl)*0.01, yl(1)+diff(yl)*3.4, 'f', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
box off
set(gca,'YColor','none');

%% Sound icons
axes('position',[position_x1(3)-0.05 position_y1(2)-0.005  panel_width1*0.15 panel_height1*0.2]);
fig1_a = imread([dir_embeded_graphics 'sound.jpg']);
imagesc(fig1_a);
axis tight;
axis equal;
axis off;
box off;

axes('position',[position_x1(3)-0.02 position_y1(2)-0.005  panel_width1*0.15 panel_height1*0.2]);
fig1_a = imread([dir_embeded_graphics 'sound.jpg']);
imagesc(fig1_a);
axis tight;
axis equal;
axis off;
box off;

axes('position',[position_x1(3)+0.06 position_y1(2)-0.005  panel_width1*0.15 panel_height1*0.2]);
fig1_a = imread([dir_embeded_graphics 'sound.jpg']);
imagesc(fig1_a);
axis tight;
axis equal;
axis off;
box off;


%% Recording locations
axes('position', [position_x2(1)-0.03 position_y2(1) 0.06 0.06]); hold on ;
xl = [0 134];
yl = [0 135];
fig1_a = imread([dir_embeded_graphics 'left_vS1.jpg']);
fig1_a=flipdim(fig1_a,1);
imagesc(fig1_a);
set(gca,'Xlim',xl,'Ylim',yl);
text(xl(1)-diff(xl)/3.2, yl(1)+diff(yl)*1.15, 'g', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
text(xl(1)+diff(xl)*0.5, yl(1)+diff(yl)*1.1,'vS1 left','FontSize',7,'FontWeight','bold','Color',[0.5 0.5 0.5],'HorizontalAlignment','center');
axis off;
axis tight;
axis equal;

axes('position', [position_x2(1)-0.03 position_y2(1)-0.08 0.06 0.06]); hold on ;
xl = [0 121];
yl = [0 115];
fig1_a = imread([dir_embeded_graphics 'left_ALM.jpg']);
fig1_a=flipdim(fig1_a,1);
imagesc(fig1_a);
set(gca,'Xlim',xl,'Ylim',yl);
text(xl(1)-diff(xl)/3.2, yl(1)+diff(yl)*1.15, 'h', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
text(xl(1)+diff(xl)*0.5, yl(1)+diff(yl)*1.1,'ALM left','FontSize',7,'FontWeight','bold','Color',[1 0 1],'HorizontalAlignment','center');
axis off;
axis tight;
axis equal;

axes('position', [position_x2(1)-0.03 position_y2(1)-0.16 0.06 0.06]); hold on ;
xl = [0 152];
yl = [0 116];
fig1_a = imread([dir_embeded_graphics 'right_ALM.jpg']);
fig1_a=flipdim(fig1_a,1);
imagesc(fig1_a);
set(gca,'Xlim',xl,'Ylim',yl);
text(xl(1)-diff(xl)/3.2, yl(1)+diff(yl)*1.15, 'i', ...
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
key.cell_type = 'Pyr';
axes('position',[position_x2(7), position_y2(1), panel_width2*1.1, panel_height2]);
labels_flag=0;
[xl,yl]=figure_plotSpikeCount (Param, rel, labels_flag, key);
text(xl(1)+diff(xl)*0.5, yl(1)+diff(yl)*1.2, 'Selectivity', ...
    'fontsize', 7,'HorizontalAlignment','center','Color',[0.5 1 0],'FontWeight','bold');
text(-0.9, yl(1)+diff(yl)*1.05, 'Delay', ...
    'fontsize', 6,'HorizontalAlignment','center');
text(xl(1)-diff(xl)*0.5, yl(1)+diff(yl)*1.05, 'j', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');

% Left ALM
key.brain_area = 'ALM';
key.hemisphere = 'left';
key.training = 'regular';
key.cell_type = 'Pyr';
axes('position',[position_x2(7), position_y2(2), panel_width2*1.1, panel_height2]);
labels_flag=0;
[xl,yl]=figure_plotSpikeCount (Param, rel, labels_flag, key);

%% Right ALM
key.brain_area = 'ALM';
key.hemisphere = 'right';
key.training = 'regular';
key.cell_type = 'Pyr';
axes('position',[position_x2(7), position_y2(3), panel_width2*1.1, panel_height2]);
labels_flag=1;
[xl,yl]=figure_plotSpikeCount (Param, rel, labels_flag, key);
text(xl(1)+diff(xl)*0.5, yl(1)-diff(yl)*0.5,'Time (s)', 'FontSize',7,'HorizontalAlignment','center');
text(xl(1)-diff(xl)*0.4, yl(1)+diff(yl)*0.5,'Spikes s^{-1}', 'FontSize',7,'HorizontalAlignment','center','Rotation',90);

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
axes('position',[position_x2(1), position_y2(4), panel_width2, panel_height2]);
svm_performance = fn_fetch_svm_performance(key,rel, smooth_flag);
figure_plot_svm(svm_performance,t,legend_flag,key);

rel=ANL.SVMdecoderSensoryMotor * ANL.SessionPosition * EXP.SessionTraining ;
% Sensory only
key.sensory_or_motor='sensory';
smooth_flag=1;
legend_flag=0;
axes('position',[position_x2(2), position_y2(4), panel_width2, panel_height2]);
svm_performance = fn_fetch_svm_performance(key,rel, smooth_flag);
figure_plot_svm(svm_performance,t,legend_flag,key);

% Motor only
key.sensory_or_motor='motor';
smooth_flag=1;
legend_flag=0;
axes('position',[position_x2(3), position_y2(4), panel_width2, panel_height2]);
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
axes('position',[position_x2(4)+0.03, position_y2(4), panel_width2, panel_height2]);
svm_performance_mat = (fetchn(rel & key,'svm_performance_mean_time_mat'));
time_mat=[];
for i=1:1:46%size(svm_performance_mat,1)
    time_mat(i,:,:)=svm_performance_mat{i};
end
time_mat = 100*squeeze(mean(time_mat,1));
figure_plot_svm_time_rotation(t, time_mat, position_x2(4)+0.03, position_y2(4), panel_width2, panel_height2, label_flag, c_lims, last_label, key);
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
axes('position',[position_x2(5)+0.035, position_y2(4), panel_width2, panel_height2]);
svm_performance_mat = (fetchn(rel & key,'svm_performance_mean_time_mat'));
time_mat=[];
for i=1:1:size(svm_performance_mat,1)
    time_mat(i,:,:)=svm_performance_mat{i};
end
time_mat = 100*squeeze(mean(time_mat,1));
figure_plot_svm_time_rotation(t, time_mat, position_x2(5)+0.035, position_y2(4), panel_width2, panel_height2, label_flag, c_lims, last_label, key);
% freezeColors;

key.sensory_or_motor = 'motor';
label_flag=0;
last_label=1;
c_lims=[50 90];
axes('position',[position_x2(6)+0.04, position_y2(4), panel_width2, panel_height2]);
svm_performance_mat = (fetchn(rel & key,'svm_performance_mean_time_mat'));
time_mat=[];
for i=1:1:size(svm_performance_mat,1)
    time_mat(i,:,:)=svm_performance_mat{i};
end
time_mat = 100*squeeze(mean(time_mat,1));
figure_plot_svm_time_rotation(t, time_mat, position_x2(6)+0.04, position_y2(4), panel_width2, panel_height2, label_flag, c_lims, last_label, key);
% freezeColors;

if isempty(dir(dir_save_figure))
    mkdir (dir_save_figure)
end
figure_name_out=[ dir_save_figure filename];
eval(['print ', figure_name_out, ' -dtiff -cmyk -r300']);
eval(['print ', figure_name_out, ' -painters -dpdf -cmyk -r200']);


end




