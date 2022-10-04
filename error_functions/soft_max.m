function y = soft_max(x)
    expon = exp(x);
    sum_expon = sum(expon,2);

    if expon <= realmin
        expon = realmin;
    end

    if sum_expon <= realmin
        sum_expon = realmin;
    end

    y = expon ./ sum_expon;
    
end

