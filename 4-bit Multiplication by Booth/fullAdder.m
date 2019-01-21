function  [sum, carry]= fullAdder (a,b,c)
        sum=xors(xors(a, b), c);
        carry=ors(ands(a, b), ands(c, xors(a,b)));
end