function fig3_alm_modes()
close all;

dir_root = 'Z:\users\Arseny\Projects\SensoryInput\SiProbeRecording\'
dir_save_figure = [dir_root 'Results\figures\v1\'];

%Graphics
%---------------------------------
figure;
set(gcf,'DefaultAxesFontName','helvetica');
set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 35 30]);
set(gcf,'PaperOrientation','portrait');
set(gcf,'Units','centimeters','Position',get(gcf,'paperPosition')+[3 0 0 0]);

Param = struct2table(fetch (ANL.Parameters,'*'));
smooth_time = Param.parameter_value{(strcmp('smooth_time_proj',Param.parameter_name))};


key.unit_quality = 'ok or good'
key.cell_type = 'Pyr'
key.mode_weights_sign = 'all';

key.trialtype_flag_left_and_control_right=1;


%% Left ALM
key.brain_area = 'ALM'
key.hemisphere = 'left'

% Regular mini
key.training_type = 'regular'
k=key;
condition = 'mini'
k.session_flag_mini = 1;
k.trialtype_flag_mini = 1;
title1 = 'Regular mice';
title2='mini stimuli';
title3= [key.brain_area ' ' key.hemisphere];
% rel =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverage * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime ) ) & k & 'unit_quality!="multi"' ;
rel =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverage * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime ) ) & k ;
suffix =[];
position_x_idx=1;
ylabel_flag=1;
plotModes_for_figure (rel,  Param, position_x_idx, title1, title2, title3, ylabel_flag);

% Distractor mini
key.training_type = 'distractor'
k=key;
condition = 'mini'
k.session_flag_mini = 1;
k.trialtype_flag_mini = 1;
title3=[];
title1 = '                              Expert mice';
title2='mini stimuli';
rel =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverage * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime ) ) & k ;
suffix =[];
position_x_idx=2;
ylabel_flag=0;
plotModes_for_figure (rel,  Param, position_x_idx, title1, title2,title3, ylabel_flag);


% Distractor full
key.training_type = 'distractor'
k=key;
condition = 'full'
k.session_flag_full = 1;
k.trialtype_flag_full = 1;
title3=[];
title1 = '';
title2='full stimuli';
rel =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverage * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime ) ) & k ;
suffix =[];
position_x_idx=3;
ylabel_flag=0;
plotModes_for_figure (rel,  Param, position_x_idx, title1, title2,title3, ylabel_flag);


%% Right ALM
key.brain_area = 'ALM'
key.hemisphere = 'right'

% Regular mini
key.training_type = 'regular'
k=key;
condition = 'mini'
k.session_flag_mini = 1;
k.trialtype_flag_mini = 1;
title1 = 'Regular mice';
title2='mini stimuli';
title3= [key.brain_area ' ' key.hemisphere];
rel =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverage * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime ) ) & k;
suffix =[];
position_x_idx=4;
ylabel_flag=1;
plotModes_for_figure (rel,  Param, position_x_idx, title1, title2, title3, ylabel_flag);

% Distractor mini
key.training_type = 'distractor'
k=key;
condition = 'mini'
k.session_flag_mini = 1;
k.trialtype_flag_mini = 1;
title3=[];
title1 = '                              Expert mice';
title2='mini stimuli';
rel =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverage * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime ) ) & k ;
suffix =[];
position_x_idx=5;
ylabel_flag=0;
plotModes_for_figure (rel,  Param, position_x_idx, title1, title2,title3, ylabel_flag);


% Distractor full
key.training_type = 'distractor'
k=key;
condition = 'full'
k.session_flag_full = 1;
k.trialtype_flag_full = 1;
title3=[];
title1 = '';
title2='full stimuli';
rel =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverage * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime ) ) & k ;
suffix =[];
position_x_idx=6;
ylabel_flag=0;
plotModes_for_figure (rel,  Param, position_x_idx, title1, title2,title3, ylabel_flag);



if contains(key.unit_quality, 'ok or good')
    key.unit_quality = 'ok';
end

dir_save_figure_full=dir_save_figure;
filename =[sprintf('fig3_%s_%s_%s' ,key.brain_area,  key.unit_quality, key.cell_type)];

if isempty(dir(dir_save_figure_full))
    mkdir (dir_save_figure_full)
end
figure_name_out=[ dir_save_figure_full filename];
eval(['print ', figure_name_out, ' -dtiff -cmyk -r300']);
eval(['print ', figure_name_out, ' -painters -dpdf -cmyk -r200']);



end




