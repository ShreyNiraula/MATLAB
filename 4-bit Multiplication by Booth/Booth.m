function [] = Booth(M,Q,n)
    
    n= input('enter number of bits:');
    % initialize as 0 
    M(n+1)=zeros;
    A(n+1)=zeros;
    Q(n+1)=zeros;
    
    % 2 to n+1 so that 1st element at index 1 will be made 0
    for i = 2:n+1
        M(i)=input('Enter the n bit multiplicand:');
    end
    
    for i = 2:n+1
        Q(i)=input('Enter the n bit multiplier:');
    end
    
    
    M(1)=0;
    Q(1)=0;
    q=0;
    
    %find 2's of M and store to N
    for i = 1:n+1
        N(i)=xors(1,M(i));
    end
    
    carry=1; 
   
    for i=n+1:-1:1
        [N(i), carry]= fullAdder(N(i), A(i), carry);
    end
    
    % takes n+1 cycles for n-bits
    for i=1:n+1
        if((Q(n+1)==0 && q==0)||(Q(n+1)==1 && q==1))
            % just arithmetic shift right of AQq
            q=Q(n+1);
            for i = n+1:-1:2
                Q(i)=Q(i-1);
            end

            Q(1)=A(n+1);
            
            for i = n+1:-1:2
            A(i)=A(i-1);
            end
           % retain A(1)= MSB as it is 
        
        
        elseif((Q(n+1)==1 && q==0))
            % do A=A-M => A=A+N (as, N=-M)
            carry=0; % internal carry for A=A+N(i)
            for i=n+1:-1:1
                [A(i) , carry] = fullAdder(A(i), N(i), carry);
            end
            
            % now ASR
            q=Q(n+1);
            for i = n+1:-1:2
                Q(i)=Q(i-1);
            end

            Q(1)=A(n+1);
            
            for i = n+1:-1:2
            A(i)=A(i-1);
            end
           % retain A(1)= MSB as it is
           
        elseif((Q(n+1)==0 && q==1))
            % do A=A+M 
            carry=0; % internal carry for A=A+M(i)
            for i=n+1:-1:1
                [A(i) , carry] = fullAdder(A(i), M(i), carry);
            end
            
            % now ASR
            q=Q(n+1);
            for i = n+1:-1:2
                Q(i)=Q(i-1);
            end

            Q(1)=A(n+1);
            
            for i = n+1:-1:2
            A(i)=A(i-1);
            end
           % retain A(1)= MSB as it is
            
        end
    end
    % at last, check if MSB of AQ=1, if 1, -ve result, so 2's complements
    if(A(1)==1)
        %do 2's of AQ
        M(n+1)=zeros;  % M no longer used, reset to 0
        for i = 1:n+1
        A(i)=xors(1,A(i));
        Q(i)=xors(1,Q(i));
        end

        carryA=1; 
        carryQ=1;

        for i=n+1:-1:1
            [A(i), carry]= fullAdder(M(i), A(i), carryA);
            [Q(i), carry]= fullAdder(M(i), Q(i), carryQ);
        end
    end
    A
    Q
        
        
    
    
    
    
    
    