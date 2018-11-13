function Sup_Left_Right_Hemisphere_Modes() % MATLAB R2017a
close all;

dir_root = 'Z:\users\Arseny\Projects\SensoryInput\SiProbeRecording\'
dir_embeded_graphics = 'Z:\users\Arseny\Projects\SensoryInput\SiProbeRecording\Graphic_for_figures\'
dir_save_figure = [dir_root 'Results\figures\v\'];
filename = 'Sup6_Left_Right_Hemisphere_Modes';
flag_plot_left_right_trials =1 % (0 both), (1 left), (2 right)

legends{1}.colr = [0 0.4 0.5]; % Distractor naive mice -mini
legends{2}.colr = [0.3 0.5 0.3]; % Distractor trained mice - mini
legends{3}.colr = [0 1 0]; % Distractor trained mice - full
legends{1}.title_label='Distractor-naive';
legends{1}.stimuli_label='mini';
legends{2}.title_label='Distractor-trained';
legends{2}.stimuli_label='mini';
legends{3}.title_label='Distractor-trained';
legends{3}.stimuli_label='full';
legends{1}.title_offset=30;
legends{2}.title_offset=30;
legends{3}.title_offset=30;
legends{1}.title_xoffset=-0.1;
legends{2}.title_xoffset=-0.1;
legends{3}.title_xoffset=-0.1;

%Graphics
%---------------------------------
figure1=figure;
set(gcf,'DefaultAxesFontName','helvetica');
set(gcf,'PaperUnits','centimeters','PaperPosition',[0.5 7 21 21]);
set(gcf,'PaperOrientation','portrait');
set(gcf,'Units','centimeters','Position',get(gcf,'paperPosition')+[3 -10 0 0]);

panel_width1=0.1;
panel_height1=0.09;
horizontal_distance1=0.13;
vertical_distance1=0.4;

position_x1(1)=0.12;
position_x1(2)=position_x1(1)+horizontal_distance1;
position_x1(3)=position_x1(2)+horizontal_distance1;
position_x1(4)=position_x1(3)+horizontal_distance1*1.4;
position_x1(5)=position_x1(4)+horizontal_distance1;
position_x1(6)=position_x1(5)+horizontal_distance1;

position_y1(1)=0.8;
position_y1(2)=position_y1(1)-vertical_distance1;
% position_y1(3)=position_y1(2)-vertical_distance1;
% position_y1(4)=position_y1(3)-vertical_distance1;
% position_y1(5)=position_y1(4)-vertical_distance1;


panel_width2=0.1;
panel_height2=0.09;
horizontal_distance2=0.19;
vertical_distance2=0.4;


position_x2(1)=0.17;
position_x2(2)=position_x2(1)+horizontal_distance2;
position_x2(3)=position_x2(2)+horizontal_distance2*1.35;
position_x2(4)=position_x2(3)+horizontal_distance2;

position_y2(1)=0.64;
position_y2(2)=position_y2(1)-vertical_distance2;
% position_y2(3)=position_y2(2)-vertical_distance2;
% position_y2(4)=position_y2(3)-vertical_distance2;

Param = struct2table(fetch (ANL.Parameters,'*'));

unit_counter=0;

%Recording locations in ALM
axes('position', [position_x1(1)-0.09 position_y1(1)-0.08 0.06 0.06]); hold on ;
xl = [0 121];
yl = [0 115];
fig1_a = imread([dir_embeded_graphics 'left_ALM.jpg']);
fig1_a=flipdim(fig1_a,1);
imagesc(fig1_a);
set(gca,'Xlim',xl,'Ylim',yl);
text(xl(1)+diff(xl)*0.5, yl(1)+diff(yl)*1.1,sprintf('ALM left'),'FontSize',7,'FontWeight','bold','Color',[0 0 0],'HorizontalAlignment','center');
axis off;
axis tight;
axis equal;

%Recording locations in ALM
axes('position', [position_x1(1)-0.09 position_y1(2)-0.08 0.06 0.06]); hold on ;
xl = [0 152];
yl = [0 116];
fig1_a = imread([dir_embeded_graphics 'right_ALM.jpg']);
fig1_a=flipdim(fig1_a,1);
imagesc(fig1_a);
set(gca,'Xlim',xl,'Ylim',yl);
text(xl(1)+diff(xl)*0.5, yl(1)+diff(yl)*1.1,sprintf('ALM right'),'FontSize',7,'FontWeight','bold','Color',[0 0 0],'HorizontalAlignment','center');
axis off;
axis tight;
axis equal;



%% Left Hemisphere, Distractor-naive, Mini Stimuli

% Cell 1
key_u.unit_uid=2732; %2587, 2732, 
axes('position',[position_x1(1), position_y1(1), panel_width1, panel_height1]);
xlabel_flag=1; ylabel_flag=1; stim_legend_flag=1; unit_counter=unit_counter+1; cell_title='Right'; cell_label='a';
fn_plot_PSTH_Supp (Param, 'hit', 1, 1, 1, [], key_u, xlabel_flag, ylabel_flag, stim_legend_flag, unit_counter, cell_title, cell_label);
text(-1,77,'Distractor-naive mice, mini stimuli','HorizontalAlignment','Left','FontSize',9,'Color', legends{1}.colr,'fontweight','bold' )

% Cell 2
key_u.unit_uid=3987;
axes('position',[position_x1(2), position_y1(1), panel_width1, panel_height1]);
xlabel_flag=1; ylabel_flag=0; stim_legend_flag=1; unit_counter=unit_counter+1; cell_title='Left'; cell_label='';
fn_plot_PSTH_Supp (Param, 'hit', 1, 1, 1, [], key_u, xlabel_flag, ylabel_flag, stim_legend_flag, unit_counter, cell_title, cell_label);


% Cell 3
key_u.unit_uid=2695;
axes('position',[position_x1(3), position_y1(1), panel_width1, panel_height1]);
xlabel_flag=1; ylabel_flag=0; stim_legend_flag=1; unit_counter=unit_counter+1; cell_title='Left'; cell_label='';
fn_plot_PSTH_Supp (Param, 'hit', 1, 1, 1, [], key_u, xlabel_flag, ylabel_flag, stim_legend_flag, unit_counter, cell_title, cell_label);

% Population
plot_r_flag=1;
flag_normalize_modes=1;
key=[]; k=[];
key.unit_quality = 'ok or good';
key.cell_type = 'Pyr';
key.brain_area = 'ALM';
key.hemisphere = 'left';
key.outcome='hit';
key.mode_type_name = 'LateDelay';
mode_names_titles = { 'Choice'};
key.training_type = 'regular';

% All Weights
axes('position',[position_x2(1), position_y2(1), panel_width2, panel_height2]);
k=key;
k.mode_weights_sign = 'all';
k.session_flag_mini = 1;
k.trialtype_flag_left_and_control_right_nopresample = 1;
k.trialtype_flag_mini = 1;
title1 = '';
title2='';
title3=[];
rel_choice_reg_mini =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverage* EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;
ylabel_flag=1;
xlabel_flag=1;
y_lims = [-0.15,1.05];
[xl, yl] =figure_plotModes3 (rel_choice_reg_mini,  Param, xlabel_flag, title1, title2, title3, ylabel_flag,  k, mode_names_titles, y_lims, flag_normalize_modes, plot_r_flag);
text(xl(1)-diff(xl)*0.6, yl(1)+diff(yl)*1.2, 'b', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
set(gca,'FontSize',7,'Ytick',[ 0 1]);

% Negative weights
axes('position',[position_x2(2), position_y2(1), panel_width2, panel_height2]);
% Regular mini
k=key;
k.mode_weights_sign = 'negative';
k.session_flag_mini = 1;
k.trialtype_flag_left_and_control_right_nopresample = 1;
k.trialtype_flag_mini = 1;
title1 = '';
title2='';
title3=[];
rel_choice_reg_mini =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverage* EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;
ylabel_flag=1;
xlabel_flag=1;
y_lims = [-0.8,1.05];
[xl, yl] =figure_plotModes3 (rel_choice_reg_mini,  Param, xlabel_flag, title1, title2, title3, ylabel_flag,  k, mode_names_titles, y_lims, flag_normalize_modes, plot_r_flag);
set(gca,'FontSize',7,'Ytick',[y_lims(1) 0 1]);





%% Left Hemisphere, Distractor-trained, Full Stimuli

% Cell 1
key_u.unit_uid=3719; %very good 324 % 1327 not good %3719 great
axes('position',[position_x1(4), position_y1(1), panel_width1, panel_height1]);
xlabel_flag=1; ylabel_flag=1; stim_legend_flag=1; unit_counter=unit_counter+1; cell_title='Right'; cell_label='c';
fn_plot_PSTH_Supp (Param, 'hit', 1, 1, [], 1, key_u, xlabel_flag, ylabel_flag, stim_legend_flag, unit_counter, cell_title, cell_label);
text(-1,53,'Distractor-trained mice, full stimuli','HorizontalAlignment','Left','FontSize',9,'Color', legends{3}.colr,'fontweight','bold' )

% Cell 2
key_u.unit_uid=320; %367 %306 %320 good
axes('position',[position_x1(5), position_y1(1), panel_width1, panel_height1]);
xlabel_flag=1; ylabel_flag=0; stim_legend_flag=1; unit_counter=unit_counter+1; cell_title='Right'; cell_label='';
fn_plot_PSTH_Supp (Param, 'hit', 1, 1, [], 1, key_u, xlabel_flag, ylabel_flag, stim_legend_flag, unit_counter, cell_title, cell_label);


% Cell 3
key_u.unit_uid=296; %271 not good because it is not selective in the end
axes('position',[position_x1(6), position_y1(1), panel_width1, panel_height1]);
xlabel_flag=1; ylabel_flag=0; stim_legend_flag=1; unit_counter=unit_counter+1; cell_title='Left'; cell_label='';
fn_plot_PSTH_Supp (Param, 'hit', 1, 1, [], 1, key_u, xlabel_flag, ylabel_flag, stim_legend_flag, unit_counter, cell_title, cell_label);


% Population
plot_r_flag=1;
flag_normalize_modes=1;
key=[]; k=[];
key.unit_quality = 'ok or good';
key.cell_type = 'Pyr';
key.brain_area = 'ALM';
key.hemisphere = 'left';
key.outcome='hit';
key.mode_type_name = 'LateDelay';
mode_names_titles = { 'Choice'};
key.training_type = 'distractor';

% All Weights
axes('position',[position_x2(3), position_y2(1), panel_width2, panel_height2]);
k=key;
k.mode_weights_sign = 'all';
k.session_flag_full = 1;
k.trialtype_flag_left_and_control_right_nopresample = 1;
k.trialtype_flag_full = 1;
title1 = '';
title2='';
title3=[];
rel_choice_reg_mini =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverage* EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;
ylabel_flag=1;
xlabel_flag=1;
y_lims = [-0.15,1.05];
[xl, yl] =figure_plotModes3 (rel_choice_reg_mini,  Param, xlabel_flag, title1, title2, title3, ylabel_flag,  k, mode_names_titles, y_lims, flag_normalize_modes, plot_r_flag);
text(xl(1)-diff(xl)*0.6, yl(1)+diff(yl)*1.2, 'd', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
set(gca,'FontSize',7,'Ytick',[ 0 1]);

% Negative weights
axes('position',[position_x2(4), position_y2(1), panel_width2, panel_height2]);
% Regular mini
k=key;
k.mode_weights_sign = 'negative';
k.session_flag_full = 1;
k.trialtype_flag_left_and_control_right_nopresample = 1;
k.trialtype_flag_full = 1;
title1 = '';
title2='';
title3=[];
rel_choice_reg_mini =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverage* EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;
ylabel_flag=1;
xlabel_flag=1;
y_lims = [-1.3,1.05];
[xl, yl] =figure_plotModes3 (rel_choice_reg_mini,  Param, xlabel_flag, title1, title2, title3, ylabel_flag,  k, mode_names_titles, y_lims, flag_normalize_modes, plot_r_flag);
set(gca,'FontSize',7,'Ytick',[-1 0 1]);




%% Right Hemisphere, Distractor-naive, Mini Stimuli

% Cell 1
key_u.unit_uid=3024; %4749 good, 4712, 4841, 3024 
axes('position',[position_x1(1), position_y1(2), panel_width1, panel_height1]);
xlabel_flag=1; ylabel_flag=1; stim_legend_flag=1; unit_counter=unit_counter+1; cell_title='Right'; cell_label='e';
fn_plot_PSTH_Supp (Param, 'hit', 1, 1, 1, [], key_u, xlabel_flag, ylabel_flag, stim_legend_flag, unit_counter, cell_title, cell_label);
text(-1,37,'Distractor-naive mice, mini stimuli','HorizontalAlignment','Left','FontSize',9,'Color', legends{1}.colr,'fontweight','bold' )

% Cell 2
key_u.unit_uid=2808; % 2808, 3026 good
axes('position',[position_x1(2), position_y1(2), panel_width1, panel_height1]);
xlabel_flag=1; ylabel_flag=0; stim_legend_flag=1; unit_counter=unit_counter+1; cell_title='Right'; cell_label='';
fn_plot_PSTH_Supp (Param, 'hit', 1, 1, 1, [], key_u, xlabel_flag, ylabel_flag, stim_legend_flag, unit_counter, cell_title, cell_label);


% Cell 3
key_u.unit_uid=2817;   %2817, 4715, 4757, 4713, 4714
axes('position',[position_x1(3), position_y1(2), panel_width1, panel_height1]);
xlabel_flag=1; ylabel_flag=0; stim_legend_flag=1; unit_counter=unit_counter+1; cell_title='Left'; cell_label='';
fn_plot_PSTH_Supp (Param, 'hit', 1, 1, 1, [], key_u, xlabel_flag, ylabel_flag, stim_legend_flag, unit_counter, cell_title, cell_label);

% Population
plot_r_flag=1;
flag_normalize_modes=1;
key=[]; k=[];
key.unit_quality = 'ok or good';
key.cell_type = 'Pyr';
key.brain_area = 'ALM';
key.hemisphere = 'right';
key.outcome='hit';
key.mode_type_name = 'LateDelay';
mode_names_titles = { 'Choice'};
key.training_type = 'regular';

% All Weights
axes('position',[position_x2(1), position_y2(2), panel_width2, panel_height2]);
k=key;
k.mode_weights_sign = 'all';
k.session_flag_mini = 1;
k.trialtype_flag_left_and_control_right_nopresample = 1;
k.trialtype_flag_mini = 1;
title1 = '';
title2='';
title3=[];
rel_choice_reg_mini =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverage* EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;
ylabel_flag=1;
xlabel_flag=1;
y_lims = [-0.05,1.05];
[xl, yl] =figure_plotModes3 (rel_choice_reg_mini,  Param, xlabel_flag, title1, title2, title3, ylabel_flag,  k, mode_names_titles, y_lims, flag_normalize_modes, plot_r_flag);
text(xl(1)-diff(xl)*0.6, yl(1)+diff(yl)*1.2, 'f', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
set(gca,'FontSize',7,'Ytick',[ 0 1]);

% Negative weights
axes('position',[position_x2(2), position_y2(2), panel_width2, panel_height2]);
% Regular mini
k=key;
k.mode_weights_sign = 'negative';
k.session_flag_mini = 1;
k.trialtype_flag_left_and_control_right_nopresample = 1;
k.trialtype_flag_mini = 1;
title1 = '';
title2='';
title3=[];
rel_choice_reg_mini =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverage* EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;
ylabel_flag=1;
xlabel_flag=1;
y_lims = [-0.4,1.05];
[xl, yl] =figure_plotModes3 (rel_choice_reg_mini,  Param, xlabel_flag, title1, title2, title3, ylabel_flag,  k, mode_names_titles, y_lims, flag_normalize_modes, plot_r_flag);
set(gca,'FontSize',7,'Ytick',[y_lims(1) 0 1]);





%% Right Hemisphere, Distractor-trained, Full Stimuli

% Cell 1
key_u.unit_uid= 1506; %1506 good, 1437, 1450 
axes('position',[position_x1(4), position_y1(2), panel_width1, panel_height1]);
xlabel_flag=1; ylabel_flag=1; stim_legend_flag=1; unit_counter=unit_counter+1; cell_title='Right'; cell_label='g';
fn_plot_PSTH_Supp (Param, 'hit', 1, 1, [], 1, key_u, xlabel_flag, ylabel_flag, stim_legend_flag, unit_counter, cell_title, cell_label);
text(-1,72,'Distractor-trained mice, full stimuli','HorizontalAlignment','Left','FontSize',9,'Color', legends{3}.colr,'fontweight','bold' )

% Cell 2
key_u.unit_uid=  1510; %good 1510, 1475, 1503, 690 
axes('position',[position_x1(5), position_y1(2), panel_width1, panel_height1]);
xlabel_flag=1; ylabel_flag=0; stim_legend_flag=1; unit_counter=unit_counter+1; cell_title='Left'; cell_label='';
fn_plot_PSTH_Supp (Param, 'hit', 1, 1, [], 1, key_u, xlabel_flag, ylabel_flag, stim_legend_flag, unit_counter, cell_title, cell_label);


% Cell 3
key_u.unit_uid= 1465; %676 good  %good 1465,  1460     %1475 great
axes('position',[position_x1(6), position_y1(2), panel_width1, panel_height1]);
xlabel_flag=1; ylabel_flag=0; stim_legend_flag=1; unit_counter=unit_counter+1; cell_title='Left'; cell_label='';
fn_plot_PSTH_Supp (Param, 'hit', 1, 1, [], 1, key_u, xlabel_flag, ylabel_flag, stim_legend_flag, unit_counter, cell_title, cell_label);


% Population
plot_r_flag=1;
flag_normalize_modes=1;
key=[]; k=[];
key.unit_quality = 'ok or good';
key.cell_type = 'Pyr';
key.brain_area = 'ALM';
key.hemisphere = 'right';
key.outcome='hit';
key.mode_type_name = 'LateDelay';
mode_names_titles = { 'Choice'};
key.training_type = 'distractor';

% All Weights
axes('position',[position_x2(3), position_y2(2), panel_width2, panel_height2]);
k=key;
k.mode_weights_sign = 'all';
k.session_flag_full = 1;
k.trialtype_flag_left_and_control_right_nopresample = 1;
k.trialtype_flag_full = 1;
title1 = '';
title2='';
title3=[];
rel_choice_reg_mini =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverage* EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;
ylabel_flag=1;
xlabel_flag=1;
y_lims = [-0.4,1.05];
[xl, yl] =figure_plotModes3 (rel_choice_reg_mini,  Param, xlabel_flag, title1, title2, title3, ylabel_flag,  k, mode_names_titles, y_lims, flag_normalize_modes, plot_r_flag);
text(xl(1)-diff(xl)*0.6, yl(1)+diff(yl)*1.2, 'h', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
set(gca,'FontSize',7,'Ytick',[ 0 1]);

% Negative weights
axes('position',[position_x2(4), position_y2(2), panel_width2, panel_height2]);
% Regular mini
k=key;
k.mode_weights_sign = 'negative';
k.session_flag_full = 1;
k.trialtype_flag_left_and_control_right_nopresample = 1;
k.trialtype_flag_full = 1;
title1 = '';
title2='';
title3=[];
rel_choice_reg_mini =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverage* EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;
ylabel_flag=1;
xlabel_flag=1;
y_lims = [-3,1.05];
[xl, yl] =figure_plotModes3 (rel_choice_reg_mini,  Param, xlabel_flag, title1, title2, title3, ylabel_flag,  k, mode_names_titles, y_lims, flag_normalize_modes, plot_r_flag);
set(gca,'FontSize',7,'Ytick',[-3:1:1]);

if isempty(dir(dir_save_figure))
    mkdir (dir_save_figure)
end
figure_name_out=[ dir_save_figure filename];
eval(['print ', figure_name_out, ' -dtiff -cmyk -r300']);
eval(['print ', figure_name_out, ' -painters -dpdf -cmyk -r200']);


end




