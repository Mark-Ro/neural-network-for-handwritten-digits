function acc=accuracy(y,t)

    %{
    y: t_trainingsize * 10
    t: t_trainingsize * 10
    %}

    y = soft_max(y);
    [~, ind_max_y] = max(y, [], 2);
    [~, ind_max_t] = max(t, [], 2);
    correct = sum(ind_max_y == ind_max_t);
    acc = correct/length(ind_max_y);
end
