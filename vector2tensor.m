function tensor = vector2tensor(vector)

[m n p q] = size(vector);

if m ~= 6
   error('Vector needs to be in the format 6xnxmxp where n,m,p can be queal to 1')
end

tensor = zeros(3,3,n,p,q);
for x = 1:n
   for y = 1:p
       for z = 1:q
           tensor(:,:,x,y,z) =   [vector(1,x,y,z) vector(4,x,y,z) vector(5,x,y,z);
                                  vector(4,x,y,z) vector(2,x,y,z) vector(6,x,y,z);
                                  vector(5,x,y,z) vector(6,x,y,z) vector(3,x,y,z)];
       end
   end
end


