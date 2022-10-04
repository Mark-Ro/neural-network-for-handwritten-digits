function e=cross_entropy(y,t)
    y(y <= 0) = realmin;
    e=sum(-sum(t .* log(y),2)) / size(y,1);
end
