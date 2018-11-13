function Sup_Stimulus_Mode() % MATLAB R2018ba
close all;

dir_root = 'Z:\users\Arseny\Projects\SensoryInput\SiProbeRecording\'
dir_embeded_graphics = 'Z:\users\Arseny\Projects\SensoryInput\SiProbeRecording\Graphic_for_figures\'
dir_save_figure = [dir_root 'Results\figures\v\'];
filename = 'Sup5_Stimulus_Mode';

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
position_x1(4)=position_x1(3)+horizontal_distance1*0.7;
position_x1(5)=position_x1(4)+horizontal_distance1;
position_x1(6)=position_x1(5)+horizontal_distance1;

position_y1(1)=0.8;
position_y1(2)=position_y1(1)-vertical_distance1;
% position_y1(3)=position_y1(2)-vertical_distance1;
% position_y1(4)=position_y1(3)-vertical_distance1;
% position_y1(5)=position_y1(4)-vertical_distance1;


panel_width2=0.1;
panel_height2=0.09;
horizontal_distance2=0.16;
vertical_distance2=0.4;


position_x2(1)=0.12;
position_x2(2)=position_x2(1)+horizontal_distance2;
position_x2(3)=position_x2(2)+horizontal_distance2*1.2;
position_x2(4)=position_x2(3)+horizontal_distance2;

position_y2(1)=0.63;
position_y2(2)=position_y2(1)-vertical_distance2;
% position_y2(3)=position_y2(2)-vertical_distance2;
% position_y2(4)=position_y2(3)-vertical_distance2;

Param = struct2table(fetch (ANL.Parameters,'*'));

unit_counter=0;

%Recording locations in ALM
axes('position', [position_x1(1)-0.11 position_y1(1) 0.06 0.06]); hold on ;
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
axes('position', [position_x1(1)-0.11 position_y1(2) 0.06 0.06]); hold on ;
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
key_u.unit_uid=1811;
axes('position',[position_x1(1), position_y1(1), panel_width1, panel_height1]);
xlabel_flag=1; ylabel_flag=1; stim_legend_flag=1; unit_counter=unit_counter+1; cell_title=''; cell_label='a';
fn_plot_PSTH_Supp2 (Param, 'hit', 1, 1, 1, [], key_u, xlabel_flag, ylabel_flag, stim_legend_flag, unit_counter, cell_title, cell_label);
text(-3,38,'Distractor-naive mice, mini stimuli','HorizontalAlignment','Left','FontSize',9,'Color', legends{1}.colr,'fontweight','bold' )

% Cell 2
key_u.unit_uid=3988;%2007; 3988, very good 4266
axes('position',[position_x1(2), position_y1(1), panel_width1, panel_height1]);
xlabel_flag=1; ylabel_flag=0; stim_legend_flag=1; unit_counter=unit_counter+1; cell_title=''; cell_label='';
fn_plot_PSTH_Supp2 (Param, 'hit', 1, 1, 1, [], key_u, xlabel_flag, ylabel_flag, stim_legend_flag, unit_counter, cell_title, cell_label);


% % Cell 3
% key_u.unit_uid=1765; %2372 2764 good, 4041, 4159 interesting, 4253 good
% axes('position',[position_x1(3), position_y1(1), panel_width1, panel_height1]);
% xlabel_flag=1; ylabel_flag=0; stim_legend_flag=1; unit_counter=unit_counter+1; cell_title=''; cell_label='';
% fn_plot_PSTH_Supp2 (Param, 'hit', 1, 1, 1, [], key_u, xlabel_flag, ylabel_flag, stim_legend_flag, unit_counter, cell_title, cell_label);

% Population
plot_r_flag=1;
flag_normalize_modes=1;
key=[]; k=[];
key.unit_quality = 'ok or good';
key.cell_type = 'Pyr';
key.brain_area = 'ALM';
key.hemisphere = 'left';
key.outcome='hit';
key.mode_type_name = 'Stimulus Orthog.1';
mode_names_titles = { 'Stimulus'};
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
rel =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverageBaseline* EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;

ylabel_flag=1;
xlabel_flag=1;
y_lims = [-0.15,1.05];
[xl, yl] =figure_plotModes3 (rel,  Param, xlabel_flag, title1, title2, title3, ylabel_flag,  k, mode_names_titles, y_lims, flag_normalize_modes, plot_r_flag);
text(xl(1)-diff(xl)*0.5, yl(1)+diff(yl)*1.2, 'b', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
set(gca,'FontSize',7,'Ytick',[ 0 1]);


% Stimulus quantification
%-----------------------------------------------------------------------------
plot_r_flag=0;
flag_normalize_modes=1;
axes('position',[position_x2(2), position_y2(1), panel_width2*0.75, panel_height2]);
hold on;
colr = legends{1}.colr;
yl=[0,0.5];
ylim(yl);
signif_display_offset =-0.15;
compute_stim_amp_mini (rel,  Param, colr, flag_normalize_modes, plot_r_flag, yl, signif_display_offset, k);
xl=[-2.9 0.1];
xlim(xl);
set(gca,'Xtick',[-2 0], 'Ytick',[yl(1) yl(2)], 'Fontsize', 6)
text(xl(1)-diff(xl)*0.3, yl(1)+diff(yl)*0.5, sprintf('Mini stimuli \nnorm. (a.u.)'), 'FontSize',7,'HorizontalAlignment','center','Rotation',90,'Color',colr);
xl=[-2.9 0.1];
text ((xl(1)+diff(xl)*0.5), (yl(1) + diff(yl)*-0.25), sprintf('Time (s)'),'Fontsize', 7,'HorizontalAlignment','center');
title(sprintf('Stimulus size'),'Fontsize', 7);


%% Left Hemisphere, Distractor-trained, Full Stimuli
% Cell 1
key_u.unit_uid=314; %228 ok %284 not good % 287 great negative %314 very good % 294 good negatuve %3674 good negative
axes('position',[position_x1(4), position_y1(1), panel_width1, panel_height1]);
xlabel_flag=1; ylabel_flag=1; stim_legend_flag=1; unit_counter=unit_counter+1; cell_title=''; cell_label='c';
fn_plot_PSTH_Supp2 (Param, 'hit', 1, 1, [], 1, key_u, xlabel_flag, ylabel_flag, stim_legend_flag, unit_counter, cell_title, cell_label);
text(-3,43,'Distractor-trained mice, full stimuli','HorizontalAlignment','Left','FontSize',9,'Color', legends{3}.colr,'fontweight','bold' )

% Cell 2
key_u.unit_uid=3219; %314 ok %304 good; 416 great  %373 good
axes('position',[position_x1(5), position_y1(1), panel_width1, panel_height1]);
xlabel_flag=1; ylabel_flag=0; stim_legend_flag=1; unit_counter=unit_counter+1; cell_title=''; cell_label='';
fn_plot_PSTH_Supp2 (Param, 'hit', 1, 1, [], 1, key_u, xlabel_flag, ylabel_flag, stim_legend_flag, unit_counter, cell_title, cell_label);


% Cell 3
% key_u.unit_uid=3726; %348 not good;  %3726 good
% axes('position',[position_x1(6), position_y1(1), panel_width1, panel_height1]);
% xlabel_flag=1; ylabel_flag=0; stim_legend_flag=1; unit_counter=unit_counter+1; cell_title=''; cell_label='';
% fn_plot_PSTH_Supp2 (Param, 'hit', 1, 1, [], 1, key_u, xlabel_flag, ylabel_flag, stim_legend_flag, unit_counter, cell_title, cell_label);


% %% Population FR
% %-------------------------------------------------------------------------------
% axes('position',[position_x2(1), position_y2(1), panel_width2, panel_height2]);
% % Mini Stimuli
% key=[]; k=[];
% key.brain_area = 'ALM';
% key.hemisphere = 'left';
% key.training_type = 'regular';
% % key.unit_quality = 'ok or good'  %'ok or good'
% key.unit_quality = 'ok or good';
% key.cell_type = 'Pyr';
% k = key;
% k.session_flag_mini = 1;
% k.trialtype_flag_left_and_control_right_nopresample = 1;
% k.trialtype_flag_mini = 1;
% if contains(key.unit_quality, 'ok or good')
%     k= rmfield(k,'unit_quality');
%     rel1=(EXP.SessionID *  EPHYS.Unit * EXP.SessionTraining * EPHYS.UnitPosition * EPHYS.UnitCellType * ANL.PSTHAverage * ANL.TrialTypeGraphic  * ANL.SessionGrouping) & ANL.IncludeUnit & k & 'unit_quality!="multi"' & 'outcome="hit"';
%     key.unit_quality = 'ok';
% elseif contains(key.unit_quality, 'multi')
%     k= rmfield(k,'unit_quality');
%     rel1=(EXP.SessionID * EPHYS.Unit * EXP.SessionTraining * EPHYS.UnitPosition * EPHYS.UnitCellType * ANL.PSTHAverage * ANL.TrialTypeGraphic  * ANL.SessionGrouping) & ANL.IncludeUnit & k & 'outcome="hit"';
%     key.unit_quality = 'multi';
% else
%     rel1=(EXP.SessionID * EPHYS.Unit * EXP.SessionTraining * EPHYS.UnitPosition * EPHYS.UnitCellType * ANL.PSTHAverage * ANL.TrialTypeGraphic  * ANL.SessionGrouping) & ANL.IncludeUnit & k & 'outcome="hit"';
% end
% k1=k;
% label_flag=1;
% plot_r_flag=1;
% [xl,yl] = figure_plot_vs1_stimulus_mini(rel1, k1, label_flag, plot_r_flag);
% yl=[-10 20];
% ylim(yl);
% text(xl(1)+diff(xl)*0.5, yl(1)+diff(yl)*1.43, sprintf('%s \n mini stimuli \n', legends{1}.title_label),'FontSize',7,'Color',legends{1}.colr,'HorizontalAlignment','center','fontweight','bold');
% text(xl(1)-diff(xl)*0.55, yl(1)+diff(yl)*1.75, 'e', ...
%     'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
% if label_flag==1
%     text(xl(1)-diff(xl)*0.35, yl(1)+diff(yl)*0.5,[' \Delta Firing ' sprintf('rate \n(Spikes s^{-1})')], 'FontSize',7,'HorizontalAlignment','center','Rotation',90);
%     %     xlabel ('Time (s)','Fontsize', 7);
% end
% text(-1.8,ceil(yl(2))*0.93,'Delay','FontSize',6);
% set(gca,'Xtick',[-2 0],'XtickLabel',[-2 0 ], 'Ytick',[yl(1) yl(2)]);
% text ((xl(1)+diff(xl)*0.5), (yl(1) + diff(yl)*-0.28), sprintf('Time (s)'),'Fontsize', 7,'HorizontalAlignment','center');
% 
% 



% Population
plot_r_flag=1;
flag_normalize_modes=1;
key=[]; k=[];
key.unit_quality = 'ok or good';
key.cell_type = 'Pyr';
key.brain_area = 'ALM';
key.hemisphere = 'left';
key.outcome='hit';
key.mode_type_name = 'Stimulus Orthog.1';
mode_names_titles = { 'Stimulus'};
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
rel =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverageBaseline* EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;
ylabel_flag=1;
xlabel_flag=1;
y_lims = [-0.4,1.05];
[xl, yl] =figure_plotModes3 (rel,  Param, xlabel_flag, title1, title2, title3, ylabel_flag,  k, mode_names_titles, y_lims, flag_normalize_modes, plot_r_flag);
text(xl(1)-diff(xl)*0.5, yl(1)+diff(yl)*1.2, 'd', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
set(gca,'FontSize',7,'Ytick',[ 0 1]);

% Stimulus quantification
%-----------------------------------------------------------------------------
plot_r_flag=1;
flag_normalize_modes=1;
axes('position',[position_x2(4), position_y2(1), panel_width2*0.75, panel_height2]);
hold on;
colr = legends{3}.colr;
yl=[0,1.5];
ylim(yl);
signif_display_offset =-0.3;
compute_stim_amp_full (rel,  Param, colr, flag_normalize_modes, plot_r_flag, yl, signif_display_offset, k);
xl=[-2.9 0.1];
xlim(xl);
set(gca,'Xtick',[-2 0], 'Ytick',[yl(1) yl(2)], 'Fontsize', 6)
text(xl(1)-diff(xl)*0.3, yl(1)+diff(yl)*0.5, sprintf('Full stimuli \nnorm. (a.u.)'), 'FontSize',7,'HorizontalAlignment','center','Rotation',90,'Color',colr);
xl=[-2.9 0.1];
text ((xl(1)+diff(xl)*0.5), (yl(1) + diff(yl)*-0.25), sprintf('Time (s)'),'Fontsize', 7,'HorizontalAlignment','center');
title(sprintf('Stimulus size'),'Fontsize', 7);







%% Right Hemisphere, Distractor-naive, Mini Stimuli

% Cell 1
key_u.unit_uid=5252; %4608 bad; %4689 very good!! %4707 ok% 5252 very good
axes('position',[position_x1(1), position_y1(2), panel_width1, panel_height1]);
xlabel_flag=1; ylabel_flag=1; stim_legend_flag=1; unit_counter=unit_counter+1; cell_title=''; cell_label='e';
fn_plot_PSTH_Supp2 (Param, 'hit', 1, 1, 1, [], key_u, xlabel_flag, ylabel_flag, stim_legend_flag, unit_counter, cell_title, cell_label);
text(-3,14.5,'Distractor-naive mice, mini stimuli','HorizontalAlignment','Left','FontSize',9,'Color', legends{1}.colr,'fontweight','bold' )

% Cell 2
key_u.unit_uid=4689; %2884 ok;  4822 very good
axes('position',[position_x1(2), position_y1(2), panel_width1, panel_height1]);
xlabel_flag=1; ylabel_flag=0; stim_legend_flag=1; unit_counter=unit_counter+1; cell_title=''; cell_label='';
fn_plot_PSTH_Supp2 (Param, 'hit', 1, 1, 1, [], key_u, xlabel_flag, ylabel_flag, stim_legend_flag, unit_counter, cell_title, cell_label);


% % Cell 3
% key_u.unit_uid=5188; %4777 ok negative; %4606 great but no magenta  %4659 ok negative; 4643 bad; 5188 very good
% axes('position',[position_x1(3), position_y1(2), panel_width1, panel_height1]);
% xlabel_flag=1; ylabel_flag=0; stim_legend_flag=1; unit_counter=unit_counter+1; cell_title=''; cell_label='';
% fn_plot_PSTH_Supp2 (Param, 'hit', 1, 1, 1, [], key_u, xlabel_flag, ylabel_flag, stim_legend_flag, unit_counter, cell_title, cell_label);

% Population
plot_r_flag=1;
flag_normalize_modes=1;
key=[]; k=[];
key.unit_quality = 'ok or good';
key.cell_type = 'Pyr';
key.brain_area = 'ALM';
key.hemisphere = 'right';
key.outcome='hit';
key.mode_type_name = 'Stimulus Orthog.1';
mode_names_titles = { 'Stimulus'};
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
rel =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverageBaseline* EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;
ylabel_flag=1;
xlabel_flag=1;
y_lims = [-0.05,1.05];
[xl, yl] =figure_plotModes3 (rel,  Param, xlabel_flag, title1, title2, title3, ylabel_flag,  k, mode_names_titles, y_lims, flag_normalize_modes, plot_r_flag);
text(xl(1)-diff(xl)*0.5, yl(1)+diff(yl)*1.2, 'f', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
set(gca,'FontSize',7,'Ytick',[ 0 1]);

% Stimulus quantification
%-----------------------------------------------------------------------------
plot_r_flag=0;
flag_normalize_modes=1;
axes('position',[position_x2(2), position_y2(2), panel_width2*0.75, panel_height2]);
hold on;
colr = legends{1}.colr;
yl=[0,0.5];
ylim(yl);
signif_display_offset =-0.3;
compute_stim_amp_mini (rel,  Param, colr, flag_normalize_modes, plot_r_flag, yl, signif_display_offset, k);
xl=[-2.9 0.1];
xlim(xl);
set(gca,'Xtick',[-2 0], 'Ytick',[yl(1) yl(2)], 'Fontsize', 6)
text(xl(1)-diff(xl)*0.3, yl(1)+diff(yl)*0.5, sprintf('Mini stimuli \nnorm. (a.u.)'), 'FontSize',7,'HorizontalAlignment','center','Rotation',90,'Color',colr);
xl=[-2.9 0.1];
text ((xl(1)+diff(xl)*0.5), (yl(1) + diff(yl)*-0.25), sprintf('Time (s)'),'Fontsize', 7,'HorizontalAlignment','center');
title(sprintf('Stimulus size'),'Fontsize', 7);

%% Right Hemisphere, Distractor-trained, Full Stimuli

% Cell 1
key_u.unit_uid= 3391; %3391 excellent; %3444 great ;%3352 equal; %3462 ok
axes('position',[position_x1(4), position_y1(2), panel_width1, panel_height1]);
xlabel_flag=1; ylabel_flag=1; stim_legend_flag=1; unit_counter=unit_counter+1; cell_title=''; cell_label='g';
fn_plot_PSTH_Supp2 (Param, 'hit', 1, 1, [], 1, key_u, xlabel_flag, ylabel_flag, stim_legend_flag, unit_counter, cell_title, cell_label);
text(-3,43,'Distractor-trained mice, full stimuli','HorizontalAlignment','Left','FontSize',9,'Color', legends{3}.colr,'fontweight','bold' )

% Cell 2
key_u.unit_uid= 3462; %3462 good
axes('position',[position_x1(5), position_y1(2), panel_width1, panel_height1]);
xlabel_flag=1; ylabel_flag=0; stim_legend_flag=1; unit_counter=unit_counter+1; cell_title=''; cell_label='';
fn_plot_PSTH_Supp2 (Param, 'hit', 1, 1, [], 1, key_u, xlabel_flag, ylabel_flag, stim_legend_flag, unit_counter, cell_title, cell_label);


% % Cell 3
% key_u.unit_uid=1421; %1421 decays 659 too late;   
% axes('position',[position_x1(6), position_y1(2), panel_width1, panel_height1]);
% xlabel_flag=1; ylabel_flag=0; stim_legend_flag=1; unit_counter=unit_counter+1; cell_title=''; cell_label='';
% fn_plot_PSTH_Supp2 (Param, 'hit', 1, 1, [], 1, key_u, xlabel_flag, ylabel_flag, stim_legend_flag, unit_counter, cell_title, cell_label);


% Population
plot_r_flag=1;
flag_normalize_modes=1;
key=[]; k=[];
key.unit_quality = 'ok or good';
key.cell_type = 'Pyr';
key.brain_area = 'ALM';
key.hemisphere = 'right';
key.outcome='hit';
key.mode_type_name = 'Stimulus Orthog.1';
mode_names_titles = { 'Stimulus'};
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
rel =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverageBaseline* EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;
ylabel_flag=1;
xlabel_flag=1;
y_lims = [-0.4,1.05];
[xl, yl] =figure_plotModes3 (rel,  Param, xlabel_flag, title1, title2, title3, ylabel_flag,  k, mode_names_titles, y_lims, flag_normalize_modes, plot_r_flag);
text(xl(1)-diff(xl)*0.5, yl(1)+diff(yl)*1.2, 'h', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
set(gca,'FontSize',7,'Ytick',[ 0 1]);


% Stimulus quantification
%-----------------------------------------------------------------------------
plot_r_flag=1;
flag_normalize_modes=1;
axes('position',[position_x2(4), position_y2(2), panel_width2*0.75, panel_height2]);
hold on;
colr = legends{3}.colr;
yl=[0,1.5];
ylim(yl);
signif_display_offset =-0.3;
compute_stim_amp_full (rel,  Param, colr, flag_normalize_modes, plot_r_flag, yl, signif_display_offset, k);
xl=[-2.9 0.1];
xlim(xl);
set(gca,'Xtick',[-2 0], 'Ytick',[yl(1) yl(2)], 'Fontsize', 6)
text(xl(1)-diff(xl)*0.3, yl(1)+diff(yl)*0.5, sprintf('Full stimuli \nnorm. (a.u.)'), 'FontSize',7,'HorizontalAlignment','center','Rotation',90,'Color',colr);
xl=[-2.9 0.1];
text ((xl(1)+diff(xl)*0.5), (yl(1) + diff(yl)*-0.25), sprintf('Time (s)'),'Fontsize', 7,'HorizontalAlignment','center');
title(sprintf('Stimulus size'),'Fontsize', 7);

if isempty(dir(dir_save_figure))
    mkdir (dir_save_figure)
end
figure_name_out=[ dir_save_figure filename];
eval(['print ', figure_name_out, ' -dtiff -cmyk -r300']);
eval(['print ', figure_name_out, ' -painters -dpdf -cmyk -r200']);


end




