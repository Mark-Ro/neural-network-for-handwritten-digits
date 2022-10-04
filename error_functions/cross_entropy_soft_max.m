function e = cross_entropy_soft_max(y,t)
    z = soft_max(y);
    e = cross_entropy(z,t);
end