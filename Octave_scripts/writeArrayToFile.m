function writeArrayToFile(filename, array)
    # Open file for writing
    fileID = fopen(filename, 'w');

    if fileID == -1
        error('Could not open the file for writing.');
    end

    for i = 1:length(array)
        twos_complement = mod(array(i), 2^16);  # Convert to 16-bit two's complement
        fprintf(fileID, '%04x\n', twos_complement); # Print 4-digit hex
    end

    fclose(fileID);
    fprintf('Data written to %s successfully.\n', filename);
end
