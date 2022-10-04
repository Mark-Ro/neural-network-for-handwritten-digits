function e = dev_cross_entropy_soft_max(y,t)
    e = soft_max(y) - t;
end

