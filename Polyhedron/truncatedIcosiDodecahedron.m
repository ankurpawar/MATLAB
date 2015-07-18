%truncated icosiDodecahedron
phi=(1+sqrt(5))/2; %golden ratio

vert=perms([1/phi 1/phi 3+phi
    2/phi phi 1+2*phi
    1/phi phi^2 -1+3*phi
    -1+2*phi 2 2+phi
    phi 3 2*phi],'signs');
vert=perms(vert,'even');

face1=[13    19     7     1
    2    14    20     8
    3    15    21     9
    4    10    22    16
    17     5    11    23
    12    24    18     6
    49    25    73    97
    26    74    98    50
    99    51    27    75
    100    76    28    52
    77    29    53   101
    78    30    54   102
    31    55   103    79
    56   104    80    32
    81    33    57   105
    82   106    58    34
    107    59    35    83
    108    60    36    84
    109    85    37    61
    62   110    86    38
    63   111    87    39
    64    40    88   112
    113    65    41    89
    42    90   114    66
    91   115    67    43
    44    92   116    68
    45    93   117    69
    46    70   118    94
    95    47    71   119
    72   120    96    48];

face2=[61    37    13     1    25    49
    2    26    50    62    38    14
    51    63    39    15     3    27
    52    28     4    16    40    64
    53    29     5    17    41    65
    6    18    42    66    54    30
    19    43    67    55    31     7
    20    44    68    56    32     8
    9    21    45    69    57    33
    10    34    58    70    46    22
    71    47    23    11    35    59
    60    72    48    24    12    36
    74    97    73    99    75    98
    110    81   105    76   100    86
    79   103    77   101    87   111
    104    78   102    85   109    80
    117    93   113    89   106    82
    114    90   107    83   115    91
    92   112    88   108    84   116
    94   118    95   119    96   120];

face3=[25     1     7    31    79   111    63    51    99  73
    8    32    80   109    61    49    97    74    26  2
    50    98    75    27     3     9    33    81   110  62
    76   105    57    69   117    82    34    10     4  28
    67   115    83    35    11     5    29    77   103  55
    68   116    84    36    12     6    30    78   104  56
    85   102    54    66   114    91    43    19    13  37
    14    38    86   100    52    64   112    92    44  20
    15    39    87   101    53    65   113    93    45  21
    40    16    22    46    94   120    72    60   108  88
    58   106    89    41    17    23    47    95   118  70
    24    48    96   119    71    59   107    90    42  18];

edge=getEdges2({face1;face2;face3});
%whos edge
for n=1:length(edge)
    p=vert(edge(n,:),:);
    line(p(:,1),p(:,2),p(:,3));
end
axis equal

