function Fig3_alm_modes_amp()
close all;

dir_root = 'Z:\users\Arseny\Projects\SensoryInput\SiProbeRecording\'
dir_save_figure = [dir_root 'Results\figures\v1\'];


%Graphics
%---------------------------------
figure;
set(gcf,'DefaultAxesFontName','helvetica');
set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 23 30]);
set(gcf,'PaperOrientation','portrait');
set(gcf,'Units','centimeters','Position',get(gcf,'paperPosition')+[3 0 0 0]);
panel_width=0.1;
panel_height=0.08;
horizontal_distance=0.17;
vertical_distance=0.2;

position_x(1)=0.1;
position_x(2)=position_x(1) + horizontal_distance*0.75;
position_x(3)=position_x(2) + horizontal_distance;

position_y(1)=0.6;
position_y(2)=position_y(1)-vertical_distance;
position_y(3)=position_y(2)-vertical_distance;


Param = struct2table(fetch (ANL.Parameters,'*'));


key.unit_quality = 'ok or good';
key.cell_type = 'Pyr';
key.mode_weights_sign = 'all';
key.brain_area = 'ALM';
% key.hemisphere = 'left';

%% %% Regular mini
mode_names = { 'Stimulus Orthog.'};
mode_names_titles = { 'Stimulus'};

k=key;
condition = 'mini'
k.session_flag_mini = 1;
k.trialtype_flag_left_and_control_right = 1;
k.trialtype_flag_mini = 1;
title1 = 'Trained';
title2='mini stimuli';
title3=[];
% title3= [key.brain_area ' ' key.hemisphere];
rel =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverageNormalized * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;
position_x_idx=1;
ylabel_flag=1;
y_lims = [-0.25,1];
plotModes_for_figure2 (rel,  Param, position_x_idx, title1, title2, title3, ylabel_flag,  mode_names, mode_names_titles, y_lims);

%% %% Distractor full
mode_names = { 'Stimulus Orthog.'};
mode_names_titles = { 'Stimulus'};
k=[];
k=key;
condition = 'mini'
k.session_flag_full = 1;
k.trialtype_flag_left_and_control_right = 1;
k.trialtype_flag_full = 1;
title1 = 'Expert';
title2='full stimuli';
title3=[];
% title3= [key.brain_area ' ' key.hemisphere];
rel =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverageNormalized * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;
position_x_idx=2;
ylabel_flag=0;
y_lims = [-0.25,1];
plotModes_for_figure2 (rel,  Param, position_x_idx, title1, title2, title3, ylabel_flag,  mode_names, mode_names_titles, y_lims);


%% Stimulus quantification
%-----------------------------------------------------------------------------

%% Regular mini
key.training_type = 'regular';
k=[];
k=key;
k.session_flag_mini = 1;
k.trialtype_flag_left_stim_mini = 1;
rel =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverageNormalized * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;



axes('position',[position_x(3), position_y(1), panel_width, panel_height]);
hold on;
yyaxis left
colr = [0 0.4 0.5];
compute_stim_amp (rel,  Param, colr);
ylim([0,0.05]);
set(gca,'YColor',colr,'Fontsize', 10)
ylabel (sprintf('Mini Stimuli'),'Fontsize', 10,'Color',colr);

% %% Distractor mini
% key.training_type = 'distractor';
% k=[];
% k=key;
% k.session_flag_mini = 1;
% k.trialtype_flag_left_stim_mini = 1;
% rel =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverageNormalized * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;
% 
% yyaxis left
% colr = [0 0 1];
% compute_stim_amp (rel,  Param, colr);
% ylim([0,0.1]);
% set(gca,'YColor',colr,'Fontsize', 12)
% ylabel (sprintf('Stimulus (a.u.)\n Trained mice'),'Fontsize', 12);

%% Distractor full
key.training_type = 'distractor';
k=[];
k=key;
k.session_flag_full = 1;
k.trialtype_flag_left_stim_full = 1;
rel =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverageNormalized * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime - ANL.ExcludeSession) ) & k ;

yyaxis right
colr = [0 1 0];
compute_stim_amp (rel,  Param, colr);
ylim([0,0.4]);
set(gca,'YColor',colr,'Fontsize', 10)
ylabel (sprintf('Full Stimuli \n(a.u.)'),'Fontsize', 10,'Color',colr);
text(-1.8,0.4*1.1,'Delay','FontSize',9);
title(sprintf('Inputs to ALM during \n vS1 stimulation \n'),'Fontsize', 10);


% % Distractor mini
% key.training_type = 'distractor'
% k=key;
% condition = 'mini'
% k.session_flag_mini = 1;
% k.trialtype_flag_mini = 1;
% title3=[];
% title1 = 'Expert mice';
% title2='mini stimuli';
% rel =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverage * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime - ANL.ExcludeSession) ) & k ;
% suffix =[];
% position_x_idx=5;
% ylabel_flag=0;
% compute_stim_amp (rel,  Param, position_x_idx, title1, title2, title3, ylabel_flag);



if contains(key.unit_quality, 'ok or good')
    key.unit_quality = 'ok';
end
if ~isfield(key, 'hemisphere')
    key.hemisphere='both';
end
dir_save_figure_full=dir_save_figure;
filename =[sprintf('%s_%s__StimulusProjAmpl' , key.hemisphere, key.cell_type)];

if isempty(dir(dir_save_figure_full))
    mkdir (dir_save_figure_full);

end
figure_name_out=[ dir_save_figure_full filename];
eval(['print ', figure_name_out, ' -dtiff -cmyk -r300']);
eval(['print ', figure_name_out, ' -painters -dpdf -cmyk -r200']);



end




