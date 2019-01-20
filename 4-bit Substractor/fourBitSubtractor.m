function [] = fourBitSubtractor(a,b)
    for i=1:4
        a(i)=input('Enter 1st four bit numbers:')
    end
    
    for i=1:4
        b(i)=input('Enter 2nd four bit numbers:')
    end
    
    % getting 1's complements of 2nd input(b)
    for i=1:4
        b(i)=xors(1,b(i))
    end
        
    % carry=1 to get 2's complement from 1's of b
    carry=1; 
    for i=4:-1:1
        difference(i)=xors(xors(a(i), b(i)), carry);
        carry=ors(ands(a(i), b(i)), ands(carry, xors(a(i),b(i))));
    end
    
    
    if(carry==0)
        %again take 2's complementof sum(-ve case)
        % for 2's, 1st take 1's of sum
        for i=1:4
            b(i)=xors(1,difference(i))
            % make a=0000 by complementing with itself
            a(i)=xors(a(i),a(i)) 
        end        
        carry=1; 
   
        for i=4:-1:1
            % sum between b(i)=xors(1,difference(i)), a=0000 and carry=0001
            difference(i)=xors(xors(a(i), b(i)), carry);
            carry=ors(ands(a(i), b(i)), ands(carry, xors(a(i),b(i))));
        end
    end
    % borrow is opposite of carry that is generated during 2's complements
    borrow=xors(carry,1)
    
    difference
    % plotting
    subplot(3,1,1)
    stem(a,'r')
    subplot(3,1,2)
    stem(b,'b')
    subplot(3,1,3)
    stem(difference,'g')
    borrow
    
    
    
    
        
        
        