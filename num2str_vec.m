function cell_str = num2str_vec(array_num)
    %array_num: Vector of doubles
    %cell_str: str cell with num2str performed on all numbers in vector
    cell_str = strtrim(cellstr(num2str(array_num'))');
end
