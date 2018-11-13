function Sup_Ramping_Session_time() % MATLAB R2017a
close all;
 
dir_root = 'Z:\users\Arseny\Projects\SensoryInput\SiProbeRecording\'
dir_embeded_graphics = 'Z:\users\Arseny\Projects\SensoryInput\SiProbeRecording\Graphic_for_figures\'
dir_save_figure = [dir_root 'Results\figures\v\'];
filename = 'Sup_ramping_session_time';

%% Stim kinetics
key=[]; k=[];
key.unit_quality = 'all';
key.cell_type = 'Pyr';
key.mode_weights_sign = 'all';
key.brain_area = 'ALM';
key.outcome_grouping = 'all';
key.mode_type_name='Ramping Orthog.';
rel_ramping=ANL.RampingSessionModulationProjTrialAverage & key & ANL.IncludeSession - ANL.ExcludeSession & 'num_trials_session_bin>30';
ramping_slope_binned = cell2mat(fetchn(rel_ramping,'ramping_slope_session_time_binned'));

temp= fetchn(rel_ramping,'session_time_binned_vector');
session_prctile=temp{1};
ramping_slope_binned=ramping_slope_binned./max(ramping_slope_binned,[],2);

subplot(2,2,1)
plot(session_prctile,ramping_slope_binned)
hold on
plot(session_prctile,nanmean(ramping_slope_binned),'-k','LineWidth',3)
ylim([0.5 1])
a=1

key.outcome_grouping = 'all';

rel_error_rate=ANL.ErrorRateSessionModulation & key & ANL.IncludeSession - ANL.ExcludeSession & 'num_trials_session_bin>30';
error_rate = cell2mat(fetchn(rel_error_rate,'error_rate_session_time_binned'));

subplot(2,2,2)
plot(session_prctile,error_rate)
hold on
plot(session_prctile,nanmean(error_rate),'-k','LineWidth',3)
ylim([0.7 0.8])
a=1

rel_corr=rel_ramping*EXP.SessionID*proj(rel_error_rate,'error_rate_session_time_binned->error_rate_binned')

ramping_binned=cell2mat(fetchn(rel_corr,'ramping_slope_session_time_binned','ORDER BY session_uid'));
error_binned=cell2mat(fetchn(rel_corr,'error_rate_binned','ORDER BY session_uid'));

for i=1:1:size(ramping_binned)
    
    temp=corr([ramping_binned(i,:)',error_binned(i,:)'])
    r(i)=temp(2);
end

subplot(2,2,3)
histogram(r)

