function [W, G] = subdivisionLinear2(V, F)
%function divides a triangular mesh represented by V, F
%linearly. Output vertices W are unique
%Output faces G are unique.
%      v1                   v1
%     / \                  / \
%    /   \      ->        a---c
%   /     \              / \ / \
% v2 ----- v3          v2-- b --v3
% reduced number of vertices
nV = size(V,1); %number of vertices
nF = size(F,1); %number of faces

Edges = zeros(3 * nF, 2); %assuming 3 edges on each face
edgeMid = false(3 * nF,1);

e = [0 0;0 0;0 0];
r = [0 0 0];
for n = 1 : nF
    
    %find and sort edged in a face
    if F(n,1) < F(n,2)
        e(1,1) = F(n,1);
        e(1,2) = F(n,2);
    else
        e(1,2) = F(n,1);
        e(1,1) = F(n,2);
    end
    
    if F(n,2) < F(n,3)
        e(2,1) = F(n,2);
        e(2,2) = F(n,3);
    else
        e(2,2) = F(n,2);
        e(2,1) = F(n,3);
    end
    
    if F(n,1) < F(n,3)
        e(3,1) = F(n,1);
        e(3,2) = F(n,3);
    else
        e(3,2) = F(n,1);
        e(3,1) = F(n,3);
    end
    
    %place the edge in correct place
    r = ((n-1)*3 + 1) : ((n-1)*3 + 1 + 2);
    Edges(r,:) = e;
    
end

Edges = unique(Edges,'rows');
MidPoints = (V(Edges(:,1),:) + V(Edges(:,2),:))/2; %mid points



nMidPoints = size(MidPoints, 1);

nW = nV + nMidPoints; %number of new vertices
nG = 4 * nF; %number of new faces
G = zeros(nG, 3); %new faces array
W = zeros(nW, 3); %new vertices array

W(1:nV,:) = V;
W((nV+1):(nV+nMidPoints),:) = MidPoints;


k = [1 1 1];
ind = [1 1 1];
for n = 1 : nF
    aface = F(n,:);
    %find and sort edged in a face
    if aface(1) < aface(2)
        e(1,1) = aface(1);
        e(1,2) = aface(2);
    else
        e(1,2) = aface(1);
        e(1,1) = aface(2);
    end
    
    if aface(2) < aface(3)
        e(2,1) = aface(2);
        e(2,2) = aface(3);
    else
        e(2,2) = aface(2);
        e(2,1) = aface(3);
    end
    
    if aface(1) < aface(3)
        e(3,1) = aface(1);
        e(3,2) = aface(3);
    else
        e(3,2) = aface(1);
        e(3,1) = aface(3);
    end
    
    k(1) = findaRow(Edges, e(1,:));
    k(2) = findaRow(Edges, e(2,:));
    k(3) = findaRow(Edges, e(3,:));
    
    ind(1:3) = F(n,:);
    
    G(4*(n-1)+1,1) = ind(1);
    G(4*(n-1)+1,2) = nV + k(1);
    G(4*(n-1)+1,3) = nV + k(3);
    
    G(4*(n-1)+2,1) = nV + k(1);
    G(4*(n-1)+2,2) = ind(2);
    G(4*(n-1)+2,3) = nV + k(2);
    
    G(4*(n-1)+3,1) = nV + k(2);
    G(4*(n-1)+3,2) = ind(3);
    G(4*(n-1)+3,3) = nV + k(3);
    
    G(4*(n-1)+4,1) = nV + k(1);
    G(4*(n-1)+4,2) = nV + k(2);
    G(4*(n-1)+4,3) = nV + k(3);
end
end

function k = findaRow(arr1, arr2)
%find arr2 that is row vector in another vector arr1
rows = size(arr1, 1);
k = 1;
for n = 1:rows
    if (arr1(n,1) == arr2(1)) && (arr1(n,2) == arr2(2))
        k = n;
    end
end

end