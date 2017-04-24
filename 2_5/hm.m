A1 = [
0 0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0 0;
0 0 0 1 0 0 1 1 0 0;
0 0 1 1 1 1 1 1 1 0;
0 0 1 1 1 0 0 1 0 0;
0 0 1 1 1 0 0 1 1 0;
0 0 0 1 1 1 1 1 0 0;
0 0 0 0 1 1 1 1 0 0;
0 0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0 0
];

A2 = [
0 0 0 0 0 0 0 0 0 0;
0 1 1 0 0 1 0 0 0 0;
0 1 1 1 1 1 1 0 0 0;
0 1 0 0 1 1 1 1 1 0;
0 1 0 0 1 1 1 1 1 0;
0 1 1 0 1 1 1 0 0 0;
0 1 1 1 1 0 1 0 0 0;
0 1 1 1 0 0 0 0 0 0;
0 0 0 1 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0 0
];
              
S1 = [	0 0 0; 
	2 1 2; 
	1 1 1
     ];
S2 = [	2 0 0; 
	1 1 0; 
	2 1 2
     ];
S3 = [	1 1 1; 
	1 1 1; 
	1 1 1
     ];
S4 = [	0 1 0; 
	1 1 1; 
	0 1 0
     ];
S5 = [	1 1 1; 
	1 0 1; 
	2 2 1
     ];

A=A2;
S=S5;

% HIT & MISS TRANSFORMATION -------------------------------
WS = S;
M  = zeros(10);
for i=2:9
  for j=2:9
     F=0;
     for k=1:4       
	B  = A(i-1:i+1,j-1:j+1);
	WS = rot90(WS);
	MASK = (WS!=2);
	BM  = B.*MASK;
	WSM = WS.*MASK;
	if all(all(BM==WSM))
	    M(i,j) = 1;
	endif
     endfor
  endfor
endfor
A=M;
% --------------------------------------------------------

A(2:9,2:9)