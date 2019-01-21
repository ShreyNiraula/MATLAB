function [] = multiplierByRightShifting(m,q, n)
  
    n=input('enter number of bits:');
    for i = 1:n
        m(i)=input('Enter the n bit multiplicand:');
    end
    
    for i = 1:n
        q(i)=input('Enter the n bit multiplier:');
    end
    
    C=0;
    A(n)=zeros;
    % total of 4 cycles
    for i=1:n  
        if (q(n)==0)
            C=0;
            % just right shift CAQ
            for i = n:-1:2
                q(i)=q(i-1);
            end
            
            q(1)=A(n);
            
            for i = n:-1:2
                A(i)=A(i-1);
            end
            A(1)=C;
            
        elseif (q(n)==1)
            % A = A + m(i)
            carry=0;  % for 4 A=A+M
            for i=n:-1:1
                [A(i) , carry] = fullAdder(A(i), m(i), carry);
            end
            % make final carry = C for shifting
            C=carry;
            
            % then right shift CAQ
            for i = n:-1:2
                q(i)=q(i-1);
            end
            
            q(1)=A(n);
            
            for i = n:-1:2
                A(i)=A(i-1);
            end
            A(1)=C;
    
        end
       
    end
    % finally, display result
   A
   q
    
end
        
   
    
        
            
    
