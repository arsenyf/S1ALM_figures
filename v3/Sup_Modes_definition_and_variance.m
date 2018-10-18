function Sup_Modes_definition_and_variance()
close all;

dir_root = 'Z:\users\Arseny\Projects\SensoryInput\SiProbeRecording\'
dir_embeded_graphics = 'Z:\users\Arseny\Projects\SensoryInput\SiProbeRecording\Graphic_for_figures\'
dir_save_figure = [dir_root 'Results\figures\v3\'];
filename = 'Sup_Modes_definition_and_variance';

key.brain_area = 'ALM'
key.hemisphere = 'left'
% key.training_type = 'distractor'
key.unit_quality = 'ok or good'
key.cell_type = 'Pyr'
k=key;
k.outcome='hit';

k_proj.mode_weights_sign='all';
% k.session_uid=32;
if contains(k.unit_quality, 'ok or good')
    k = rmfield(k,'unit_quality')
    rel_PSTH = (( ANL.PSTHAverageLR * EXP.Session * EXP.SessionID * EPHYS.Unit * EPHYS.UnitPosition * EPHYS.UnitCellType * EXP.SessionTraining  ) ) & ANL.IncludeUnit & k & 'unit_quality!="multi"' ;
    rel_Proj = (( ANL.ProjTrialAdaptiveAverage * EXP.Session * EXP.SessionID  * EXP.SessionTraining  )) & k & k_proj & 'unit_quality="ok or good"' ;
else
    rel_PSTH = (( ANL.PSTHAverageLR * EXP.Session * EXP.SessionID * EPHYS.Unit * EPHYS.UnitPosition * EPHYS.UnitCellType * EXP.SessionTraining  )) & ANL.IncludeUnit & k ;
    rel_Proj = (( ANL.ProjTrialAdaptiveAverage * EXP.Session * EXP.SessionID   * EXP.SessionTraining ) ) & k & k_proj;
end


%Graphics
%---------------------------------
figure1=figure;
set(gcf,'DefaultAxesFontName','helvetica');
set(gcf,'PaperUnits','centimeters','PaperPosition',[0.5 7 21 21]);
set(gcf,'PaperOrientation','portrait');
set(gcf,'Units','centimeters','Position',get(gcf,'paperPosition')+[3 -10 0 0]);

panel_width1=0.15;
panel_height1=0.09;
horizontal_distance1=0.21;
vertical_distance1=0.11;

position_x1(1)=0.07;
position_x1(2)=position_x1(1)+horizontal_distance1;
position_x1(3)=position_x1(2)+horizontal_distance1;
position_x1(4)=position_x1(3)+horizontal_distance1;
position_x1(5)=position_x1(4)+horizontal_distance1;
position_x1(6)=position_x1(5)+horizontal_distance1;
position_x1(7)=position_x1(6)+horizontal_distance1*0.6;

position_y1(1)=0.77;
position_y1(2)=position_y1(1)-vertical_distance1;
position_y1(3)=position_y1(2)-vertical_distance1*1.5;



% Params
Param = struct2table(fetch (ANL.Parameters,'*'));
t_go = Param.parameter_value{(strcmp('t_go',Param.parameter_name))};
t_chirp1 = Param.parameter_value{(strcmp('t_chirp1',Param.parameter_name))};
t_chirp2 = Param.parameter_value{(strcmp('t_chirp2',Param.parameter_name))};

% c=distinguishable_colors(8);
colr{1}=[ 0    0.3448         0];
colr{2}=[ 0    1.0000         0];
colr{3}=[0.5000         0    0.5000];


%% Activity space
axes('position', [position_x1(1) position_y1(1) panel_width1, panel_width1]); hold on ;
xl = [0 1456];
yl = [0 1159];
fig1_a = imread([dir_embeded_graphics 'activity_space.jpg']);
fig1_a=flipdim(fig1_a,1);
imagesc(fig1_a);
set(gca,'Xlim',xl,'Ylim',yl);
text(xl(1)+diff(xl)*0.5, yl(1)+diff(yl)*1.1,'Activity space','FontSize',8,'FontWeight','bold','Color',[0 0 0],'HorizontalAlignment','center');
axis off;
axis tight;
axis equal;
text(xl(1)-diff(xl)*0.1, yl(1)+diff(yl)*1.2, 'a', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');

% Activity space - Stimulus mode
axes('position', [position_x1(2) position_y1(1) panel_width1, panel_width1]); hold on ;
xl = [0 1456];
yl = [0 1159];
fig1_a = imread([dir_embeded_graphics 'activity_space_stimulus.jpg']);
fig1_a=flipdim(fig1_a,1);
imagesc(fig1_a);
set(gca,'Xlim',xl,'Ylim',yl);
text(xl(1)+diff(xl)*0.5, yl(1)+diff(yl)*1.1,'Stimulus mode','FontSize',8,'FontWeight','bold','Color',colr{1},'HorizontalAlignment','center');
axis off;
axis tight;
axis equal;
text(xl(1)-diff(xl)*0.25, yl(1)+diff(yl)*1.2, 'b', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');

% Activity space - Choice mode
axes('position', [position_x1(3) position_y1(1) panel_width1, panel_width1]); hold on ;
xl = [0 1456];
yl = [0 1159];
fig1_a = imread([dir_embeded_graphics 'activity_space_choice.jpg']);
fig1_a=flipdim(fig1_a,1);
imagesc(fig1_a);
set(gca,'Xlim',xl,'Ylim',yl);
text(xl(1)+diff(xl)*0.5, yl(1)+diff(yl)*1.1,'Choice mode','FontSize',8,'FontWeight','bold','Color',colr{2},'HorizontalAlignment','center');
axis off;
axis tight;
axis equal;
text(xl(1)-diff(xl)*0.25, yl(1)+diff(yl)*1.2, 'c', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');

% Activity space - Ramping mode
axes('position', [position_x1(4) position_y1(1) panel_width1, panel_width1]); hold on ;
xl = [0 1456];
yl = [0 1159];
fig1_a = imread([dir_embeded_graphics 'activity_space_ramping.jpg']);
fig1_a=flipdim(fig1_a,1);
imagesc(fig1_a);
set(gca,'Xlim',xl,'Ylim',yl);
text(xl(1)+diff(xl)*0.5, yl(1)+diff(yl)*1.1,sprintf('Ramping mode \n (non-selective) '),'FontSize',8,'FontWeight','bold','Color',colr{3},'HorizontalAlignment','center');
axis off;
axis tight;
axis equal;
text(xl(1)-diff(xl)*0.25, yl(1)+diff(yl)*1.2, 'd', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');

%% Activity space
axes('position', [position_x1(1) position_y1(2)-0.05 panel_width1, panel_width1]); hold on ;
xl = [0 1658];
yl = [0 949];
fig1_a = imread([dir_embeded_graphics 'activity_space_orthogonal.jpg']);
fig1_a=flipdim(fig1_a,1);
imagesc(fig1_a);
set(gca,'Xlim',xl,'Ylim',yl);
text(xl(1)+diff(xl)*0.5, yl(1)+diff(yl)*1.25,sprintf('Orthogonalization to \n Choice mode'),'FontSize',8,'FontWeight','bold','Color',[0 0 0],'HorizontalAlignment','center');
axis off;
axis tight;
axis equal;
text(xl(1)-diff(xl)*0.1, yl(1)+diff(yl)*1.5, 'e', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');


%% Projections
plot_r_flag=1;
flag_normalize_modes=1;

key=[]; k=[];
key.unit_quality = 'ok or good';
key.cell_type = 'Pyr';
key.mode_weights_sign = 'all';
key.brain_area = 'ALM';
key.hemisphere = 'left';
outcome='hit';

% Stimulus mode
axes('position',[position_x1(2), position_y1(2), panel_width1, panel_height1]);
mode_names = { 'Stimulus Orthog.'};
mode_names_titles = { 'Stimulus'};
k=key;
k.trialtype_left_and_right_no_distractors = 1;
title1 = '';
title2='';
title3=[];
rel_choice_full =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverageBaseline * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;
xlabel_flag=1;
ylabel_flag=1;
y_lims = [-0.25,1];
xl=([-4 1]);
[xl, yl] =figure_plotModes_supModesVariance (rel_choice_full,  Param, xlabel_flag, title1, title2, title3, ylabel_flag,  mode_names, mode_names_titles, y_lims,outcome, flag_normalize_modes, xl);
text(xl(1)-diff(xl)*0.25, yl(1)+diff(yl)*1.2, 'f', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
text(-1.5, yl(1)+diff(yl)*1, 'Delay', ...
    'fontsize', 8, 'HorizontalAlignment','left');

% Late Delay mode
axes('position',[position_x1(3), position_y1(2), panel_width1, panel_height1]);
mode_names = { 'LateDelay'};
mode_names_titles = { 'Choice'};
k=key;
k.trialtype_left_and_right_no_distractors = 1;
title1 = '';
title2='';
title3=[];
rel_choice_full =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverageBaseline * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;
xlabel_flag=1;
ylabel_flag=1;
y_lims = [-0.25,1];
xl=([-4 1]);
[xl, yl] =figure_plotModes_supModesVariance (rel_choice_full,  Param, xlabel_flag, title1, title2, title3, ylabel_flag,  mode_names, mode_names_titles, y_lims,outcome, flag_normalize_modes, xl);
text(xl(1)-diff(xl)*0.25, yl(1)+diff(yl)*1.2, 'g', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
text(-1.5, yl(1)+diff(yl)*1, 'Delay', ...
    'fontsize', 8, 'HorizontalAlignment','left');

% Ramping mode
axes('position',[position_x1(4), position_y1(2), panel_width1, panel_height1]);
mode_names = { 'Ramping Orthog.'};
mode_names_titles = { 'Ramping'};
k=key;
k.trialtype_left_and_right_no_distractors = 1;
title1 = '';
title2='';
title3=[];
rel_choice_full =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverageBaseline * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;
xlabel_flag=1;
ylabel_flag=1;
y_lims = [-0.25,1];
xl=([-4 1]);
[xl, yl] =figure_plotModes_supModesVariance (rel_choice_full,  Param, xlabel_flag, title1, title2, title3, ylabel_flag,  mode_names, mode_names_titles, y_lims,outcome, flag_normalize_modes, xl);
text(xl(1)-diff(xl)*0.25, yl(1)+diff(yl)*1.2, 'h', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
text(-1.5, yl(1)+diff(yl)*1, 'Delay', ...
    'fontsize', 8, 'HorizontalAlignment','left');








%% After orthogonalization
mode_names = {'LateDelay', 'Stimulus Orthog.','Ramping Orthog.'};
[selectivity_explained,trialavg_var_explained, time2plot]= fn_compute_varaince(Param,rel_Proj,rel_PSTH, mode_names);

%Selectivity explained
axes('position',[position_x1(1)+0.05, position_y1(3), panel_width1, panel_height1]);
xl=fn_plot_variance(Param, time2plot, selectivity_explained);
yl=[0 1];
ylim(yl);
set(gca, 'Ytick',ylim);
text(xl(1)-diff(xl)*0.14, yl(1)+diff(yl)*0.4, sprintf('Selectivity explained \n'),'Rotation',90,'HorizontalAlignment','center', 'FontSize',8);
text(xl(1)+diff(xl)*-0.45, yl(1)+diff(yl)*1.2, 'i', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
text(-0.5+11,1,'Stimulus mode','FontSize',8,'Color',colr{1} );
plot([-1.25 -0.75]+11,[1 1],'-','LineWidth',1,'Color',colr{1} ,'Clipping','off');
text(-0.5+11,0.5,'Choice mode','FontSize',8,'Color',colr{2} );
plot([-1.25 -0.75]+11,[0.5 0.5],'-','LineWidth',1,'Color',colr{2} ,'Clipping','off');
text(-0.5 +11,0,'Ramping mode','FontSize',8,'Color',colr{3} );
plot([-1.25 -0.75]+11,[0 0],'-','LineWidth',1,'Color',colr{3} ,'Clipping','off');

%'Trial-averaged Variance explained
axes('position',[position_x1(2)+0.1, position_y1(3), panel_width1, panel_height1]);
xl=fn_plot_variance(Param, time2plot, trialavg_var_explained);
yl=[0 0.75];
ylim(yl);
set(gca, 'Ytick',ylim);
text(xl(1)-diff(xl)*0.35, yl(1)+diff(yl)*0.35, sprintf('Trial-averaged \n Variance explained'),'Rotation',90,'HorizontalAlignment','center', 'FontSize',8);
text(xl(1)+diff(xl)*-0.45, yl(1)+diff(yl)*1.2, 'j', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');

% %% After orthogonalization
% mode_names = {'LateDelay', 'Stimulus Orthog.','Ramping Orthog.'};
% [selectivity_explained,trialavg_var_explained, time2plot]= fn_compute_varaince(Param,rel_Proj,rel_PSTH, mode_names);
%
% %Selectivity explained
% axes('position',[position_x1(2), position_y1(2), panel_width1, panel_height1]);
% xl=fn_plot_variance(Param, time2plot, selectivity_explained);
% yl=[0 1];
% ylim(yl);
% set(gca, 'Ytick',ylim);
% text(xl(1)-diff(xl)*0.2, yl(1)+diff(yl)*0.4, sprintf('Selectivity explained \n'),'Rotation',90,'HorizontalAlignment','center', 'FontSize',8);
% text(xl(1)+diff(xl)*-0.45, yl(1)+diff(yl)*1.25, 'b', ...
%     'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
% text(xl(1)+diff(xl)*-0.25, yl(1)+diff(yl)*1.2, 'Orthogonalizing Stimulus to Choice mode', ...
%     'fontsize', 8, 'fontname', 'helvetica','HorizontalAlignment','left');
%
% %'Trial-averaged Variance explained
% axes('position',[position_x1(3), position_y1(2), panel_width1, panel_height1]);
% xl=fn_plot_variance(Param, time2plot, trialavg_var_explained);
% yl=[0 0.75];
% ylim(yl);
% text(xl(1)-diff(xl)*0.45, yl(1)+diff(yl)*0.35, sprintf('Trial-averaged \n Variance explained'),'Rotation',90,'HorizontalAlignment','center', 'FontSize',8);
% set(gca, 'Ytick',ylim);

% %% 2D projections - correct
% flag_normalize_modes =1; % 1 to normalize projections between 0 and 1, 0 to plot absolute values
% Param = struct2table(fetch (ANL.Parameters,'*'));
% smooth_time = Param.parameter_value{(strcmp('smooth_time_proj2D',Param.parameter_name))};
% mode_names = {'Left vs. baseline', 'Right vs. baseline'};
% % mode_names = {'LateDelay', 'Ramping Orthog.'};
% mode_names_titles = {'Left', 'Right'};
% plot_r_flag=1;
% 
% axes('position',[position_x1(1), position_y1(1), panel_width1, panel_height1]);
% % Regular mini
% key=[]; k=[];
% key.trialtype_flag_left_and_control_right_nopresample=1;
% key.brain_area = 'ALM';
% key.hemisphere = 'left'
% % key.training_type = 'regular';
% key.unit_quality = 'ok or good';
% key.cell_type = 'Pyr';
% key.mode_weights_sign = 'all';
% % key.session_flag_mini = 1;
% key.trialtype_left_and_right_no_distractors = 1;
% k = key;
% xlabel_flag=1;
% ylabel_flag=1;
% outcome='hit';
% rel =((EXP.Session * EXP.SessionID * ANL.ProjTrialAverageBaseline * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime - ANL.ExcludeSession) & k & 'unit_quality!="multi"' );
% xl_normalized = [0,1]; yl_normalized=[0,1];
% [xl,yl]=figures_plotModes_2D (rel,  Param, mode_names, mode_names_titles, xlabel_flag, ylabel_flag, flag_normalize_modes, xl_normalized, yl_normalized,outcome, plot_r_flag);
% text(xl(1)+diff(xl)*-0.33, yl(1)+diff(yl)*1.2, 'd', ...
%     'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
% % title(sprintf('%s \n mini stimuli', legends{1}.title_label),'FontSize',7,'Color',legends{1}.colr);
% % text(xl(1)+diff(xl)*0.7, yl(1)+diff(yl)*0.1, 'Correct', ...
% %     'fontsize', 7,'HorizontalAlignment','center');

if isempty(dir(dir_save_figure))
    mkdir (dir_save_figure)
end
figure_name_out=[ dir_save_figure filename];
eval(['print ', figure_name_out, ' -dtiff -cmyk -r300']);
eval(['print ', figure_name_out, ' -painters -dpdf -cmyk -r200']);
%

end




