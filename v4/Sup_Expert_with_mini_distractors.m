function Sup_Expert_with_mini_distractors() % MATLAB R2017a
close all;

dir_root = 'Z:\users\Arseny\Projects\SensoryInput\SiProbeRecording\'
dir_embeded_graphics = 'Z:\users\Arseny\Projects\SensoryInput\SiProbeRecording\Graphic_for_figures\'
dir_save_figure = [dir_root 'Results\figures\v\'];
filename = 'Sup7_Expert_with_mini_distractors';
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
horizontal_distance1=0.15;
vertical_distance1=0.17;

position_x1(1)=0.1;
position_x1(2)=position_x1(1)+horizontal_distance1;
position_x1(3)=position_x1(2)+horizontal_distance1;

position_y1(1)=0.81;
position_y1(2)=position_y1(1)-vertical_distance1;


panel_width2=0.1;
panel_height2=0.09;
horizontal_distance2=0.12;
vertical_distance2=0.17;

position_x2(1)=0.45;
position_x2(2)=position_x2(1)+horizontal_distance2;

position_y2(1)=0.825;
position_y2(2)=position_y2(1)-vertical_distance2;


Param = struct2table(fetch (ANL.Parameters,'*'));


%% Choice mode - all weights
plot_r_flag=1;
flag_normalize_modes=1;
key=[]; k=[];
key.unit_quality = 'ok or good';
key.cell_type = 'Pyr';
key.mode_weights_sign = 'all';
key.brain_area = 'ALM';
% key.hemisphere = 'right';
key.outcome='hit';
key.mode_type_name = 'LateDelay';
mode_names_titles = { 'Choice'};

axes('position',[position_x1(1), position_y1(1), panel_width1, panel_height1]);
% Regular mini
k=key;
k.training_type = 'regular';
k.session_flag_mini = 1;
k.trialtype_flag_left_and_control_right_nopresample = 1;
k.trialtype_flag_mini = 1;
title1 = '';
title2='';
title3=[];
rel_choice_reg_mini =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverageBaseline* EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;
ylabel_flag=1;
xlabel_flag=1;
y_lims = [-0.15,1];
[xl, yl] =figure_plotModes3 (rel_choice_reg_mini,  Param, xlabel_flag, title1, title2, title3, ylabel_flag,  key, mode_names_titles, y_lims, flag_normalize_modes, plot_r_flag);
text(xl(1)-diff(xl)*0.65, yl(1)+diff(yl)*1.3, 'a', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
set(gca,'FontSize',7,'Ytick',[ 0 y_lims(2)]);
text(-1.9,1.7,sprintf('Distractor-naive mice \n mini stimuli'),'HorizontalAlignment','Center','FontSize',8,'Color', legends{1}.colr,'fontweight','bold' )


axes('position',[position_x1(2), position_y1(1), panel_width1, panel_height1]);
%Distractor mini
plot_r_flag=1;
k=[];
k=key;
k.training_type = 'distractor';
k.session_flag_mini = 1;
k.trialtype_flag_left_and_control_right_nopresample = 1;
k.trialtype_flag_mini = 1;
title1 = '';
title2='';
title3=[];
rel_choice_dis_mini =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverageBaseline * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;
xlabel_flag=1;
ylabel_flag=0;
y_lims = [-1,1];
[xl, yl] =figure_plotModes3 (rel_choice_dis_mini,  Param, xlabel_flag, title1, title2, title3, ylabel_flag,  key, mode_names_titles, y_lims, flag_normalize_modes, plot_r_flag);
%}
set(gca,'FontSize',7,'Ytick',[y_lims(1) 0 y_lims(2)]);
text(-1.5,2.2,sprintf('Distractor-trained mice \n mini stimuli'),'HorizontalAlignment','Center','FontSize',8,'Color', legends{2}.colr,'fontweight','bold' )


% axes('position',[position_x2(3), position_y2(1), panel_width2, panel_height2]);
% %Distractor full
% plot_r_flag=1;
% k=[];
% k=key;
% k.training_type = 'distractor';
% k.session_flag_full = 1;
% k.trialtype_flag_left_and_control_right_nopresample = 1;
% k.trialtype_flag_full = 1;
% title1 = '';
% title2='';
% title3=[];
% rel_choice_dis_full =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverageBaseline * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;
% xlabel_flag=1;
% ylabel_flag=0;
% y_lims = [-0.15,1];
% [xl, yl] =figure_plotModes2 (rel_choice_dis_full,  Param, xlabel_flag, title1, title2, title3, ylabel_flag,  key, mode_names_titles, y_lims, flag_normalize_modes, plot_r_flag);
% %}
% set(gca,'FontSize',6,'Ytick',[0 y_lims(2)]);


%% Stim kinetics
flag_normalize_modes=1;

% Regular mini
axes('position',[position_x2(1), position_y2(1), panel_width2, panel_height2]);

% Distractor mini
colr = legends{2}.colr;
compute_stim_kinetics_modes4 (rel_choice_dis_mini,  Param, colr, flag_normalize_modes, key);

colr = legends{1}.colr;
compute_stim_kinetics_modes4 (rel_choice_reg_mini,  Param, colr, flag_normalize_modes, key);

% % Distractor full
% colr = legends{3}.colr;
% compute_stim_kinetics_modes4 (rel_choice_dis_full,  Param, colr, flag_normalize_modes, key);

