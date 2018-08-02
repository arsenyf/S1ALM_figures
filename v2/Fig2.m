function Fig2() % MATLAB R2017a
close all;

dir_root = 'Z:\users\Arseny\Projects\SensoryInput\SiProbeRecording\'
dir_embeded_graphics = 'Z:\users\Arseny\Projects\SensoryInput\SiProbeRecording\Graphic_for_figures\'
dir_save_figure = ['D:\Arseny\S1ALM_figures\v2\'];
% dir_save_figure = [dir_root 'Results\figures\v2\'];
filename = 'Fig2_v2';
flag_plot_left_right_trials =1 % (0 both), (1 left), (2 right)

legends{1}.colr = [0 0.4 0.5]; % Distractor naive mice
legends{2}.colr = [0 1 0]; % Distractor trained mice
legends{1}.title_label='Distractor naive';
legends{2}.title_label='Distractor trained';
legends{1}.title_offset=10;
legends{2}.title_offset=0;

%Graphics
%---------------------------------
figure;
set(gcf,'DefaultAxesFontName','helvetica');
set(gcf,'PaperUnits','centimeters','PaperPosition',[0.5 7 21 21]);
set(gcf,'PaperOrientation','portrait');
set(gcf,'Units','centimeters','Position',get(gcf,'paperPosition')+[3 0 0 0]);

panel_width1=0.13;
panel_height1=0.09;
horizontal_distance1=0.17;
vertical_distance1=0.13;

position_x1(1)=0.07;
position_x1(2)=position_x1(1)+horizontal_distance1;
position_x1(3)=position_x1(2)+horizontal_distance1;
position_x1(4)=position_x1(3)+horizontal_distance1;
position_x1(5)=position_x1(4)+horizontal_distance1;
position_x1(6)=position_x1(5)+horizontal_distance1;
position_x1(7)=position_x1(6)+horizontal_distance1*0.6;

position_y1(1)=0.67;
position_y1(2)=position_y1(1)-vertical_distance1;
position_y1(3)=position_y1(2)-vertical_distance1;
position_y1(4)=position_y1(3)-vertical_distance1*1.55;


panel_width2=0.08;
panel_height2=0.08;
horizontal_distance2=0.14;
vertical_distance2=0.11;


position_x2(1)=0.47;
position_x2(2)=position_x2(1)+horizontal_distance2;
position_x2(3)=position_x2(2)+horizontal_distance2*1.2;
position_x2(4)=position_x2(3)+horizontal_distance2;
position_x2(5)=position_x2(4)+horizontal_distance2;
position_x2(6)=position_x2(5)+horizontal_distance2;

position_y2(1)=0.65;
position_y2(2)=position_y2(1)-vertical_distance2;
position_y2(3)=position_y2(2)-vertical_distance2;
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
b_query= (EXP.SessionID * ANL.SessionBehavPerformance * EXP.SessionTraining * EXP.SessionTask * EXP.SessionComment  & 'task_protocol in (2,5,7,8,9)' & 'training_type="regular"' & 'session_comment="good behavior"');
clear trial_type_names  b
[trial_type_names, b] = fn_fetch_behav(b_query);
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
text(xl(1)-diff(xl)/3.2, yl(1)+diff(yl)*1.3, 'a', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');




%% Recording locations vS1
axes('position', [position_x2(1)-0.1 position_y2(1)+0.015 0.06, 0.06]); hold on ;
xl = [0 134];
yl = [0 135];
fig1_a = imread([dir_embeded_graphics 'left_vS1.jpg']);
fig1_a=flipdim(fig1_a,1);
imagesc(fig1_a);
set(gca,'Xlim',xl,'Ylim',yl);
text(xl(1)+diff(xl)*0.8, yl(1)+diff(yl)*1.6, 'b', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
text(xl(1)+diff(xl)*0.5, yl(1)+diff(yl)*1.1,'vS1 left','FontSize',7,'FontWeight','bold','Color',[0 0 0],'HorizontalAlignment','center');
axis off;
axis tight;
axis equal;

axes('position', [position_x2(1)-0.1 position_y2(2) 0.06 0.06]); hold on ;
xl = [0 121];
yl = [0 115];
fig1_a = imread([dir_embeded_graphics 'left_ALM.jpg']);
fig1_a=flipdim(fig1_a,1);
imagesc(fig1_a);
set(gca,'Xlim',xl,'Ylim',yl);
text(xl(1)+diff(xl)*0.8, yl(1)+diff(yl)*1.7, 'd', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
text(xl(1)+diff(xl)*0.5, yl(1)+diff(yl)*1.4,sprintf('ALM \n left\right'),'FontSize',7,'FontWeight','bold','Color',[0 0 0],'HorizontalAlignment','center');
axis off;
axis tight;
axis equal;

%% Hypothesis one
axes('position',[position_x1(2) position_y1(1)  panel_width1 panel_height1]);
text(xl(1)+diff(xl)*0.8, yl(1)+diff(yl)*1.7, 'b', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
hold on;
sz=[-1 1];
plot([-3 -3],[sz],'--k','LineWidth',0.75);
plot([-2.15 -2.15],[sz],'--k','LineWidth',0.75);
plot([0 0],[sz],'--k','LineWidth',0.75);
time=-5:0.1:5;
x1=time*0 -0.1; x1(time>=-2.51 & time<-2.0)=0.95; x1=smooth(x1,3)';
x2=time*0 -0.1; x2(time>=-1.61 & time<-1.2)=0.6; x2=smooth(x2,3)';
x3=time*0 -0.1; x3(time>=-0.81 & time<-0.4)=0.1; x3=smooth(x3,3)';
early_delay_colr=fetch1(ANL.TrialTypeGraphic &  'trial_type_name="l_-1.6Full"','trialtype_rgb');
text(-1.8, 60 ,sprintf('Early\nDelay'),'FontSize',6,'HorizontalAlignment','left','Color',early_delay_colr);
late_delay_colr=fetch1(ANL.TrialTypeGraphic &  'trial_type_name="l_-0.8Full"','trialtype_rgb');
text(-0.95, 25 ,sprintf('Late \nDelay'),'FontSize',6,'HorizontalAlignment','left','Color',late_delay_colr);
plot(time,x1,'Color',[0 0 1],'LineWidth',1.5);
plot(time,x2,'Color',early_delay_colr,'LineWidth',1.5);
plot(time,x3,'Color',late_delay_colr,'LineWidth',1.5);
xl=[-3.5 0.5];
yl=[0 1.3];
xlim(xl);
ylim(yl);
set(gca,'Xtick',[-2,0:2],'Ytick',[0 1],'FontSize',6);
text(xl(1)+diff(xl)*0.5, yl(1)+1.4,sprintf('Hypothesis 1\nStimulus modulation\nin vS1 or ALM'),'FontSize',7,'HorizontalAlignment','center'); 
text(xl(1)+diff(xl)*0.5, yl(1)-diff(yl)*0.25,'Time (s)', 'FontSize',7,'HorizontalAlignment','center');
    text(xl(1)-diff(xl)*0.2, yl(1)+diff(yl)*0.4,'Stimulus (a.u.)', 'FontSize',7,'HorizontalAlignment','center','Rotation',90);
early_delay_colr=fetch1(ANL.TrialTypeGraphic &  'trial_type_name="l_-1.6Full"','trialtype_rgb');
text(-1.8, 0.8 ,sprintf('Early\nDelay'),'FontSize',6,'HorizontalAlignment','left','Color',early_delay_colr);
late_delay_colr=fetch1(ANL.TrialTypeGraphic &  'trial_type_name="l_-0.8Full"','trialtype_rgb');
text(-0.95, 0.4 ,sprintf('Late \nDelay'),'FontSize',6,'HorizontalAlignment','left','Color',late_delay_colr);
text(xl(1)-diff(xl)*0.1, yl(1)+diff(yl)*1.3, 'd', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');



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
    rel=(EXP.SessionID *  EPHYS.Unit * EXP.SessionTraining * EPHYS.UnitPosition * EPHYS.UnitCellType * ANL.PSTHAverage * ANL.TrialTypeGraphic  * ANL.SessionGrouping) & ANL.IncludeUnit & k & 'unit_quality!="multi"' & 'outcome="hit"';
    key.unit_quality = 'ok';
elseif contains(key.unit_quality, 'multi')
    k= rmfield(k,'unit_quality');
    rel=(EXP.SessionID * EPHYS.Unit * EXP.SessionTraining * EPHYS.UnitPosition * EPHYS.UnitCellType * ANL.PSTHAverage * ANL.TrialTypeGraphic  * ANL.SessionGrouping) & ANL.IncludeUnit & k & 'outcome="hit"';
    key.unit_quality = 'multi';
else
    rel=(EXP.SessionID * EPHYS.Unit * EXP.SessionTraining * EPHYS.UnitPosition * EPHYS.UnitCellType * ANL.PSTHAverage * ANL.TrialTypeGraphic  * ANL.SessionGrouping) & ANL.IncludeUnit & k & 'outcome="hit"';
end

rel1=rel;
k1=k;
label_flag=1;
figure_plot_vs1_stimulus(rel1, k1, label_flag)
title(sprintf('%s \n mini stimuli \n', legends{1}.title_label),'FontSize',7,'Color',legends{1}.colr);

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
    rel=(EXP.SessionID *  EPHYS.Unit * EXP.SessionTraining * EPHYS.UnitPosition * EPHYS.UnitCellType * ANL.PSTHAverage * ANL.TrialTypeGraphic  * ANL.SessionGrouping) & ANL.IncludeUnit & k & 'unit_quality!="multi"' & 'outcome="hit"';
    key.unit_quality = 'ok';
elseif contains(key.unit_quality, 'multi')
    k= rmfield(k,'unit_quality');
    rel=(EXP.SessionID * EPHYS.Unit * EXP.SessionTraining * EPHYS.UnitPosition * EPHYS.UnitCellType * ANL.PSTHAverage * ANL.TrialTypeGraphic  * ANL.SessionGrouping) & ANL.IncludeUnit & k & 'outcome="hit"';
    key.unit_quality = 'multi';
else
    rel=(EXP.SessionID * EPHYS.Unit * EXP.SessionTraining * EPHYS.UnitPosition * EPHYS.UnitCellType * ANL.PSTHAverage * ANL.TrialTypeGraphic  * ANL.SessionGrouping) & ANL.IncludeUnit & k & 'outcome="hit"';
end

% Plot
rel3=rel;
k3=k;
label_flag=0;
figure_plot_vs1_stimulus(rel3, k3, label_flag)
title(sprintf('%s \n full stimuli \n', legends{2}.title_label),'FontSize',7,'Color',legends{2}.colr);




%% vS1 Quantification
axes('position',[position_x2(3), position_y2(1), panel_width2, panel_height2]);

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
    rel=(EXP.SessionID *  EPHYS.Unit * EXP.SessionTraining * EPHYS.UnitPosition * EPHYS.UnitCellType * ANL.PSTHAverage * ANL.TrialTypeGraphic  * ANL.SessionGrouping) & ANL.IncludeUnit & k & 'unit_quality!="multi"' & 'outcome="hit"';
    key.unit_quality = 'ok';
elseif contains(key.unit_quality, 'multi')
    k= rmfield(k,'unit_quality');
    rel=(EXP.SessionID * EPHYS.Unit * EXP.SessionTraining * EPHYS.UnitPosition * EPHYS.UnitCellType * ANL.PSTHAverage * ANL.TrialTypeGraphic  * ANL.SessionGrouping) & ANL.IncludeUnit & k & 'outcome="hit"';
    key.unit_quality = 'multi';
else
    rel=(EXP.SessionID * EPHYS.Unit * EXP.SessionTraining * EPHYS.UnitPosition * EPHYS.UnitCellType * ANL.PSTHAverage * ANL.TrialTypeGraphic  * ANL.SessionGrouping) & ANL.IncludeUnit & k & 'outcome="hit"';
end
rel1=rel;
k1=k;
xl=[-3.5 0.5];

yyaxis left
colr = [0 0.4 0.5];
fn_plot_stimulus_quantification(rel1, k1,colr)
yl=[0,0.7];
ylim(yl);
set(gca,'Ytick',yl, 'YColor',colr,'Fontsize', 6);
text(xl(1)-diff(xl)*0.3, yl(1)+diff(yl)*0.5,[sprintf('Mini stimuli \n') '\Delta spikes'], 'FontSize',7,'HorizontalAlignment','center','Rotation',90,'Color',colr);
text(-1.8,0.7*1.1,'Delay','FontSize',6);

yyaxis right
colr = [0 1 0];
fn_plot_stimulus_quantification(rel3, k3,colr)
yl=[0,7];
ylim(yl);
set(gca,'Ytick',yl, 'YColor',colr,'Fontsize', 6)
% xlabel ('Time (s)','Fontsize', 7);
text(xl(1)+diff(xl)*1.2, yl(1)+diff(yl)*0.5,[sprintf('Mini stimuli \n') '\Delta spikes'], 'FontSize',7,'HorizontalAlignment','center','Rotation',90,'Color',colr);
% title(sprintf('Spike count in vS1\n  at stimulation'),'Fontsize', 7);
title(sprintf('Stimulus size\n '),'Fontsize', 7);
xlim(xl);
text(xl(1)-diff(xl)/2, yl(1)+diff(yl)*1.4, 'c', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');



%% Inputs to ALM
axes('position',[position_x2(1), position_y2(2), panel_width2, panel_height2]);

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
rel =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverageNormalized2 * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;
xlabel_flag=0;
ylabel_flag=1;
y_lims = [-0.25,1];
[xl, yl] =figure_plotModes (rel,  Param, xlabel_flag, title1, title2, title3, ylabel_flag,  mode_names, mode_names_titles, y_lims);

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
rel =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverageNormalized2 * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;
xlabel_flag=0;
ylabel_flag=0;
y_lims = [-0.25,1];
[xl, yl] =figure_plotModes (rel,  Param, xlabel_flag, title1, title2, title3, ylabel_flag,  mode_names, mode_names_titles, y_lims);


%% Stimulus quantification
%-----------------------------------------------------------------------------
axes('position',[position_x2(3), position_y2(2), panel_width2, panel_height2]);
hold on;

% Regular mini
key.training_type = 'regular';
k=[];
k=key;
k.session_flag_mini = 1;
k.trialtype_flag_left_stim_mini_nopresample = 1;
rel =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverageNormalized * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;
yyaxis left
colr = [0 0.4 0.5];
compute_stim_amp (rel,  Param, colr);
yl=[0,0.05];
ylim(yl);
xl=[-3.5 0.5];
xlim(xl);
set(gca,'Ytick',yl, 'YColor',colr,'Fontsize', 6)
text(xl(1)-diff(xl)*0.3, yl(1)+diff(yl)*0.5, sprintf('Mini stimuli \n(a.u.)'), 'FontSize',7,'HorizontalAlignment','center','Rotation',90,'Color',colr);


% Distractor full
key.training_type = 'distractor';
k=[];
k=key;
k.session_flag_full = 1;
k.trialtype_flag_left_stim_full_nopresample = 1;
rel =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverageNormalized * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime - ANL.ExcludeSession) ) & k ;
yyaxis right
colr = [0 1 0];
compute_stim_amp (rel,  Param, colr);
yl=[0,0.4];
ylim(yl);
set(gca,'Ytick',yl, 'YColor',colr,'Fontsize', 6)
text(xl(1)+diff(xl)*1.2, yl(1)+diff(yl)*0.5, sprintf('Full stimuli \n(a.u.)'), 'FontSize',7,'HorizontalAlignment','center','Rotation',90,'Color',colr);
% title(sprintf('Inputs to ALM during \n vS1 stimulation'),'Fontsize', 7);
text(xl(1)-diff(xl)*0.5, yl(1)+diff(yl)*1.2, 'e', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');


%}

%% Choice mode
axes('position',[position_x2(1), position_y2(3), panel_width2, panel_height2]);

key=[]; k=[];
key.unit_quality = 'ok or good';
key.cell_type = 'Pyr';
key.mode_weights_sign = 'all';
key.brain_area = 'ALM';
% key.hemisphere = 'left';

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
rel =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverageNormalized * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;
ylabel_flag=1;
xlabel_flag=0;
y_lims = [-0.25,1];
[xl, yl] =figure_plotModes (rel,  Param, xlabel_flag, title1, title2, title3, ylabel_flag,  mode_names, mode_names_titles, y_lims);
text(xl(1)-diff(xl)/3, yl(1)+diff(yl)*1.2, 'g', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');

axes('position',[position_x2(2), position_y2(3), panel_width2, panel_height2]);

%Distractor full
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
rel =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverageNormalized * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;
xlabel_flag=0;
ylabel_flag=1;
y_lims = [-0.25,1];
[xl, yl] =figure_plotModes (rel,  Param, xlabel_flag, title1, title2, title3, ylabel_flag,  mode_names, mode_names_titles, y_lims);

%% Ramping mode
axes('position',[position_x2(1), position_y2(4), panel_width2, panel_height2]);

key=[]; k=[];
key.unit_quality = 'ok or good';
key.cell_type = 'Pyr';
key.mode_weights_sign = 'all';
key.brain_area = 'ALM';
% key.hemisphere = 'left';

% Regular mini
mode_names = { 'Ramping Orthog.'};
mode_names_titles = { 'Ramping'};
k=key;
k.session_flag_mini = 1;
k.trialtype_flag_left_and_control_right_nopresample = 1;
k.trialtype_flag_mini = 1;
title1 = '';
title2='';
title3=[];
rel =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverageNormalized2 * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;
ylabel_flag=1;
xlabel_flag=1;
y_lims = [-0.25,1];
[xl, yl] =figure_plotModes (rel,  Param, xlabel_flag, title1, title2, title3, ylabel_flag,  mode_names, mode_names_titles, y_lims);
text(xl(1)-diff(xl)/3, yl(1)+diff(yl)*1.2, 'h', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');

axes('position',[position_x2(2), position_y2(4), panel_width2, panel_height2]);

%Distractor full
mode_names = { 'Ramping Orthog.'};
mode_names_titles = { 'Ramping'};
k=[];
k=key;
k.session_flag_full = 1;
k.trialtype_flag_left_and_control_right_nopresample = 1;
k.trialtype_flag_full = 1;
title1 = '';
title2='';
title3=[];
rel =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverageNormalized2 * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;
xlabel_flag=1;
ylabel_flag=1;
y_lims = [-0.25,1];
[xl, yl] =figure_plotModes (rel,  Param, xlabel_flag, title1, title2, title3, ylabel_flag,  mode_names, mode_names_titles, y_lims);


%}

%% 2D projections 
flag_normalize_modes =1; % 1 to normalize projections between 0 and 1, 0 to plot absolute values
Param = struct2table(fetch (ANL.Parameters,'*'));
smooth_time = Param.parameter_value{(strcmp('smooth_time_proj2D',Param.parameter_name))};

mode_names = {'Left vs. baseline', 'Right vs. baseline'};
mode_names_titles = {'Left', 'Right'};

axes('position',[position_x1(1), position_y1(2), panel_width1, panel_height1]);
% Regular mini 
key=[]; k=[];
key.trialtype_flag_left_and_control_right_nopresample=1;
key.brain_area = 'ALM';
% key.hemisphere = 'left'
key.training_type = 'regular';
key.unit_quality = 'ok or good';
key.cell_type = 'Pyr';
key.mode_weights_sign = 'all';
key.session_flag_mini = 1;
key.trialtype_flag_mini = 1;
k = key;
xlabel_flag=0;
ylabel_flag=1;
rel =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverageNormalized2	 * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime - ANL.ExcludeSession) & k & 'unit_quality!="multi"' );  
figures_plotModes_2D (rel,  Param, mode_names, mode_names_titles, xlabel_flag, ylabel_flag, flag_normalize_modes);
 
axes('position',[position_x1(1), position_y1(3), panel_width1, panel_height1]);
% Distractor full 
key=[]; k=[];
key.trialtype_flag_left_and_control_right_nopresample=1;
key.brain_area = 'ALM';
% key.hemisphere = 'left'
key.training_type = 'distractor';
key.unit_quality = 'ok or good';
key.cell_type = 'Pyr';
key.mode_weights_sign = 'all';
key.session_flag_full = 1;
key.trialtype_flag_full = 1;
k = key;
xlabel_flag=1;
ylabel_flag=1;
rel =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverageNormalized2 * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime - ANL.ExcludeSession) & k & 'unit_quality!="multi"' );  
figures_plotModes_2D (rel,  Param, mode_names, mode_names_titles, xlabel_flag, ylabel_flag, flag_normalize_modes);





if isempty(dir(dir_save_figure))
   mkdir (dir_save_figure)
end
figure_name_out=[ dir_save_figure filename];
eval(['print ', figure_name_out, ' -dtiff -cmyk -r300']);
eval(['print ', figure_name_out, ' -painters -dpdf -cmyk -r200']);


end




