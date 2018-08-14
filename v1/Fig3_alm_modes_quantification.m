function Fig3_alm_modes_quantification()
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
panel_width=0.2;
panel_height=0.15;
horizontal_distance=0.3;
vertical_distance=0.3;

position_x(1)=0.1;
position_x(2)=position_x(1) + horizontal_distance;

position_y(1)=0.6;
position_y(2)=position_y(1)-vertical_distance;


Param = struct2table(fetch (ANL.Parameters,'*'));
smooth_time = Param.parameter_value{(strcmp('smooth_time_proj',Param.parameter_name))};


key.unit_quality = 'ok or good';
key.cell_type = 'Pyr';
key.mode_weights_sign = 'all';
key.brain_area = 'ALM';
% key.hemisphere = 'left';



%% Regular mini
key.training_type = 'regular';
k=[];
k=key;
k.session_flag_mini = 1;
k.trialtype_flag_left_stim_mini = 1;
rel =((EXP.Session * EXP.SessionID * ANL.ProjTrialAverage * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;

axes('position',[position_x(1), position_y(1), panel_width, panel_height]);
hold on;
yyaxis left
colr = [0 0.5 0];
compute_stim_amp (rel,  Param, colr);
ylim([0,2]);
set(gca,'YColor',colr,'Fontsize', 12)
ylabel (sprintf('Stimulus (a.u.)\n Trained mice'),'Fontsize', 12);

compute_stim_kinetics_modes (rel,  Param, colr);

%% Distractor full
key.training_type = 'distractor';
k=[];
k=key;
k.session_flag_full = 1;
k.trialtype_flag_left_stim_full = 1;
rel =((EXP.Session * EXP.SessionID * ANL.ProjTrialAverage * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime - ANL.ExcludeSession) ) & k ;

title(sprintf('Input to left ALM at stimulation \n'));
yyaxis right
colr = [0 0 0.5];
compute_stim_amp (rel,  Param, colr);
ylim([0,6]);
set(gca,'YColor',colr,'Fontsize', 12)
ylabel (sprintf('Stimulus (a.u.)\n Expert mice'),'Fontsize', 12);

compute_stim_kinetics_modes (rel,  Param, colr);


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

dir_save_figure_full=dir_save_figure;
filename =[sprintf('%s%s_Training_%s_UnitQuality_%s_Type_%s__StimulusProj' ,key.brain_area, key.hemisphere, key.training_type, key.unit_quality, key.cell_type)];

if isempty(dir(dir_save_figure_full))
    mkdir (dir_save_figure_full)
end
figure_name_out=[ dir_save_figure_full filename];
eval(['print ', figure_name_out, ' -dtiff -cmyk -r300']);
eval(['print ', figure_name_out, ' -painters -dpdf -cmyk -r200']);



end