xl=[-0.25 1.5];
xlim(xl);
yl = [-0.05 0.2];
ylim(yl);
set(gca,'FontSize',7,'Ytick',[0 yl(2)]);
text(xl(1)+diff(xl)*-0.7, yl(1)+diff(yl)*1.2, 'c', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
text ((xl(1)+diff(xl)*0.5), (yl(1) + diff(yl)*-0.4), sprintf('Time relative \n to stimulus onset (s)'),'Fontsize', 7,'HorizontalAlignment','center');
text ((xl(1)-diff(xl)*0.4), (yl(1) + diff(yl)*0.4), sprintf('Impact on\nChoice mode \n     (a.u.)'),'Fontsize', 7,'Rotation',90,'VerticalAlignment','middle','HorizontalAlignment','center');
text ((xl(1)+diff(xl)*0.5), (yl(1) + diff(yl)*1.15), sprintf('Stimulus impact'),'Fontsize', 7,'VerticalAlignment','middle','HorizontalAlignment','center');




%% Choice mode - negative
plot_r_flag=1;
flag_normalize_modes=1;
key=[]; k=[];
key.unit_quality = 'ok or good';
key.cell_type = 'Pyr';
key.mode_weights_sign = 'negative';
key.brain_area = 'ALM';
% key.hemisphere = 'right';
key.outcome='hit';
key.mode_type_name = 'LateDelay';
mode_names_titles = { 'Choice'};

axes('position',[position_x1(1), position_y1(2), panel_width1, panel_height1]);
% Regular mini
k=key;
k.training_type = 'regular';
k.session_flag_mini = 1;
k.trialtype_flag_left_and_control_right_nopresample = 1;
k.trialtype_flag_mini = 1;
title1 = '';
title2='';
title3=[];
rel_choice_reg_mini =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverageBaseline* EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;
ylabel_flag=1;
xlabel_flag=1;
y_lims = [-0.8,1];
[xl, yl] =figure_plotModes3 (rel_choice_reg_mini,  Param, xlabel_flag, title1, title2, title3, ylabel_flag,  key, mode_names_titles, y_lims, flag_normalize_modes, plot_r_flag);
text(xl(1)-diff(xl)*0.65, yl(1)+diff(yl)*1.3, 'b', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
set(gca,'FontSize',7,'Ytick',[y_lims(1) 0 y_lims(2)]);


axes('position',[position_x1(2), position_y1(2), panel_width1, panel_height1]);
%Distractor full
plot_r_flag=1;
k=[];
k=key;
k.training_type = 'distractor';
k.session_flag_mini = 1;
k.trialtype_flag_left_and_control_right_nopresample = 1;
k.trialtype_flag_mini = 1;
title1 = '';
title2='';
title3=[];
rel_choice_dis_mini =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverageBaseline * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;
ylabel_flag=0;
xlabel_flag=1;
y_lims = [-4,1];
[xl, yl] =figure_plotModes3 (rel_choice_dis_mini,  Param, xlabel_flag, title1, title2, title3, ylabel_flag,  key, mode_names_titles, y_lims, flag_normalize_modes, plot_r_flag);
%}
set(gca,'FontSize',7,'Ytick',[y_lims(1):1:y_lims(2)]);


% axes('position',[position_x2(3), position_y2(2), panel_width2, panel_height2]);
% %Distractor full
% plot_r_flag=1;
% k=[];
% k=key;
% k.training_type = 'distractor';
% k.session_flag_full = 1;
% k.trialtype_flag_left_and_control_right_nopresample = 1;
% k.trialtype_flag_full = 1;
% title1 = '';
% title2='';
% title3=[];
% rel_choice_dis_full =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverageBaseline * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;
% xlabel_flag=1;
% ylabel_flag=0;
% y_lims = [-2,1];
% [xl, yl] =figure_plotModes2 (rel_choice_dis_full,  Param, xlabel_flag, title1, title2, title3, ylabel_flag,  key , mode_names_titles, y_lims,flag_normalize_modes, plot_r_flag);
% %}
% set(gca,'FontSize',6,'Ytick',[y_lims(1) 0 y_lims(2)]);




%% Stim kinetics
% Regular mini
axes('position',[position_x2(1), position_y2(2), panel_width2, panel_height2*0.9]);

% % Distractor full
% colr = legends{3}.colr;
% compute_stim_kinetics_modes4 (rel_choice_dis_full,  Param, colr, flag_normalize_modes, key);

% Distractor mini
colr = legends{2}.colr;
compute_stim_kinetics_modes4 (rel_choice_dis_mini,  Param, colr, flag_normalize_modes, key);

colr = legends{1}.colr;
compute_stim_kinetics_modes4 (rel_choice_reg_mini,  Param, colr, flag_normalize_modes, key);

xl=[-0.25 1.5];
xlim(xl);
yl = [-0.05 0.2];
ylim(yl);
set(gca,'FontSize',6,'Ytick',[ 0 yl(2)]);
text(xl(1)+diff(xl)*-0.7, yl(1)+diff(yl)*1.2, 'd', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
text ((xl(1)+diff(xl)*0.5), (yl(1) + diff(yl)*-0.4), sprintf('Time relative \n to stimulus onset (s)'),'Fontsize', 7,'HorizontalAlignment','center');
text ((xl(1)-diff(xl)*0.4), (yl(1) + diff(yl)*0.4), sprintf('Impact on\nChoice mode \n     (a.u.)'),'Fontsize', 7,'Rotation',90,'VerticalAlignment','middle','HorizontalAlignment','center');
text ((xl(1)+diff(xl)*0.5), (yl(1) + diff(yl)*1.15), sprintf('Stimulus impact'),'Fontsize', 7,'VerticalAlignment','middle','HorizontalAlignment','center');

if isempty(dir(dir_save_figure))
    mkdir (dir_save_figure)
end
figure_name_out=[ dir_save_figure filename];
eval(['print ', figure_name_out, ' -dtiff -cmyk -r300']);
eval(['print ', figure_name_out, ' -painters -dpdf -cmyk -r200']);


end




