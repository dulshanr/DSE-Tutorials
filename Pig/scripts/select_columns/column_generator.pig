--macro to load file in given schema
DEFINE get_input_data(schema) returns inputfile{

    $inputfile = LOAD '$inputPath' USING PigStorage('$delimeter') AS ($schema);
};


--macro to select given columns
DEFINE select_cols(relation,columns) returns selected_columns{

    $selected_columns = foreach $relation generate $columns;
};


--load file
inputfile = get_input_data('$schema');

--filter selected columns
selected_columns= select_cols(inputfile,'$columns');

--store result to output path
STORE selected_columns INTO '$outputPath' USING PigStorage('$delimeter');


<<<<<<< HEAD

=======
>>>>>>> 66fc77b2cc830d405ffa840c9cf38c3b004ef1a9
