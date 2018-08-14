function [OUT, GP] = plotModes_for_figure2 (rel,Param, position_x_idx, title1, title2,title3, ylabel_flag, mode_names, mode_names_titles, y_lims)


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



% mode_names = mode_names(~contains(mode_names, 'orthogonal'))
% mode_names = mode_names(contains(mode_names, 'orthogonal'))
%

% mode_names = { 'Stimulus Orthog.', 'LateDelay', 'Ramping Orthog.'};
% mode_names_titles = { 'Stimulus', 'Choice', 'Ramping'};

% mode_names = { 'Stimulus Orthog.', 'Left vs. baseline', 'Right vs. baseline'};
% mode_names_titles = { 'Stimulus', 'Left', 'Right'};

% mode_names = {'Stimulus','EarlyDelay','LateDelay','Ramping Orthog.'};
% mode_names_titles  = {'Stimulus ','EarlyDelay','LateDelay','Ramping'};
% mode_names_titles = mode_names;
%
% y_lims(1,:) = [-4,20];
% y_lims(2,:) = [-4,30];
% y_lims(3,:) = [-4,30];

% y_lims(1,:) = [-17,7];
% y_lims(2,:) = [-17,7];
% y_lims(3,:) = [-17,7];

trialtype_uid = unique(fetchn(rel,'trialtype_uid'));

% axes('position',[position_x(position_x_idx), position_y(1)+panel_height, panel_width, panel_height]);
% fn_plot_trial_legend (trialtype_uid);
% xlim([-4 1]);
% axis off;
% box off;
% ax=gca;
% % yl=ax.YLim;
% yl = y_lims(1,:);

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
    %     yl = yx_lims (imod, :);
    yl = y_lims ;
    ylim(yl);
    if ylabel_flag==1
        text ((xl(1)-diff(xl)*0.35), (yl(1) + diff(yl)*0.5), sprintf('%s\n(a.u.)',mode_names_titles{imod}),'Fontsize', 10,'Rotation',90,'VerticalAlignment','middle','HorizontalAlignment','center');
    end
    if imod==numel(mode_names)
        xlabel ('Time (s)','Fontsize', 10);
    end
    set(gca,'FontSize',10,'YTick',[0,y_lims(2)]);
    text(-1.8,y_lims(2)*1.1,'Delay','FontSize',9);
    
    %     set(gca,'FontSize',10,'YTick',[0,ax_lims(imod, 2)]);
    %     set(gca,'FontSize',10,'YTick',[-15, 5]);
    
end
text (-2, (yl(2) + diff(yl)*0.6), sprintf('%s\n%s\n%s',title3,title1, title2),'Fontsize', 10,'HorizontalAlignment','center','FontWeight','bold');

