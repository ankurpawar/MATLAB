%illusion
choice=2;
switch choice
    case 1
        vertices=[0 0 0
            2 0 0
            2 2 0
            0 2 0
            0 2 2
            2 2 2
            0 0 2
            1 0 2
            1 1 2
            2 1 2
            1 1 1
            2 1 1
            1 0 1
            2 0 1];
        faces=[1   2 3   4 4  4
            1   7 5   4 4  4
            4   5 6   3 4  4
            1   2 14 13 8  7
            7   8 9  10 6  5
            2   3 6  10 12 14
            8   9 11 13 8  8
            9  10 12 11 9  9
            11 12 14 13 11 11];
    case 2
        vertices=2*[0 0 0
            0 0 1
            1 1 1
            1 1 0
            0 5 1
            1 5 1
            0 5 0
            1 5 0
            5 0 0
            5 1 0
            4 0 1
            4 1 1
            4 0 4
            4 1 4
            5 0 5
            5 1 5];
        faces=[ 1  2  11 13 15 9  1
            6  5  7  8  8  8  8
            13 14 16 15 15 15 15
            5  6  3 12 11  2  5
            1  2  5  7  7  7  7
            3  6  8  4  4  4  4
            12 11 13 14 14 14 14
            9 10 16 15 15 15 15
            7 8   4 10  9  1 7
            4 3  12 14 16 10 4];
        
end
colmap=jet(length(vertices));
h=patch('Vertices',vertices,'Faces',faces...
    ,'FaceVertexCData',colmap...
    ,'FaceColor','flat','edgecolor',[0 0 0]);
axis off equal
%view(-90,120)
view(45,43)


%export_fig png illusion8