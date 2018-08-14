function [OUT, GP] = plotModes_for_figure (rel,Param, position_x_idx, title1, title2,title3, ylabel_flag)


panel_width=0.06;
panel_height=0.065;
horizontal_distance=0.085;
vertical_distance=0.10;

position_x(1)=0.05;
position_x(2)=position_x(1)+horizontal_distance;
position_x(3)=position_x(2)+horizontal_distance;
position_x(4)=position_x(3)+horizontal_distance*1.4;
position_x(5)=position_x(4)+horizontal_distance;
position_x(6)=position_x(5)+horizontal_distance;
position_x(7)=position_x(6)+horizontal_distance;
position_x(8)=position_x(7)+horizontal_distance;

position_y(1)=0.75;
position_y(2)=position_y(1)-vertical_distance;
position_y(3)=position_y(2)-vertical_distance;
position_y(4)=position_y(3)-vertical_distance;
position_y(5)=position_y(4)-vertical_distance;



mode_names = unique(fetchn(rel,'mode_type_name'))';
% mode_names = mode_names(~contains(mode_names, 'orthogonal'))
% mode_names = mode_names(contains(mode_names, 'orthogonal'))
%

mode_names = { 'Stimulus Orthog.', 'LateDelay', 'Ramping Orthog.'};
mode_names_titles = { 'Stimulus', 'Choice', 'Ramping'};

% mode_names = { 'Stimulus Orthog.', 'Left vs. baseline', 'Right vs. baseline'};
% mode_names_titles = { 'Stimulus', 'Left', 'Right'};

% mode_names = {'Stimulus','EarlyDelay','LateDelay','Ramping Orthog.'};
% mode_names_titles  = {'Stimulus ','EarlyDelay','LateDelay','Ramping'};
% mode_names_titles = mode_names;

ax_lims(1,:) = [-4,20];
ax_lims(2,:) = [-4,30];
ax_lims(3,:) = [-4,30];

% ax_lims(1,:) = [-17,7];
% ax_lims(2,:) = [-17,7];
% ax_lims(3,:) = [-17,7];

trialtype_uid = unique(fetchn(rel,'trialtype_uid'));

axes('position',[position_x(position_x_idx), position_y(1)+0.06, panel_width, panel_height*1]);
fn_plot_trial_legend (trialtype_uid);
xlim([-4 1]);
axis off;
box off;
ax=gca;
% yl=ax.YLim;
yl = ax_lims(1,:);
text (-2, (yl(1) + diff(yl)*6.5), sprintf('%s\n\n%s\n\n%s',title3,title1, title2),'Fontsize', 10,'VerticalAlignment','middle','HorizontalAlignment','center','FontWeight','bold');

for imod = 1:1:numel(mode_names)
    key_mode.mode_type_name = mode_names{imod};
    
    axes('position',[position_x(position_x_idx), position_y(imod), panel_width, panel_height]);
    hold on
    key_mode.outcome = 'hit'; ylab='';
    %     trial_type_substract='l';
    trial_type_substract=[];
    PROJ(imod) = fn_plotProjection_for_figure(Param, rel, key_mode, trial_type_substract, ylab,mode_names_titles{imod});
    %     title(sprintf('%s',mode_names_titles{imod}));
    xl=[-4 1];
    xlim(xl);
    yl = ax_lims (imod, :);
    ylim(yl);
    if ylabel_flag==1
        text ((xl(1)-diff(xl)*0.35), (yl(1) + diff(yl)*0.5), sprintf('%s\n(a.u.)',mode_names_titles{imod}),'Fontsize', 10,'Rotation',90,'VerticalAlignment','middle','HorizontalAlignment','center');
    end
    if imod==numel(mode_names)
        xlabel ('Time (s)','Fontsize', 10);
    end
    set(gca,'FontSize',10,'YTick',[0,ax_lims(imod, 2)]);
%     set(gca,'FontSize',10,'YTick',[-15, 5]);

end

