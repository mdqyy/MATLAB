function vector = tensor2vector(tensor)

[m n p q w] = size(tensor);

if m ~= 3 || n ~= 3
   error('Vector needs to be in the format 3x3xmxnxpxq where n,m,p,q can be queal to 1')
end

vector = zeros(6,p,q,w);
for x = 1:p
   for y = 1:q
       for z = 1:w
           vector(:,x,y,z) = [squeeze(tensor(1,1,x,y,z)); 
                              squeeze(tensor(2,2,x,y,z)); 
                              squeeze(tensor(3,3,x,y,z)); 
                              squeeze(tensor(1,2,x,y,z));
                              squeeze(tensor(1,3,x,y,z));
                              squeeze(tensor(2,3,x,y,z))];
       end
   end
end
