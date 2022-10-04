function PQ = progress(current_epoch, training_error, validation_error, minimum_error, strip)
    PQ = 0;
    if mod(current_epoch, strip) == 0
        Pk = 1000 * (sum(training_error(current_epoch - (strip - 1) : current_epoch)) / (strip * min(training_error(current_epoch - (strip - 1) : current_epoch))) - 1);
        PQ = generalization_loss(current_epoch, validation_error, minimum_error) / Pk;
    end
end

