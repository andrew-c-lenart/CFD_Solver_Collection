function f = streaming(f,N)
%Used to stream the particles after the collision step
    fOld = f;

   
    for j = 2:N-1
        for i = 2:N-1
          f(2,j,i) = fOld(2,j,i-1); 
          f(3,j,i) = fOld(3,j+1,i);
          f(4,j,i) = fOld(4,j,i+1);
          f(5,j,i) = fOld(5,j-1,i);

          f(6,j,i) = fOld(6,j+1,i-1); 
          f(7,j,i) = fOld(7,j+1,i+1);
          f(8,j,i) = fOld(8,j-1,i+1);
          f(9,j,i) = fOld(9,j-1,i-1);

        end
    end


