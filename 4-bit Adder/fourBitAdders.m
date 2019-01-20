function [] = fourBitAdders(a,b)
    for i=1:4
        a(i)=input('Enter 1st four bit numbers:')
    end
    
    for i=1:4
        b(i)=input('Enter 2nd four bit numbers:')
    end
    
    carry=0;
    for i=4:-1:1
        sum(i)=xors(xors(a(i), b(i)), carry);
        carry=ors(ands(a(i), b(i)), ands(carry, xors(a(i),b(i))));
    end
   
    sum
    carry
    
    
    