function Sup_Decoder_Stability() % MATLAB R2017a
close all;

dir_root = 'Z:\users\Arseny\Projects\SensoryInput\SiProbeRecording\'
dir_embeded_graphics = 'Z:\users\Arseny\Projects\SensoryInput\SiProbeRecording\Graphic_for_figures\'
dir_save_figure = [dir_root 'Results\figures\v2\'];
filename = 'Sup_Decoder_Stability';


%Graphics
%---------------------------------
figure;
set(gcf,'DefaultAxesFontName','helvetica');
set(gcf,'PaperUnits','centimeters','PaperPosition',[0.5 7 23 25]);
set(gcf,'PaperOrientation','portrait');
set(gcf,'Units','centimeters','Position',get(gcf,'paperPosition')+[3 -10 0 0]);


panel_width2=0.055;
panel_height2=0.06;
horizontal_distance2=0.07;
vertical_distance2=0.11;


position_x2(1)=0.05;
position_x2(2)=position_x2(1)+horizontal_distance2;
position_x2(3)=position_x2(2)+horizontal_distance2;
position_x2(4)=position_x2(3)+horizontal_distance2;
position_x2(5)=position_x2(4)+horizontal_distance2;
position_x2(6)=position_x2(5)+horizontal_distance2;
position_x2(7)=position_x2(6)+horizontal_distance2*0.6;

position_y2(1)=0.7;
position_y2(2)=position_y2(1)-vertical_distance2;
position_y2(3)=position_y2(2)-vertical_distance2;

Param = struct2table(fetch (ANL.Parameters,'*'));



%% Recording locations
axes('position', [position_x2(1) position_y2(1) 0.06 0.06]); hold on ;
xl = [0 134];
yl = [0 135];
fig1_a = imread([dir_embeded_graphics 'left_vS1.jpg']);
fig1_a=flipdim(fig1_a,1);
imagesc(fig1_a);
set(gca,'Xlim',xl,'Ylim',yl);
text(xl(1)-diff(xl)/3.2, yl(1)+diff(yl)*1.15, 'a', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
text(xl(1)+diff(xl)*0.5, yl(1)+diff(yl)*1.1,'vS1 left','FontSize',7,'FontWeight','bold','Color',[0.5 0.5 0.5],'HorizontalAlignment','center');
axis off;
axis tight;
axis equal;

axes('position', [position_x2(1) position_y2(2) 0.06 0.06]); hold on ;
xl = [0 121];
yl = [0 115];
fig1_a = imread([dir_embeded_graphics 'left_ALM.jpg']);
fig1_a=flipdim(fig1_a,1);
imagesc(fig1_a);
set(gca,'Xlim',xl,'Ylim',yl);
text(xl(1)-diff(xl)/3.2, yl(1)+diff(yl)*1.15, 'b', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
text(xl(1)+diff(xl)*0.5, yl(1)+diff(yl)*1.1,'ALM left','FontSize',7,'FontWeight','bold','Color',[1 0 1],'HorizontalAlignment','center');
axis off;
axis tight;
axis equal;

axes('position', [position_x2(1) position_y2(3) 0.06 0.06]); hold on ;
xl = [0 152];
yl = [0 116];
fig1_a = imread([dir_embeded_graphics 'right_ALM.jpg']);
fig1_a=flipdim(fig1_a,1);
imagesc(fig1_a);
set(gca,'Xlim',xl,'Ylim',yl);
text(xl(1)-diff(xl)/3.2, yl(1)+diff(yl)*1.15, 'c', ...
    'fontsize', 12, 'fontname', 'helvetica', 'fontweight', 'bold');
text(xl(1)+diff(xl)*0.5, yl(1)+diff(yl)*1.1,'ALM right','FontSize',7,'FontWeight','bold','Color',[0.75 0.75 0],'HorizontalAlignment','center');
axis off;
axis tight;
axis equal;

%% SVM Decoder Time - vS1
key=[]; k=[];
key.flag_include_distractor_trials=1;
rel=ANL.SVMdecoderTime * ANL.SessionPosition * EXP.SessionTraining ;
t = fetch1(rel,'time_vector_svm', 'LIMIT 1');
% key.training_type ='regular';

key.brain_area = 'vS1';
key.hemisphere = 'left';
key.sensory_or_motor = '';
label_flag=1;
last_label=0;
c_lims=[50 100];
axes('position',[position_x2(2)+0.03, position_y2(1), panel_width2, panel_height2]);
svm_performance_mat = (fetchn(rel & key,'svm_performance_mean_time_mat'));
time_mat=[];
for i=1:1:size(svm_performance_mat,1)
    time_mat(i,:,:)=svm_performance_mat{i};
end
time_mat = 100*squeeze(mean(time_mat,1));
figure_plot_svm_time_rotation(t, time_mat, position_x2(2)+0.03, position_y2(1), panel_width2, panel_height2, label_flag, c_lims, last_label, key);
% freezeColors;


key=[]; k=[];
key.flag_include_distractor_trials=1;
rel=ANL.SVMdecoderSensoryMotorTime * ANL.SessionPosition * EXP.SessionTraining ;
t = fetch1(rel,'time_vector_svm', 'LIMIT 1');
% key.training_type ='regular';
key.brain_area = 'vS1';
key.hemisphere = 'left';
key.sensory_or_motor = 'sensory';
label_flag=0;
last_label=0;
c_lims=[50 100];
axes('position',[position_x2(3)+0.035, position_y2(1), panel_width2, panel_height2]);
svm_performance_mat = (fetchn(rel & key,'svm_performance_mean_time_mat'));
time_mat=[];
for i=1:1:size(svm_performance_mat,1)
    time_mat(i,:,:)=svm_performance_mat{i};
end
time_mat = 100*squeeze(mean(time_mat,1));
figure_plot_svm_time_rotation(t, time_mat, position_x2(3)+0.035, position_y2(1), panel_width2, panel_height2, label_flag, c_lims, last_label, key);
% freezeColors;

key.sensory_or_motor = 'motor';
label_flag=0;
last_label=1;
c_lims=[50 75];
axes('position',[position_x2(4)+0.04, position_y2(1), panel_width2, panel_height2]);
svm_performance_mat = (fetchn(rel & key,'svm_performance_mean_time_mat'));
time_mat=[];
for i=1:1:size(svm_performance_mat,1)
    time_mat(i,:,:)=svm_performance_mat{i};
end
time_mat = 100*squeeze(mean(time_mat,1));
figure_plot_svm_time_rotation(t, time_mat, position_x2(4)+0.04, position_y2(1), panel_width2, panel_height2, label_flag, c_lims, last_label, key);

%% SVM Decoder Time - Left ALM
key=[]; k=[];
key.flag_include_distractor_trials=1;
rel=ANL.SVMdecoderTime * ANL.SessionPosition * EXP.SessionTraining ;
t = fetch1(rel,'time_vector_svm', 'LIMIT 1');
% key.training_type ='regular';

key.brain_area = 'ALM';
key.hemisphere = 'left';
key.sensory_or_motor = '';
label_flag=1;
last_label=0;
c_lims=[50 100];
axes('position',[position_x2(2)+0.03, position_y2(2), panel_width2, panel_height2]);
svm_performance_mat = (fetchn(rel & key,'svm_performance_mean_time_mat'));
time_mat=[];
for i=1:1:size(svm_performance_mat,1)
    time_mat(i,:,:)=svm_performance_mat{i};
end
time_mat = 100*squeeze(mean(time_mat,1));
figure_plot_svm_time_rotation(t, time_mat, position_x2(2)+0.03, position_y2(2), panel_width2, panel_height2, label_flag, c_lims, last_label, key);
% freezeColors;


key=[]; k=[];
key.flag_include_distractor_trials=1;
rel=ANL.SVMdecoderSensoryMotorTime * ANL.SessionPosition * EXP.SessionTraining ;
t = fetch1(rel,'time_vector_svm', 'LIMIT 1');
% key.training_type ='regular';
key.brain_area = 'ALM';
key.hemisphere = 'left';
key.sensory_or_motor = 'sensory';
label_flag=0;
last_label=0;
c_lims=[50 75];
axes('position',[position_x2(3)+0.035, position_y2(2), panel_width2, panel_height2]);
svm_performance_mat = (fetchn(rel & key,'svm_performance_mean_time_mat'));
time_mat=[];
for i=1:1:size(svm_performance_mat,1)
    time_mat(i,:,:)=svm_performance_mat{i};
end
time_mat = 100*squeeze(mean(time_mat,1));
figure_plot_svm_time_rotation(t, time_mat, position_x2(3)+0.035, position_y2(2), panel_width2, panel_height2, label_flag, c_lims, last_label, key);
% freezeColors;

key.sensory_or_motor = 'motor';
label_flag=0;
last_label=1;
c_lims=[50 90];
axes('position',[position_x2(4)+0.04, position_y2(2), panel_width2, panel_height2]);
svm_performance_mat = (fetchn(rel & key,'svm_performance_mean_time_mat'));
time_mat=[];
for i=1:1:size(svm_performance_mat,1)
    time_mat(i,:,:)=svm_performance_mat{i};
end
time_mat = 100*squeeze(mean(time_mat,1));
figure_plot_svm_time_rotation(t, time_mat, position_x2(4)+0.04, position_y2(2), panel_width2, panel_height2, label_flag, c_lims, last_label, key);
% freezeColors;


%% SVM Decoder Time - Right ALM
key=[]; k=[];
key.flag_include_distractor_trials=1;
rel=ANL.SVMdecoderTime * ANL.SessionPosition * EXP.SessionTraining ;
t = fetch1(rel,'time_vector_svm', 'LIMIT 1');
% key.training_type ='regular';

key.brain_area = 'ALM';
key.hemisphere = 'right';
key.sensory_or_motor = '';
label_flag=1;
last_label=0;
c_lims=[50 100];
axes('position',[position_x2(2)+0.03, position_y2(3), panel_width2, panel_height2]);
svm_performance_mat = (fetchn(rel & key,'svm_performance_mean_time_mat'));
time_mat=[];
for i=1:1:size(svm_performance_mat,1)
    time_mat(i,:,:)=svm_performance_mat{i};
end
time_mat = 100*squeeze(mean(time_mat,1));
figure_plot_svm_time_rotation(t, time_mat, position_x2(2)+0.03, position_y2(3), panel_width2, panel_height2, label_flag, c_lims, last_label, key);
% freezeColors;


key=[]; k=[];
key.flag_include_distractor_trials=1;
rel=ANL.SVMdecoderSensoryMotorTime * ANL.SessionPosition * EXP.SessionTraining ;
t = fetch1(rel,'time_vector_svm', 'LIMIT 1');
% key.training_type ='regular';
key.brain_area = 'ALM';
key.hemisphere = 'right';
key.sensory_or_motor = 'sensory';
label_flag=0;
last_label=0;
c_lims=[50 75];
axes('position',[position_x2(3)+0.035, position_y2(3), panel_width2, panel_height2]);
svm_performance_mat = (fetchn(rel & key,'svm_performance_mean_time_mat'));
time_mat=[];
for i=1:1:size(svm_performance_mat,1)
    time_mat(i,:,:)=svm_performance_mat{i};
end
time_mat = 100*squeeze(mean(time_mat,1));
figure_plot_svm_time_rotation(t, time_mat, position_x2(3)+0.035, position_y2(3), panel_width2, panel_height2, label_flag, c_lims, last_label, key);
% freezeColors;

key.sensory_or_motor = 'motor';
label_flag=0;
last_label=1;
c_lims=[50 90];
axes('position',[position_x2(4)+0.04, position_y2(3), panel_width2, panel_height2]);
svm_performance_mat = (fetchn(rel & key,'svm_performance_mean_time_mat'));
time_mat=[];
for i=1:1:size(svm_performance_mat,1)
    time_mat(i,:,:)=svm_performance_mat{i};
end
time_mat = 100*squeeze(mean(time_mat,1));
figure_plot_svm_time_rotation(t, time_mat, position_x2(4)+0.04, position_y2(3), panel_width2, panel_height2, label_flag, c_lims, last_label, key);
% freezeColors;

if isempty(dir(dir_save_figure))
    mkdir (dir_save_figure)
end
figure_name_out=[ dir_save_figure filename];
eval(['print ', figure_name_out, ' -dtiff -cmyk -r300']);
eval(['print ', figure_name_out, ' -painters -dpdf -cmyk -r200']);


end




