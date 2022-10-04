function e = sum_of_squares(y,t)
    e = (1/2) * sum(sum((y-t).^2,2)) / size(y,1);
end
