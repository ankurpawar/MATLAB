%truncated Dodecahedron
phi=(1+sqrt(5))/2; %golden ratio

vert=perms([0 1/phi 2+phi,
                2+phi 0 1/phi,
                1/phi 2+phi 0,
                1/phi phi 2*phi,
                2*phi 1/phi phi,
                phi 2*phi 1/phi,
                phi 2 phi^2,
                phi^2 phi 2,
                2 phi^2 phi],'signs');
            vert=unique(vert,'rows');
face1=[ 1     3     5
     2     4     6
     7    11    17
     8    12    18
     9    13    19
    10    14    20
    15    16    23
    21    22    28
    24    29    34
    25    30    35
    26    31    36
    27    32    37
    33    39    40
    38    45    46
    41    47    51
    42    48    52
    43    49    53
    44    50    54
    55    57    59
    56    58    60];

face2=[7     3     1     2     4     8    12    16    15  11
     9    13    21    22    14    10     6     2     1  5
    31    26    19     9     5     3     7    17    24  29
     6    10    20    27    32    30    25    18     8  4
    24    17    11    15    23    33    39    47    41  34
    23    16    12    18    25    35    42    48    40  33
    36    43    49    45    38    28    21    13    19  26
    38    46    50    44    37    27    20    14    22  28
    29    34    41    51    55    57    53    43    36  31
    56    52    42    35    30    32    37    44    54  58
    47    39    40    48    52    56    60    59    55  51
    57    59    60    58    54    50    46    45    49  53];
            
edge=getEdges2({face1;face2});
%whos edge
vert(:,3)=vert(:,3)-min(vert(:,3));
for n=1:length(edge)
    p=vert(edge(n,:),:);
    line(p(:,1),p(:,2),p(:,3));
    flatVertsX=p(:,1)./(1-p(:,3));
    flatVertsY=p(:,2)./(1-p(:,3));
    line(flatVertsX,flatVertsY);
end
axis equal

