disp('Size of L1r : ');disp(size(L1r));
disp('Size of Encrypted Matrix : ');disp(size(temp));
temp1=temp;
for i=1:size(temp,1)
    for j=1:size(temp,2)
        p=[temp(i,j),f,keyr,1];
        n=funct_encrypt(1,p);
        temp1(i,j)=n;
    end
end    
disp('Size of Encrypted Matrix : ');disp(size(temp));
disp('Size of Decrypted Matrix : ');disp(size(temp1));
if(L1r == temp1)
    disp('Exp Successful');
else
    disp('Exp Un-Successful');
end    

disp('Size of L1b : ');disp(size(L1b));
disp('Size of Encrypted Matrix : ');disp(size(temp));
temp1=temp;
for i=1:size(temp,1)
    for j=1:size(temp,2)
        p=[temp(i,j),f,keyb,1];
        n=funct_encrypt(1,p);
        temp1(i,j)=n;
    end
end    
disp('Size of Encrypted Matrix : ');disp(size(temp));
disp('Size of Decrypted Matrix : ');disp(size(temp1));
if(L1b == temp1)
    disp('Exp Successful');
else
    disp('Exp Un-Successful');
end

disp('Size of L1g : ');disp(size(L1g));
disp('Size of Encrypted Matrix : ');disp(size(temp));
temp1=temp;
for i=1:size(temp,1)
    for j=1:size(temp,2)
        p=[temp(i,j),f,keyg,1];
        n=funct_encrypt(1,p);
        temp1(i,j)=n;
    end
end    
disp('Size of Encrypted Matrix : ');disp(size(temp));
disp('Size of Decrypted Matrix : ');disp(size(temp1));
if(L1g == temp1)
    disp('Exp Successful');
else
    disp('Exp Un-Successful');
end

%Generating and Saving Individual Share : RED
figure;
%just_red = cat(3, L1r, ones(size(L1g)), ones(size(L1b)));
%imshow(cat(3, L1r, ones(size(L1g)), ones(size(L1b))));
imshow(L1r);
title('Red Share');
saveas(gcf,'Share1.png');
%Generating and Saving Individual Share : BLUE
figure;
%just_blue = cat(3, ones(size(L1r)), L1g, ones(size(L1b)));
%imshow(cat(3, ones(size(L1r)), L1g, ones(size(L1b))));
imshow(L1b);
title('Blue Share');
saveas(gcf,'Share2.png');
%Generating and Saving Individual Share : GREEN
figure;
imshow(L1g);
title('Green Share');
%just_green = cat(3, ones(size(L1r)), ones(size(L1g)), L1b);
%imshow(cat(3, ones(size(L1r)), ones(size(L1g)), L1b));
saveas(gcf,'Share3.png');


figure;
imshow(cat(3,L1r,L1g,L1b));
%Generating Fused Shares : RG and GB
figure;
RG=cat(2,L1r,L1g);
imshow(RG);
    disp(size(RG));
    
figure;
RB=cat(2,L1r,L1b);
imshow(RB);
title('Red-Blue Fused Shares');
    disp(size(RB));
    
figure;
GB=cat(2,L1g,L1b);
imshow(GB);
title('Green-Blue Fused Share');
    disp(size(GB));
%Recovering orignal image
%Splitting RB share into two matrix
red=RB(:,1:256);
blue=RB(:,257:512);
    %displaying Matrix dimensions of 'red' and 'blue' shares
    disp(size(red));
    disp(size(blue));
%Splitting GB share into two matrix
green=GB(:,1:256);
blue=GB(:,257:512);
    %displaying Matrix dimensions of 'green' and 'blue' shares
    disp(size(green));
    disp(size(blue));
%Combining the three dimensions to form Orignal image
figure;
RGB=cat(3,red,green,blue);
disp(size(RGB));
%RGB=imfuse(RGB,GB);
%disp(RGB);
%disp(max(RGB(:,1)));
%disp(min(RGB));
imshow(RGB);
saveas(gcf,'original.png');

%kn_encrypt(k,n,encrypted_im);