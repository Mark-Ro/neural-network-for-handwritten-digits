function y = dev_sigmoid(x)
    z = sigmoid(x);
    y = z .* (1-z);
end