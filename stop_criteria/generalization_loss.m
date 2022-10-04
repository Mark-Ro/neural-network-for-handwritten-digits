function GL = generalization_loss(current_epoch, validation_error, minimum_error)
    GL = 100 * (validation_error(current_epoch) / minimum_error -1);
end
