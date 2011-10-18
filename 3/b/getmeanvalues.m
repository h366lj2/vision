% get mean values

function [values] = getmeanvalues(input, means)
    values = [];
    % means is a Kx3 matrix  
    meansize = size(means);
    for i=1: meansize(1) % number of means
        values = [values; input(means(i,:))];
    end
end