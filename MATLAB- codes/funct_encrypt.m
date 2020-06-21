% %% Programmer-Defined Functions
%
%
function c= funct_encrypt(i,seq,key,mode,num)
    switch i
        case 0 
            c= func_generate(mode);
        case 1
            c=eval_func_seq(seq,key,mode,num);    
    end        
end
function x= func_generate(p)
    x=rand(1,p);
    x=x*10;
    x=int32(x);
    x=mod(x,7);
end    
function num= eval_func_seq(seq,key,mode,mat)
    %seq  : indicates the function sequence
    %key  : indicates the key value to be used
    %mode : mode of operation : Encrypt[0]/Decrypt[1] 
    %key  : indicates the matrix:- values to be used
    
    n=int64(mat);
    key=int64(key);
    a=size(n,1);
    b=size(n,2);
    
    disp(seq);
    disp(key);
    disp(mode);
    
    for i=1:length(seq)
        switch seq(i)
               %1's Compliment of n
               case 0              
                   for j=1:a
                       for k=1:b 
                           n(j,k)=bitcmp(n(j,k));
                       end
                   end    
               %2's Compliment of n    
               case 1
                   for j=1:a
                       for k=1:b 
                           n(j,k)=bitcmp(n(j,k))+1;
                       end
                   end     
              %Addition of Key
              case 2                              
                    if(mode ==0)
                       n=n+key;                
                    elseif(mode ==1)    
                       n=n-key;
                    end    
              %Subtraction of Key
              case 3                           
                    if(mode ==0)
                         n=n-key;
                    elseif(mode ==1)    
                         n=n+key;
                    end
             %Multiplication of Key
              case 4
                    if(mode ==0)    
                          n=n*key;
                    elseif(mode ==1)
                          n=n/key;                
                    end    
              %XORing of Key
              case 5
                   for j=1:a
                       for k=1:b 
                           n(j,k)=bitxor(n(j,k),key);
                       end
                   end                                                  
               %XNORing of Key
               case 6
                   for j=1:a
                       for k=1:b 
                           n(j,k)=bitcmp(bitxor(n(j,k),key));
                       end
                   end                                                  
        end               
    end
    num=n;
end
%   %%%%%%