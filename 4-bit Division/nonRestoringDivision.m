function [] = nonRestoringDivision(M,Q,n)

    n=input('Enter number of bits:');
    for i=1:4
        Q(i)= input('Enter n bits dividant:');
    end
    for i=1:4
      M(i)= input('Enter n bits divisor:');
    end

    A(n)=zeros;
    
    %find 2's of M (ie -M) and store to N
    for i = 1:n
        N(i)=xors(1,M(i));
    end
    carry=1; 
    for i=n:-1:1
        [N(i), carry]= fullAdder(N(i), A(i), carry);
    end
    
    
   % n cycles for n-bits
   for i=1:n
       carry=0;
        
       % left shift AQ
        for i = 1:n-1
            A(i)=A(i+1);
        end
        A(n)=Q(1);
        for i = 1:n-1
            Q(i)=Q(i+1);
        end 
  
        Q(n)=0; % by default
        
        % check MSB of A
        if A(1)==0
            % do A-M = A+N
            for i=n:-1:1
                [A(i), carry]= fullAdder(A(i), N(i), carry);
            end
        else
            % do A+M
            for i=n:-1:1
                [A(i), carry]= fullAdder(A(i), M(i), carry);
            end
        end
        
        if A(1)==0
            Q(n)=1;
        end
        
   % check MSB after loop ends
   if(A(1)==1)
       % do A+M
        for i=n:-1:1
            [A(i), carry]= fullAdder(A(i), M(i), carry);
        end
   end
       
   % display reminder=A and quotient=Q
   A
   Q
end