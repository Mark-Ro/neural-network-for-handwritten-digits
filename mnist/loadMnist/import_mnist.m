function [x_trainingset, t_trainingset, x_validationset, t_validationset, x_testset, t_testset] = import_mnist(trainingset_size, validationset_size, testset_size)
    
    %{
    Questa funzione si occupa di caricare il dataset mnist contenuto nella directory mnist. Nello specifico, viene diviso il dataset in tre parti: 
    training set, validation set e test set, mantenendo una distribuzione
    bilanciata dei dati nei tre sottoinsiemi.
    %}

    x = loadMNISTImages('mnist/train-images-idx3-ubyte');
    y = loadMNISTLabels('mnist/train-labels-idx1-ubyte');

    %{
    x: 196 x 60 000
    y: 60 000 x 1
    %}

    x = x'; %Si effettua la trasposta per ragioni di comodità di stampa

    %x : 60 000 x 196

    x_length = size(x,1);

    dataset_length = trainingset_size + validationset_size + testset_size;

    if (dataset_length > x_length)
         error("Dimensione del dataset superata");
    end
    
    %Si calcolano le percentuali dei sottoinsiemi rispetto al dataset ridimensionato dall'utente

    dataset_percentage = dataset_length / x_length;

    training_percentage = (trainingset_size / dataset_length) * dataset_percentage;
    validation_percentage = (validationset_size / dataset_length) * dataset_percentage;
    test_percentage = (testset_size / dataset_length) * dataset_percentage;
    
    

    labels = unique(y); % Vengono mantenuti tutti i possibili valori di y (nel nostro caso 10)
    
    %In questi vettori si conservano gli indici del dataset originale da distribuire tra training set, validation set e test set
    training_indexes = [];
    validation_indexes = [];
    test_indexes = [];
    

    %Divisione bilanciata dei dati del dataset tra training set, validation set e test set
    for i = 1 : length(labels)
        current_label = labels(i);
        current_indexes = find(y == current_label);
        current_indexes_size = length(current_indexes);
        N_training = floor(training_percentage * current_indexes_size);
        N_validation = floor(validation_percentage * current_indexes_size);
        N_test = floor(test_percentage * current_indexes_size);
        training_indexes = [training_indexes; current_indexes(1 : N_training)];
        end_validation = N_training + 1 + N_validation;
        validation_indexes = [validation_indexes; current_indexes(N_training + 1 : end_validation)];
        end_test = end_validation + N_test + 1;
        test_indexes = [test_indexes; current_indexes(end_validation + 1 : end_test)];
    end
    
    x_trainingset = x(training_indexes, :);
    y_trainingset = y(training_indexes);

    x_validationset = x(validation_indexes, :);
    y_validationset = y(validation_indexes);

    x_testset = x(test_indexes, :);
    y_testset = y(test_indexes);
    

    [x_trainingset,y_trainingset] = shuffle(x_trainingset,y_trainingset);
    t_trainingset = get_targets_from_labels(y_trainingset)'; %codifica one-hot

    [x_validationset,y_validationset] = shuffle(x_validationset,y_validationset);
    t_validationset = get_targets_from_labels(y_validationset)';

    [x_testset,y_testset] = shuffle(x_testset,y_testset);
    t_testset = get_targets_from_labels(y_testset)';

    %{
    Tali variabili contengono un intorno di tali risultati per la questione del bilanciamento
    x_trainingset: trainingset_size x 196
    t_trainingset: trainingset_size x 10
    %}

end

