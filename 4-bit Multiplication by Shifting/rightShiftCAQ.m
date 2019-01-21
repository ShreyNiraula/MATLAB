function [C,A,Q] = rightShiftCAQ (c,a,q,n)
    Q(n)=zeros;
    A(n)=zeros;
    for i = n:-1:2
        Q(i)=q(i-1);
    end
            
    Q(1)=a(n);
            
    for i = n:-1:2
        A(i)=a(i-1);
    end
    a(1)=c;
    
end


