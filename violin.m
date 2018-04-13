function [ h ] = violin( y, g, rgbFace, rgbLine, bxplt )
%Violin plot
%   Boxplot-ish, but showing distribution
if exist('rgbFace')~=1
    rgbFace = [191,129,45]/255;
end
if exist('rgbLine')~=1
    rgbLine = [0.4 0.4 0.4];
end
if exist('bxplt')~=1
    bxplt = 0;
end

gu = sort(unique(g));
n = length(gu);
ylim = [floor(min(y)) ceil(max(y))];

ybar = NaN(1,n);
for i=1:n
    ytemp = y(g == gu(i));
    ybar(i) = mean(ytemp);
end

h = plot(gu, ybar, 'k+', 'LineWidth',1.2, 'MarkerSize',3);
set(gca, 'XLim',[0 n+1], 'YLim',ylim);
hold on;

for i=1:n
    
    ytemp = y(g == gu(i));
    [f, edges] = histcounts(ytemp, 'BinMethod','sturges', 'Normalization','probability');
    
    binDif = edges(2)-edges(1);
    x = (edges(:,1:end-1)+edges(:,2:end))/2;
    x = [x(1)-binDif/2 x x(end)+binDif/2];
    f = [0 f 0] * (0.5/max(f));
    
    idx = find(f<0.005);
    idxDif = diff(idx);
    idx1 = idx(idxDif == max(idxDif));
    idx2 = idx(find(idxDif == max(idxDif))+1);

    x = x(idx1:idx2);
    f = f(idx1:idx2);
	
	fitx = min(x):(max(x)-min(x))/100:max(x);
	fitf = interp1(x,f,fitx,'spline');
    
% 	if size(rgbFace, 1)==1
% 		patch([i-f i+fliplr(f)], [x fliplr(x)], rgbFace, 'EdgeColor',rgbLine);
% 	elseif size(rgbLine, 1)==1
% 		patch([i-f i+fliplr(f)], [x fliplr(x)], rgbFace(i, :), 'EdgeColor',rgbLine);
% 	else
% 		patch([i-f i+fliplr(f)], [x fliplr(x)], rgbFace(i, :), 'EdgeColor',rgbLine(i, :));
% 	end

    if size(rgbFace, 1)==1 
		patch([i-fitf i+fliplr(fitf)], [fitx fliplr(fitx)], rgbFace, 'EdgeColor',rgbLine);
	elseif size(rgbLine, 1)==1
		patch([i-fitf i+fliplr(fitf)], [fitx fliplr(fitx)], rgbFace(i, :), 'EdgeColor',rgbLine);
	else
		patch([i-fitf i+fliplr(fitf)], [fitx fliplr(fitx)], rgbFace(i, :), 'EdgeColor',rgbLine(i, :));
    end
    
%     if bxplt==1
%         if size(rgbLine, 1)==1 
%             boxplot(y, g, 'notch','on', 'Color',rgbLine, 'Symbol','o')
%         else
%             boxplot(y, g, 'notch','on', 'Color',rgbLine, 'ColorGroup',g, 'Symbol','o')
%         end
%     end
    
    if bxplt==1
        if size(rgbLine, 1)==1 
            boxplot(y, g, 'notch','on', 'Color',[0.3 0.3 0.3], 'Symbol','o', 'Widths',0.3, 'OutlierSize',3, 'Jitter',0.5, 'Whisker',2)
        else
            boxplot(y, g, 'notch','on', 'Color',[0.3 0.3 0.3], 'ColorGroup',g, 'Symbol','o', 'Widths',0.3, 'OutlierSize',3, 'Jitter',0.5, 'Whisker',2)
        end
    end

    
%     if bxplt==1
%         if size(rgbLine, 1)==1 
%             boxplot(y, g, 'Color',[0.5 0.5 0.5], 'PlotStyle','compact')
%         else
%             boxplot(y, g, 'Color',[0.5 0.5 0.5], 'PlotStyle','compact')
%         end
%     end
% 
    
end
plot(gu, ybar, 'k+', 'LineWidth',1.5, 'MarkerSize',6)
hold off;

end

