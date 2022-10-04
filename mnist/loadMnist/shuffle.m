function [x_dataset, y_dataset] = shuffle(x_dataset,y_dataset)
      
    rng("default");
    ind = randperm(size(x_dataset,1));
    x_dataset = x_dataset(ind,:);
    y_dataset = y_dataset(ind);
end

