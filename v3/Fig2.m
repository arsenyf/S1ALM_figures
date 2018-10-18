function Fig2() % MATLAB R2017a
close all;
 
dir_root = 'Z:\users\Arseny\Projects\SensoryInput\SiProbeRecording\'
dir_embeded_graphics = 'Z:\users\Arseny\Projects\SensoryInput\SiProbeRecording\Graphic_for_figures\'
dir_save_figure = [dir_root 'Results\figures\v3\'];
filename = 'Fig2';
flag_plot_left_right_trials =1 % (0 both), (1 left), (2 right)

legends{1}.colr = [0 0.4 0.5]; % Distractor naive mice
legends{2}.colr = [0 1 0]; % Distractor trained mice
legends{1}.title_label='Distractor-naive';
legends{1}.stimuli_label='mini';
legends{2}.title_label='Distractor-trained';
legends{2}.stimuli_label='full';
legends{1}.title_offset=25;
legends{2}.title_offset=0;
legends{1}.title_xoffset=-0.1;
legends{2}.title_xoffset=-0.1;
%Graphics
%---------------------------------
figure1=figure;
set(gcf,'DefaultAxesFontName','helvetica');
set(gcf,'PaperUnits','centimeters','PaperPosition',[0.5 7 21 21]);
set(gcf,'PaperOrientation','portrait');
set(gcf,'Units','centimeters','Position',get(gcf,'paperPosition')+[3 -10 0 0]);

panel_width1=0.11;
panel_height1=0.09;
horizontal_distance1=0.16;
vertical_distance1=0.19;

position_x1(1)=0.07;
position_x1(2)=position_x1(1)+horizontal_distance1;
position_x1(3)=position_x1(2)+horizontal_distance1;
position_x1(4)=position_x1(3)+horizontal_distance1;
position_x1(5)=position_x1(4)+horizontal_distance1;
position_x1(6)=position_x1(5)+horizontal_distance1;
position_x1(7)=position_x1(6)+horizontal_distance1*0.6;

position_y1(1)=0.77;
position_y1(2)=position_y1(1)-vertical_distance1;
position_y1(3)=position_y1(2)-vertical_distance1*1.1;


panel_width2=0.075;
panel_height2=0.08;
horizontal_distance2=0.105;
vertical_distance2=0.11;


position_x2(1)=0.47;
position_x2(2)=position_x2(1)+horizontal_distance2;
position_x2(3)=position_x2(2)+horizontal_distance2*1.25;
position_x2(4)=position_x2(3)+horizontal_distance2;
position_x2(5)=position_x2(4)+horizontal_distance2;
position_x2(6)=position_x2(5)+horizontal_distance2;

position_y2(1)=0.8;
position_y2(2)=position_y2(1)-vertical_distance2*0.9;
position_y2(3)=position_y2(2)-vertical_distance2*1.1;
position_y2(4)=position_y2(3)-vertical_distance2;

Param = struct2table(fetch (ANL.Parameters,'*'));


%% Behavior
axes('position',[position_x1(1), position_y1(1), panel_width1, panel_height1]);

%Expert on Full distractors
%--------------------------------------
% b_query= (EXP.SessionID * ANL.SessionBehavPerformance * EXP.SessionTraining * EXP.SessionTask * EXP.SessionComment  & 'task_protocol in (4,6,3,2,5,7,8,9)' & 'training_type="distractor"' & 'session_comment="good behavior"');
b_query= (EXP.SessionID * ANL.SessionBehavPerformance * EXP.SessionTraining * EXP.SessionTask * EXP.SessionComment  & 'task_protocol in (4,6)' & 'training_type="distractor"' & 'session_comment="good behavior"');
clear trial_type_names  b
[trial_type_names, b] = fn_fetch_behav(b_query);
names_right_trials = {'r', 'r_-3.8Full', 'r_-1.6Full', 'r_-0.8Full'};
% names_left_trials = {'l', 'l_-3.8Full','r', 'l_-1.6Full', 'l_-0.8Full'};
names_left_trials = {'l', 'r', 'l_-1.6Full', 'l_-0.8Full'};
x_r = [(-3.8), (-1.6), (-0.8)];
% x_l = [(-3.8),(-2.5), (-1.6), (-0.8)];
x_l = [(-2.5), (-1.6), (-0.8)];
% Choosing which trial-types to display
%--------------------------------------
clear behav_param behav_param_mean behav_param_signif trn_r trn_l y_r y_l
behav_param = b.prcnt_hit_outof_noignore_noearly;
[behav_param_mean, behav_param_signif, trn_r, trn_l, y_r, y_l ] = fn_choose_behav_trials(behav_param,trial_type_names, names_right_trials, names_left_trials);
% Plotting Performance
%-------------------------------------------
plot_signif_offset=+5;
[xl,yl]=figure_plot_behav_panel_control_subst(behav_param,behav_param_mean, behav_param_signif,  x_r, x_l, y_r, y_l, trn_r, trn_l, flag_plot_left_right_trials,plot_signif_offset, names_right_trials, names_left_trials, legends{2} );


% Regular on Mini distractors
%--------------------------------------
b_query2= (EXP.SessionID * ANL.SessionBehavPerformance * EXP.SessionTraining * EXP.SessionTask * EXP.SessionComment  & 'task_protocol in (2,5,7,8,9)' & 'training_type="regular"' & 'session_comment="good behavior"');
clear trial_type_names  b
[trial_type_names, b] = fn_fetch_behav(b_query2);
names_right_trials = {'r', 'r_-3.8Mini', 'r_-1.6Mini', 'r_-0.8Mini'};
% names_left_trials = {'l', 'l_-3.8Mini','l_-2.5Mini', 'l_-1.6Mini', 'l_-0.8Mini'};
names_left_trials = {'l','l_-2.5Mini', 'l_-1.6Mini', 'l_-0.8Mini'};
x_r = [(-3.8), (-1.6), (-0.8)];
% x_l = [(-3.8),(-2.5), (-1.6), (-0.8)];
x_l = [(-2.5), (-1.6), (-0.8)];
%Performance
% Choosing which trial-types to display
%--------------------------------------
clear behav_param behav_param_mean behav_param_signif trn_r trn_l y_r y_l
behav_param = b.prcnt_hit_outof_noignore_noearly;
[behav_param_mean, behav_param_signif, trn_r, trn_l, y_r, y_l ] = fn_choose_behav_trials(behav_param,trial_type_names, names_right_trials, names_left_trials);
% Plotting Performance
%-------------------------------------------
plot_signif_offset=+5;
[xl,yl]=figure_plot_behav_panel_control_subst(behav_param,behav_param_mean, behav_param_signif,  x_r, x_l, y_r, y_l, trn_r, trn_l, flag_plot_left_right_trials,plot_signif_offset,['             '],['          '], legends{1} );
text(xl(1)-diff(xl)/3.2, yl(1)+diff(yl)*1.7, 'a', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
    text(xl(1)+diff(xl)*0.5, yl(1)-diff(yl)*0.35,'Time (s)', 'FontSize',7,'HorizontalAlignment','center');

factor=20;
% Plot waves - mini stimuli
x = 0:0.01:pi;
plot(linspace(-0.3,-0.4,numel(x)),sin(x)*(factor/3)+110,'Color',[0.6 0.85 1],'LineWidth',1,'Clipping','off')
% text(xl(1)+diff(xl)*0.7, yl(1)+diff(yl)*1.7, 'mini', ...
%     'fontsize', 7');

% Plot waves - full stimuli
x = 0:0.01:pi;
y = repmat(sin(x),4);
plot(linspace(-0.4,0,4*numel(x)),y*(factor)+80,'Color',[0.6 0.85 1],'LineWidth',1,'Clipping','off')
plot([-0.4,0],[75 75],'-k','LineWidth',1,'Clipping','off')
text(-0.4, 70, '0.4 s', ...
    'fontsize', 7','HorizontalAlignment','center');
% text(xl(1)+diff(xl)*0.7, yl(1)+diff(yl)*1.7, 'full', ...
%     'fontsize', 7');

%% Hypothesis 1
axes('position',[position_x1(2) position_y1(1)  panel_width1 panel_height1]);
hold on;
sz=[-1 1];
% plot([-3 -3],[sz],'-k','LineWidth',0.75);
plot([-2.15 -2.15],[sz],'-k','LineWidth',0.75);
% plot([0 0],[sz],'--k','LineWidth',0.75);
time=-5:0.1:5;
x1=time*0 +0.03; x1(time>=-2.45 & time<-2.0)=0.85; 
x2=time*0 ; x2(time>=-1.60 & time<-1.2)=0.6; 
x3=time*0 -0.03; x3(time>=-0.80 & time<-0.4)=0.13; 
early_delay_colr=fetch1(ANL.TrialTypeGraphic &  'trial_type_name="l_-1.6Full"','trialtype_rgb');
text(-1.8, 60 ,sprintf('Early\nDelay'),'FontSize',6,'HorizontalAlignment','left','Color',early_delay_colr);
late_delay_colr=fetch1(ANL.TrialTypeGraphic &  'trial_type_name="l_-0.8Full"','trialtype_rgb');
text(-0.95, 25 ,sprintf('Late \nDelay'),'FontSize',6,'HorizontalAlignment','left','Color',late_delay_colr);
plot(time,x1,'Color',[0 0 1],'LineWidth',1.5);
plot(time,x2,'Color',early_delay_colr,'LineWidth',1.5);
plot(time,x3,'Color',late_delay_colr,'LineWidth',1.5);
xl=[-3 0];
yl=[-.06 1];
xlim(xl);
ylim(yl);
set(gca, 'Xtick', [(-2.5), (-1.6), (-0.8),0], 'Ytick',[0 1], 'TickLabelInterpreter', 'None', 'FontSize', 6, 'XTickLabelRotation', 0,'TickDir','out');
text(xl(1)+diff(xl)*0.37, yl(1)+1.6,sprintf('Hypothesis 1:'),'FontWeight','bold','FontSize',7,'HorizontalAlignment','center');
text(xl(1)+diff(xl)*0.5, yl(1)+1.25,sprintf('Stimulus modulation\nin vS1 or ALM         '),'FontSize',7,'HorizontalAlignment','center');
text(xl(1)-diff(xl)*0.25, yl(1)+diff(yl)*0.5,'Stimulus (a.u.)', 'FontSize',7,'HorizontalAlignment','center','Rotation',90);
text(-2.7, 0.4 ,sprintf('Sample'),'FontSize',6,'HorizontalAlignment','left','Color',[0 0 1],'Rotation',90);
early_delay_colr=fetch1(ANL.TrialTypeGraphic &  'trial_type_name="l_-1.6Full"','trialtype_rgb');
text(-1.8, 0.8 ,sprintf('Early\nDelay'),'FontSize',6,'HorizontalAlignment','left','Color',early_delay_colr);
late_delay_colr=fetch1(ANL.TrialTypeGraphic &  'trial_type_name="l_-0.8Full"','trialtype_rgb');
text(-0.95, 0.4 ,sprintf('Late \nDelay'),'FontSize',6,'HorizontalAlignment','left','Color',late_delay_colr);
text(xl(1)-diff(xl)*0.27, yl(1)+diff(yl)*1.7, 'b', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
    text(xl(1)+diff(xl)*0.5, yl(1)-diff(yl)*0.3,'Time (s)', 'FontSize',7,'HorizontalAlignment','center');

%% Hypothesis 2
axes('position',[position_x1(1) position_y1(2)  panel_width1 panel_height1]);
hold on;
sz=[-1 1];
plot([-3 3],[0.5 0.5],'-','LineWidth',0.75,'Color',[0.5 0.5 0.5]);
% plot([-3 -3],[sz],'--k','LineWidth',0.75);
plot([-2.15 -2.15],[sz],'-k','LineWidth',0.75);
% plot([0 0],[sz],'--k','LineWidth',0.75);
time=-5:0.1:5;
x1=time*0 +0.03; x1(time>=-2.45)=[1:1:sum(time>=-2.45)]*0.04;
x2=time*0 ; x2(time>=-1.60)=[1:1:sum(time>=-1.60)]*0.04;
x3=time*0 -0.03; x3(time>=-0.80)=[1:1:sum(time>=-0.8)]*0.04;
early_delay_colr=fetch1(ANL.TrialTypeGraphic &  'trial_type_name="l_-1.6Full"','trialtype_rgb');
text(-1.8, 60 ,sprintf('Early\nDelay'),'FontSize',6,'HorizontalAlignment','left','Color',early_delay_colr);
late_delay_colr=fetch1(ANL.TrialTypeGraphic &  'trial_type_name="l_-0.8Full"','trialtype_rgb');
text(-0.95, 25 ,sprintf('Late \nDelay'),'FontSize',6,'HorizontalAlignment','left','Color',late_delay_colr);
plot(time,x1,'Color',[0 0 1],'LineWidth',1.5);
plot(time,x2,'Color',early_delay_colr,'LineWidth',1.5);
plot(time,x3,'Color',late_delay_colr,'LineWidth',1.5);
xl=[-3 0];
yl=[-.06 1];
xlim(xl);
ylim(yl);
set(gca, 'Xtick', [(-2.5), (-1.6), (-0.8),0], 'Ytick',[0 0.5 1], 'TickLabelInterpreter', 'None', 'FontSize', 6, 'XTickLabelRotation', 0,'TickDir','out');
text(xl(1)+diff(xl)*0.37, yl(1)+1.6,sprintf('Hypothesis 2:'),'FontWeight','bold','FontSize',7,'HorizontalAlignment','center');
text(xl(1)+diff(xl)*0.5, yl(1)+1.25,sprintf('Slow sensorymotor  \ntransformation         '),'FontSize',7,'HorizontalAlignment','center');
text(xl(1)-diff(xl)*0.25, yl(1)+diff(yl)*0.5,'Choice (a.u.)', 'FontSize',7,'HorizontalAlignment','center','Rotation',90);
text(-2.4, 0.2 ,sprintf('Sample'),'FontSize',6,'HorizontalAlignment','left','Color',[0 0 1],'Rotation',40);
early_delay_colr=fetch1(ANL.TrialTypeGraphic &  'trial_type_name="l_-1.6Full"','trialtype_rgb');
text(-1.8, 0.12 ,sprintf('Early Delay'),'FontSize',6,'HorizontalAlignment','left','Color',early_delay_colr,'Rotation',40);
late_delay_colr=fetch1(ANL.TrialTypeGraphic &  'trial_type_name="l_-0.8Full"','trialtype_rgb');
text(-0.95, 0.12 ,sprintf('Late Delay'),'FontSize',6,'HorizontalAlignment','left','Color',late_delay_colr,'Rotation',40);
text(-2.8, 0.6 ,sprintf('Right'),'FontSize',6,'HorizontalAlignment','left','Color',[0 0 1],'Rotation',90);
text(-2.8, 0.15 ,sprintf('Left'),'FontSize',6,'HorizontalAlignment','left','Color',[1 0 0],'Rotation',90);
text(xl(1)-diff(xl)*0.3, yl(1)+diff(yl)*1.6, 'c', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
    text(xl(1)+diff(xl)*0.5, yl(1)-diff(yl)*0.3,'Time (s)', 'FontSize',7,'HorizontalAlignment','center');


%% Hypothesis 3
axes('position',[position_x1(2) position_y1(2)  panel_width1 panel_height1]);
hold on;
sz=[-1 1];
plot([-3 3],[0.5 0.5],'-','LineWidth',0.75,'Color',[0.5 0.5 0.5]);
% plot([-3 -3],[sz],'--k','LineWidth',0.75);
plot([-2.15 -2.15],[sz],'-k','LineWidth',0.75);
% plot([0 0],[sz],'--k','LineWidth',0.75);
time=-5:0.1:5;
x1=time*0 +0.03; x1(time>=-2.45)=[1:1:sum(time>=-2.45)]*0.04;
x2=time*0 ; x2(time>=-1.50 & time<-1.3)=0.07; 
x3=time*0 -0.03; x3(time>=-0.70 & time<-0.5)=0.1; 
x4=time*0 ; x4(time>=-1.60)=[1:1:sum(time>=-1.60)]*0.06; %Early delay graded

early_delay_colr=fetch1(ANL.TrialTypeGraphic &  'trial_type_name="l_-1.6Full"','trialtype_rgb');
text(-1.8, 60 ,sprintf('Early\nDelay'),'FontSize',6,'HorizontalAlignment','left','Color',early_delay_colr);
late_delay_colr=fetch1(ANL.TrialTypeGraphic &  'trial_type_name="l_-0.8Full"','trialtype_rgb');
text(-0.95, 25 ,sprintf('Late \nDelay'),'FontSize',6,'HorizontalAlignment','left','Color',late_delay_colr);
plot(time,x1,'Color',[0 0 1],'LineWidth',1.5);
plot(time,x2,'Color',early_delay_colr,'LineWidth',1.5);
plot(time,x3,'Color',late_delay_colr,'LineWidth',1.5);
% plot(time,x4,'--','Color',early_delay_colr,'LineWidth',0.75);
xl=[-3 0];
yl=[-.06 1];
xlim(xl);
ylim(yl);
set(gca, 'Xtick', [(-2.5), (-1.6), (-0.8),0], 'Ytick',[0 0.5 1], 'TickLabelInterpreter', 'None', 'FontSize', 6, 'XTickLabelRotation', 0,'TickDir','out');
text(xl(1)+diff(xl)*0.37, yl(1)+1.6,sprintf('Hypothesis 3: '),'FontWeight','bold','FontSize',7,'HorizontalAlignment','center');
text(xl(1)+diff(xl)*0.5, yl(1)+1.25,sprintf('   Development of robust\nmotor plan                 '),'FontSize',7,'HorizontalAlignment','center');
text(xl(1)-diff(xl)*0.25, yl(1)+diff(yl)*0.5,'Choice (a.u.)', 'FontSize',7,'HorizontalAlignment','center','Rotation',90);
text(-2.4, 0.2 ,sprintf('Sample'),'FontSize',6,'HorizontalAlignment','left','Color',[0 0 1],'Rotation',40);
early_delay_colr=fetch1(ANL.TrialTypeGraphic &  'trial_type_name="l_-1.6Full"','trialtype_rgb');
text(-1.8, 0.12 ,sprintf('Early Delay'),'FontSize',6,'HorizontalAlignment','left','Color',early_delay_colr,'Rotation',40);
late_delay_colr=fetch1(ANL.TrialTypeGraphic &  'trial_type_name="l_-0.8Full"','trialtype_rgb');
text(-1.00, 0.12 ,sprintf('Late Delay'),'FontSize',6,'HorizontalAlignment','left','Color',late_delay_colr,'Rotation',40);
text(-2.8, 0.6 ,sprintf('Right'),'FontSize',6,'HorizontalAlignment','left','Color',[0 0 1],'Rotation',90);
text(-2.8, 0.15 ,sprintf('Left'),'FontSize',6,'HorizontalAlignment','left','Color',[1 0 0],'Rotation',90);
text(xl(1)-diff(xl)*0.27, yl(1)+diff(yl)*1.6, 'd', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
    text(xl(1)+diff(xl)*0.5, yl(1)-diff(yl)*0.3,'Time (s)', 'FontSize',7,'HorizontalAlignment','center');




%% Recording locations vS1
axes('position', [position_x2(1)-0.11 position_y2(1)+0.015 0.06, 0.06]); hold on ;
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
axes('position', [position_x2(1)-0.11 position_y2(2)-0.05 0.06 0.06]); hold on ;
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
    
    
    

%% Plotting vS1 stimuli
%-------------------------------------------------------------------------------
axes('position',[position_x2(1), position_y2(1), panel_width2, panel_height2]);

% Mini Stimuli
key=[]; k=[];
key.brain_area = 'vS1';
key.hemisphere = 'left';
key.training_type = 'regular';
% key.unit_quality = 'ok or good'  %'ok or good'
key.unit_quality = 'multi';
key.cell_type = 'Pyr';
k = key;
k.session_flag_mini = 1;
k.trialtype_flag_left_and_control_right_nopresample = 1;
k.trialtype_flag_mini = 1;
if contains(key.unit_quality, 'ok or good')
    k= rmfield(k,'unit_quality');
    rel1=(EXP.SessionID *  EPHYS.Unit * EXP.SessionTraining * EPHYS.UnitPosition * EPHYS.UnitCellType * ANL.PSTHAverage * ANL.TrialTypeGraphic  * ANL.SessionGrouping) & ANL.IncludeUnit & k & 'unit_quality!="multi"' & 'outcome="hit"';
    key.unit_quality = 'ok';
elseif contains(key.unit_quality, 'multi')
    k= rmfield(k,'unit_quality');
    rel1=(EXP.SessionID * EPHYS.Unit * EXP.SessionTraining * EPHYS.UnitPosition * EPHYS.UnitCellType * ANL.PSTHAverage * ANL.TrialTypeGraphic  * ANL.SessionGrouping) & ANL.IncludeUnit & k & 'outcome="hit"';
    key.unit_quality = 'multi';
else
    rel1=(EXP.SessionID * EPHYS.Unit * EXP.SessionTraining * EPHYS.UnitPosition * EPHYS.UnitCellType * ANL.PSTHAverage * ANL.TrialTypeGraphic  * ANL.SessionGrouping) & ANL.IncludeUnit & k & 'outcome="hit"';
end

k1=k;
label_flag=1;
plot_r_flag=0;
[xl,yl] = figure_plot_vs1_stimulus(rel1, k1, label_flag, plot_r_flag);
yl=[-10 20];
ylim(yl);
title(sprintf('%s \n mini stimuli \n', legends{1}.title_label),'FontSize',7,'Color',legends{1}.colr);
text(xl(1)-diff(xl)*0.55, yl(1)+diff(yl)*1.2, 'e', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
if label_flag==1
    text(xl(1)-diff(xl)*0.35, yl(1)+diff(yl)*0.5,[' \Delta Firing ' sprintf('rate \n(Spikes s^{-1})')], 'FontSize',7,'HorizontalAlignment','center','Rotation',90);
%     xlabel ('Time (s)','Fontsize', 7);
end
text(-1.8,ceil(yl(2))*1.18,'Delay','FontSize',6);
set(gca,'Ytick',[yl(1) yl(2)]);


axes('position',[position_x2(2), position_y2(1), panel_width2, panel_height2]);
% Full Stimuli
key=[]; k=[];
key.brain_area = 'vS1';
key.hemisphere = 'left';
key.training_type = 'distractor';
% key.unit_quality = 'ok or good'  %'ok or good'
key.unit_quality = 'multi';
key.cell_type = 'Pyr';
k = key;
k.session_flag_full = 1;
k.trialtype_flag_left_stim_full_nopresample = 1;
if contains(key.unit_quality, 'ok or good')
    k= rmfield(k,'unit_quality');
    rel3=(EXP.SessionID *  EPHYS.Unit * EXP.SessionTraining * EPHYS.UnitPosition * EPHYS.UnitCellType * ANL.PSTHAverage * ANL.TrialTypeGraphic  * ANL.SessionGrouping) & ANL.IncludeUnit & k & 'unit_quality!="multi"' & 'outcome="hit"';
    key.unit_quality = 'ok';
elseif contains(key.unit_quality, 'multi')
    k= rmfield(k,'unit_quality');
    rel3=(EXP.SessionID * EPHYS.Unit * EXP.SessionTraining * EPHYS.UnitPosition * EPHYS.UnitCellType * ANL.PSTHAverage * ANL.TrialTypeGraphic  * ANL.SessionGrouping) & ANL.IncludeUnit & k & 'outcome="hit"';
    key.unit_quality = 'multi';
else
    rel3=(EXP.SessionID * EPHYS.Unit * EXP.SessionTraining * EPHYS.UnitPosition * EPHYS.UnitCellType * ANL.PSTHAverage * ANL.TrialTypeGraphic  * ANL.SessionGrouping) & ANL.IncludeUnit & k & 'outcome="hit"';
end

% Plot
k3=k;
label_flag=0;
plot_r_flag=1;
[xl,yl] = figure_plot_vs1_stimulus(rel3, k3, label_flag, plot_r_flag);
title(sprintf('%s \n full stimuli \n', legends{2}.title_label),'FontSize',7,'Color',legends{2}.colr);
text(-1.8,ceil(yl(2))*1.18,'Delay','FontSize',6);



%% vS1 Quantification
axes('position',[position_x2(3), position_y2(1), panel_width2, panel_height2]);
plot_r_flag=0;

% Mini Stimuli
key=[]; k=[];
key.brain_area = 'vS1';
key.hemisphere = 'left';
key.training_type = 'regular';
% key.unit_quality = 'ok or good'  %'ok or good'
key.unit_quality = 'multi';
key.cell_type = 'Pyr';
k = key;
k.session_flag_mini = 1;
k.trialtype_flag_left_stim_mini_nopresample = 1;
if contains(key.unit_quality, 'ok or good')
    k= rmfield(k,'unit_quality');
    relq1=(EXP.SessionID *  EPHYS.Unit * EXP.SessionTraining * EPHYS.UnitPosition * EPHYS.UnitCellType * ANL.PSTHAverage * ANL.TrialTypeGraphic  * ANL.SessionGrouping) & ANL.IncludeUnit & k & 'unit_quality!="multi"' & 'outcome="hit"';
    key.unit_quality = 'ok';
elseif contains(key.unit_quality, 'multi')
    k= rmfield(k,'unit_quality');
    relq1=(EXP.SessionID * EPHYS.Unit * EXP.SessionTraining * EPHYS.UnitPosition * EPHYS.UnitCellType * ANL.PSTHAverage * ANL.TrialTypeGraphic  * ANL.SessionGrouping) & ANL.IncludeUnit & k & 'outcome="hit"';
    key.unit_quality = 'multi';
else
    relq1=(EXP.SessionID * EPHYS.Unit * EXP.SessionTraining * EPHYS.UnitPosition * EPHYS.UnitCellType * ANL.PSTHAverage * ANL.TrialTypeGraphic  * ANL.SessionGrouping) & ANL.IncludeUnit & k & 'outcome="hit"';
end

k1=k;
xl=[-2.9 0.5];

yyaxis left
colr = [0 0.4 0.5];
fn_plot_stimulus_quantification(relq1, k1,colr)
yl=[0,0.7];
ylim(yl);
set(gca,'Ytick',yl, 'YColor',colr,'Fontsize', 6);
text(xl(1)-diff(xl)*0.25, yl(1)+diff(yl)*0.5,[sprintf('Mini stimuli \n') '\Delta spikes'], 'FontSize',7,'HorizontalAlignment','center','Rotation',90,'Color',colr);
text(-1.8,0.7*1.1,'Delay','FontSize',6);

yyaxis right
colr = [0 1 0];
fn_plot_stimulus_quantification(rel3, k3,colr)
yl=[0,7];
ylim(yl);
xlim(xl);
set(gca,'Ytick',yl, 'YColor',colr,'Fontsize', 6,'XTick',[])
% xlabel ('Time (s)','Fontsize', 7);
text(xl(1)+diff(xl)*1.2, yl(1)+diff(yl)*0.5,[sprintf('Full stimuli \n') '\Delta spikes'], 'FontSize',7,'HorizontalAlignment','center','Rotation',90,'Color',colr);
% title(sprintf('Spike count in vS1\n  at stimulation'),'Fontsize', 7);
title(sprintf('Stimulus size\n '),'Fontsize', 7);
text(xl(1)-diff(xl)*0.55, yl(1)+diff(yl)*1.1, 'f', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');



%% Inputs to ALM
plot_r_flag=0;
axes('position',[position_x2(1), position_y2(2), panel_width2, panel_height2]);
flag_normalize_modes=1;
key=[]; k=[];
key.unit_quality = 'ok or good';
key.cell_type = 'Pyr';
key.mode_weights_sign = 'all';
key.brain_area = 'ALM';
% key.hemisphere = 'left';

% Regular mini
mode_names = { 'Stimulus Orthog.'};
mode_names_titles = { 'Stimulus'};
k=key;
condition = 'mini';
k.session_flag_mini = 1;
k.trialtype_flag_left_and_control_right_nopresample = 1;
k.trialtype_flag_mini = 1;
title1 = '';
title2='';
title3=[];
rel_input_mini =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverageBaseline * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;
xlabel_flag=0;
ylabel_flag=1;
y_lims = [-0.25,1];
outcome='hit';
[xl, yl] =figure_plotModes (rel_input_mini,  Param, xlabel_flag, title1, title2, title3, ylabel_flag,  mode_names, mode_names_titles, y_lims, outcome, flag_normalize_modes, plot_r_flag);
text(xl(1)-diff(xl)*0.55, yl(1)+diff(yl)*1.1, 'g', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');

plot_r_flag=1;
axes('position',[position_x2(2), position_y2(2), panel_width2, panel_height2]);
%Distractor full
mode_names = { 'Stimulus Orthog.'};
mode_names_titles = { 'Stimulus'};
k=[];
k=key;
condition = 'mini';
k.session_flag_full = 1;
k.trialtype_flag_left_and_control_right_nopresample = 1;
k.trialtype_flag_full = 1;
title1 = '';
title2='';
title3=[];
rel_input_full =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverageBaseline * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;
xlabel_flag=0;
ylabel_flag=0;
y_lims = [-0.25,1];
outcome='hit';
[xl, yl] =figure_plotModes (rel_input_full,  Param, xlabel_flag, title1, title2, title3, ylabel_flag,  mode_names, mode_names_titles, y_lims,outcome, flag_normalize_modes, plot_r_flag);


%% Stimulus quantification
%-----------------------------------------------------------------------------
plot_r_flag=0;
flag_normalize_modes=1;
axes('position',[position_x2(3), position_y2(2), panel_width2, panel_height2]);
hold on;
% Regular mini
key.training_type = 'regular';
k=[];
k=key;
k.session_flag_mini = 1;
% k.trialtype_flag_left_stim_mini_nopresample = 1;
k.trialtype_flag_left_stim_mini_nopresample_and_control_right=1;
rel_input_mini_q =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverageBaseline * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;
yyaxis left
colr = [0 0.4 0.5];
yl=[0,0.15];
ylim(yl);
% yl=[0,0.05];
signif_display_offset =-0.1;
compute_stim_amp (rel_input_mini_q,  Param, colr, flag_normalize_modes, plot_r_flag, yl, signif_display_offset);
xl=[-2.9 0.5];
xlim(xl);
set(gca,'Xtick',[-2 0], 'Ytick',[yl(1) yl(2)], 'YColor',colr,'Fontsize', 6)
text(xl(1)-diff(xl)*0.3, yl(1)+diff(yl)*0.5, sprintf('Mini stimuli \nnorm. (a.u.)'), 'FontSize',7,'HorizontalAlignment','center','Rotation',90,'Color',colr);


% Distractor full
plot_r_flag=1;
key.training_type = 'distractor';
k=[];
k=key;
k.session_flag_full = 1;
k.trialtype_flag_left_stim_full_nopresample = 1;
rel_input_full_q =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverageBaseline * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime - ANL.ExcludeSession) ) & k ;
yyaxis right
colr = [0 1 0];
yl=[0,1.15];
ylim(yl);
% yl=[0,0.05];
signif_display_offset =+0.05;
compute_stim_amp (rel_input_full_q,  Param, colr, flag_normalize_modes, plot_r_flag, yl, signif_display_offset);
set(gca,'Xtick',[-2 0], 'Ytick',[yl(1) yl(2)], 'YColor',colr,'Fontsize', 6)
text(xl(1)+diff(xl)*1.2, yl(1)+diff(yl)*0.5, sprintf('Full stimuli \nnorm. (a.u.)'), 'FontSize',7,'HorizontalAlignment','center','Rotation',90,'Color',colr);
% title(sprintf('Inputs to ALM during \n vS1 stimulation'),'Fontsize', 7);
text(xl(1)-diff(xl)*0.55, yl(1)+diff(yl)*1.1, 'h', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');




%% Choice mode
plot_r_flag=1;
flag_normalize_modes=1;
axes('position',[position_x2(1), position_y2(3), panel_width2, panel_height2]);
key=[]; k=[];
key.unit_quality = 'ok or good';
key.cell_type = 'Pyr';
key.mode_weights_sign = 'all';
key.brain_area = 'ALM';
% key.hemisphere = 'left';
outcome='hit';

% Regular mini
mode_names = { 'LateDelay'};
mode_names_titles = { 'Choice'};
k=key;
k.session_flag_mini = 1;
k.trialtype_flag_left_and_control_right_nopresample = 1;
k.trialtype_flag_mini = 1;
title1 = '';
title2='';
title3=[];
rel_choice_mini =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverageBaseline* EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;
ylabel_flag=1;
xlabel_flag=1;
y_lims = [-0.25,1];
[xl, yl] =figure_plotModes (rel_choice_mini,  Param, xlabel_flag, title1, title2, title3, ylabel_flag,  mode_names, mode_names_titles, y_lims, outcome, flag_normalize_modes, plot_r_flag);
text(xl(1)-diff(xl)*0.55, yl(1)+diff(yl)*1.1, 'i', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');


axes('position',[position_x2(2), position_y2(3), panel_width2, panel_height2]);
%Distractor full
plot_r_flag=1;
mode_names = { 'LateDelay'};
mode_names_titles = { 'Choice'};
k=[];
k=key;
k.session_flag_full = 1;
k.trialtype_flag_left_and_control_right_nopresample = 1;
k.trialtype_flag_full = 1;
title1 = '';
title2='';
title3=[];
rel_choice_full =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverageBaseline * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;
xlabel_flag=1;
ylabel_flag=0;
y_lims = [-0.25,1];
outcome='hit';
[xl, yl] =figure_plotModes (rel_choice_full,  Param, xlabel_flag, title1, title2, title3, ylabel_flag,  mode_names, mode_names_titles, y_lims,outcome, flag_normalize_modes, plot_r_flag);
%}

%% Stim kinetics
flag_normalize_modes=1;
key=[]; k=[];
key.unit_quality = 'ok or good';
key.cell_type = 'Pyr';
key.mode_weights_sign = 'all';
key.brain_area = 'ALM';
% key.hemisphere = 'left';

% Regular mini
axes('position',[position_x2(3)+0.015, position_y2(3)-0.005, panel_width2, panel_height2*0.9]);
key.training_type = 'regular';
k=key;
k.session_flag_mini = 1;
% % k.trialtype_flag_left_stim_mini_and_control_right = 1;
% k.trialtype_flag_left_stim_mini_nopresample = 1;
k.trialtype_flag_left_stim_mini_nopresample_and_control_right = 1;

rel_stim_kinetics_mini =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverageBaseline * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;
colr1 = legends{1}.colr;
compute_stim_kinetics_modes (rel_stim_kinetics_mini,  Param, colr1, flag_normalize_modes);


% Distractor full
key.training_type = 'distractor';
k=[];
k=key;
k.session_flag_full = 1;
% k.trialtype_flag_left_stim_full = 1;
% key.trialtype_flag_left_stim_full_nopresample=1;
key.trialtype_flag_left_and_control_right_nopresample=1;
rel_stim_kinetics_full =((EXP.Session * EXP.SessionID *ANL.ProjTrialAdaptiveAverageBaseline * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime - ANL.ExcludeSession) ) & k ;
colr2 = legends{2}.colr;
compute_stim_kinetics_modes (rel_stim_kinetics_full,  Param, colr2, flag_normalize_modes);
xl=[-0.25 1.25];
xlim(xl);
yl = [-0.03 0.15];
ylim(yl);
set(gca,'FontSize',6,'Ytick',[0 yl(2)]);
text(xl(1)+diff(xl)*-0.7, yl(1)+diff(yl)*1.35, 'j', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
text ((xl(1)+diff(xl)*0.5), (yl(1) + diff(yl)*-0.35), sprintf('Time (s)'),'Fontsize', 7,'HorizontalAlignment','center');
text ((xl(1)-diff(xl)*0.45), (yl(1) + diff(yl)*0.5), sprintf('Impact on\nChoice mode \n     (a.u.)'),'Fontsize', 7,'Rotation',90,'VerticalAlignment','middle','HorizontalAlignment','center');
text ((xl(1)+diff(xl)*0.5), (yl(1) + diff(yl)*1.1), sprintf('Stimulus impact'),'Fontsize', 7,'VerticalAlignment','middle','HorizontalAlignment','center');

% text(xl(1)-diff(xl)*0.1, yl(1)+diff(yl)*1.5,sprintf('Distractor-naive\nmini stimuli'),'FontSize',7,'Color',legends{1}.colr,'HorizontalAlignment','left'); 
% text(xl(1)-diff(xl)*0.1, yl(1)+diff(yl)*1.2,sprintf('Distractor-trained\nfull stimuli'),'FontSize',7,'Color',legends{2}.colr,'HorizontalAlignment','left'); 
% 
if isempty(dir(dir_save_figure))
   mkdir (dir_save_figure)
end
figure_name_out=[ dir_save_figure filename];
eval(['print ', figure_name_out, ' -dtiff -cmyk -r300']);
eval(['print ', figure_name_out, ' -painters -dpdf -cmyk -r200']);


end




