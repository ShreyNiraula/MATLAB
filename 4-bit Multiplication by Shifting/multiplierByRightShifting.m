function [] = multiplierByRightShifting(M,Q,n)
  
    n=input('enter number of bits:');
    for i = 1:n
        M(i)=input('Enter the n bit multiplicand:');
    end
    for i = 1:n
        Q(i)=input('Enter the n bit multiplier:');
    end
    
    A(n)=zeros;

    % total of n cycles for n-bits
    for i=1:n  
      C=0;
	% check for LSB of Q  
        if (Q(n)==1)
            % perform A = A + M(i)
            carry=0; % internal carry for A=A+M 
            for i=n:-1:1
                [A(i) , carry] = fullAdder(A(i), M(i), carry);
            end
            % make final carry = C for shifting
            C=carry;
        end
        
        %  right shift CAQ
        for i = n:-1:2
            Q(i)=Q(i-1);
        end

        Q(1)=A(n);

        for i = n:-1:2
            A(i)=A(i-1);
        end
        A(1)=C;
       
    end
    % finally, display result
   A
   Q
    
end