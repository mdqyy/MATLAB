function uniqueM = isunique(M)
%returns the unique combinations of M, where [a b c] is considered equal to
%[c b a] etc.
[l,v] = size(M);

index = logical(ones(l,1));


for i=1:l
    if length(unique(M(i,:))) ~= v
        index(i) = 0;
    elseif issorted(M(i,:)) ~= 1
        index(i) = 0;
    end
end

uniqueM = M(index,:);

end