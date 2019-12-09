% Create variable p1, p2, p3, p4, p5 %
p1 = [
1 1 1
1 0 0
1 1 1
0 0 1
1 1 1
];
p1 = 2*p1-1;
p1 = reshape(transpose(p1),[],1);

p2 = [
1 1 1
1 0 0
1 1 1
1 0 1
1 1 1
];
p2 = 2*p2-1;
p2 = reshape(transpose(p2),[],1);

p3 = [
1 1 1
0 0 1
0 1 0
1 0 0
1 0 0
];
p3 = 2*p3-1;
p3 = reshape(transpose(p3),[],1);

p4 = [
1 1 1
1 0 1
1 1 1
1 0 1
1 1 1
];
p4 = 2*p4-1;
p4 = reshape(transpose(p4),[],1);

p5 = [
1 1 1
1 0 1
1 1 1
0 0 1
1 1 1
];
p5 = 2*p5-1;
p5 = reshape(transpose(p5),[],1);

% Creating Weight %
W = p1 * transpose(p1) + p2 * transpose(p2) + p3 * transpose(p3) + p4 * transpose(p4) + p5 * transpose(p5)

m1 = transpose(reshape(p1,[3 5]));
imshow(m1,'InitialMagnification','fit')
imwrite(m1,'five.jpeg','JPEG');

m2 = transpose(reshape(p2,[3 5]));
imshow(m2,'InitialMagnification','fit')
imwrite(m2,'six.jpeg','JPEG');

m3 = transpose(reshape(p3,[3 5]));
imshow(m3,'InitialMagnification','fit')
imwrite(m3,'seven.jpeg','JPEG');

m4 = transpose(reshape(p4,[3 5]));
imshow(m4,'InitialMagnification','fit')
imwrite(m4,'eight.jpeg','JPEG');

m5 = transpose(reshape(p5,[3 5]));
imshow(m5,'InitialMagnification','fit')
imwrite(m5,'nine.jpeg','JPEG');

% Save it to the file to import %

save('bobot.mat','W','p1','p2','p3','p4','p5');

% Creating some variable and image to Test %
t1 = [
0 0 0
0 0 0
1 1 1
1 0 1
1 1 1
];
t1 = 2*t1 -1;
imwrite(t1,'test-1.jpeg','JPEG');

t2 = [
1 1 1
1 0 1
1 1 1
0 0 0
0 0 0
];
t2 = 2*t2 -1;
imwrite(t2,'test-2.jpeg','JPEG');

t3 = [
1 1 1
1 0 0
1 1 1
0 0 0
0 0 0
];
t3 = 2*t3 -1;
imwrite(t3,'test-3.jpeg','JPEG');

t4 = [
1 0 1
1 0 1
1 0 1
0 0 1
0 0 1
];
t4 = 2*t4 -1;
imwrite(t4,'test-4.jpeg','JPEG');
