function [h] = dberg_box(x,data,EdgeColor,BoxColor,width,sz)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

md = median(data);
qs = quantile(data, [0.25 0.75]);
iqr = diff(qs);
oidx = data > (1.5*iqr + max(qs)) | data < (min(qs) - 1.5*iqr);
outs = data(oidx);
notouts = data(~oidx);

h = plot([x x], [min(notouts) max(notouts)], '-', 'LineWidth',2, 'Color',EdgeColor);
hold on;
fill([x-width/2 x+width/2 x+width/2 x-width/2], [min(qs) min(qs) max(qs) max(qs)],...
    BoxColor, 'EdgeColor',EdgeColor, 'LineWidth',2, 'LineStyle','-', 'Marker','none');
plot([x-width/2 x+width/2], [md md], '-', 'LineWidth',2, 'Color',EdgeColor);

if ~isempty(outs)
    scatter(repmat(x, size(outs)), outs, sz, EdgeColor, 'o', 'LineWidth',2);
end

end

