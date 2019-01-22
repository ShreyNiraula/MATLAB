function [] = restoringDivision(M,Q,n)
clc
    n=input('Enter number of bits:');
    
    for i=1:n
        Q(i)= input('Enter n bits dividant:');
    end
    
    for i=1:n
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
       % left shift AQ
        for i = 1:n-1
            A(i)=A(i+1);
        end
        A(n)=Q(1);
        for i = 1:n-1
            Q(i)=Q(i+1);
        end
        % set  Q(n)= 1 initially which will be changed to 0 if A(1)==1 later on  
        Q(n)=1;

        %do A=A-M=> A=A+N (since, N=-M)
        carry=0;
        for i=n:-1:1
            [A(i), carry]= fullAdder(A(i), N(i), carry);
        end
       
        if(A(1)==1)
            % set Q(n)=0 and do A=A+M
            Q(n)=0;
            carry=0;
            for i=n:-1:1
                [A(i), carry]= fullAdder(A(i), M(i), carry);
            end
        end
 
   end
    % display reminder=A and quotient=Q
     A
     Q
end

        

