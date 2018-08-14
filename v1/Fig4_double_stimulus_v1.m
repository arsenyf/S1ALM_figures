function Fig4_double_stimulus_v1()
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


%% Left ALM
key.brain_area = 'ALM'
key.hemisphere = 'left'
key.trialtype_flag_double_sample_amplitude=1;
key.session_flag_double_sample_amplitude=1;

% Regular mini
key.training_type = 'regular'
k=key;
title1 = 'Regular mice';
title2='Double stimulus';
title3=[];
rel =((EXP.Session * EXP.SessionID * ANL.ProjTrialAdaptiveAverage * EXP.SessionTraining  * ANL.TrialTypeID * ANL.TrialTypeGraphic * ANL.TrialTypeInstruction *  ANL.IncludeSession * ANL.SessionGrouping * ANL.TrialTypeStimTime) - ANL.ExcludeSession) & k ;
suffix =[];
position_x_idx=1;
ylabel_flag=1;
plotModes_for_figure (rel,  Param, position_x_idx, title1, title2, title3, ylabel_flag);



if contains(key.unit_quality, 'ok or good')
    key.unit_quality = 'ok';
end

dir_save_figure_full=dir_save_figure;
% filename =[sprintf('fig3_%s_%s_%s_correct_left_vs_right' ,key.brain_area,  key.unit_quality, key.cell_type)];
filename =[sprintf('fig4_%s_%s_%s_double_stimulus' ,key.brain_area,  key.unit_quality, key.cell_type)];

% filename =[sprintf('fig3_%s_%s_%s_stim' ,key.brain_area,  key.unit_quality, key.cell_type)];

if isempty(dir(dir_save_figure_full))
    mkdir (dir_save_figure_full)
end
figure_name_out=[ dir_save_figure_full filename];
eval(['print ', figure_name_out, ' -dtiff -cmyk -r300']);
eval(['print ', figure_name_out, ' -painters -dpdf -cmyk -r200']);



end




