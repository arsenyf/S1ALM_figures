function [xl, yl] = figures_plotModes_2D (rel,Param, mode_names, mode_names_titles, xlabel_flag, ylabel_flag, flag_normalize_modes)


for imod = 1:1:numel(mode_names)
    key_mode.mode_type_name = mode_names{imod};
    key_mode.mode_title = mode_names_titles{imod};
    key_mode.outcome = 'hit'; 
    %     trial_type_substract='l';
    trial_type_substract=[];
    PROJ2D_hit(imod) = fn_getProjection(Param, rel, key_mode, trial_type_substract,  flag_normalize_modes);
end
if flag_normalize_modes==1
    ax_lims(1,:)=[-0.3,1];
    ax_lims(2,:) = [-0.3,1];
else
    ax_lims(1,:) = [-2,25];
    ax_lims(2,:) = [-5,25];
end


xl=ax_lims(1,:);
yl=ax_lims(2,:);
xlim(xl);
ylim(yl);
set(gca,'Xtick',xl,'Ytick',yl,'Fontsize',6);

figure_fn_plot_projection_2D (PROJ2D_hit);

if xlabel_flag==1
    text ((xl(1)+diff(xl)*0.5), (yl(1) + diff(yl)*-0.2), sprintf('%s mode\n   (a.u.)',mode_names_titles{1}),'Fontsize', 7,'HorizontalAlignment','center');
end
if ylabel_flag==1
    text ((xl(1)-diff(xl)*0.23), (yl(1) + diff(yl)*0.5), sprintf('%s mode\n   (a.u.)',mode_names_titles{2}),'Fontsize', 7,'Rotation',90,'VerticalAlignment','middle','HorizontalAlignment','center');
end
box off;