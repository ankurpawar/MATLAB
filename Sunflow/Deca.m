function [X,Y,Z,types] = Deca(N,M,K,a,composition)
%[X,Y,Z,type] = Deca(N,M,K,a,composition)
%this function generates Mackay - Decahedron
%N - number of atoms in the central column
%M - number of shells
%K - number of atoms on twin-boundary
%a - bonding length (distance between atoms in central column or
%                    distance between atoms along the edge of Decahedron)
%composition - chemical composition of particle i.e. ratio of two different kinds
%              of atoms (should take values between 0 and 1)
% output: X,Y,Z - vectors with atomic coordinates, types describes element
% species (1 stands for first species, 2 for second one)

%Decahedron consists of shells which surround the central atomic column
%This Decahedron is in L10-phase, it means we have alternating shells of
%two different species
%Each shell consists of pentagon rings

%Generating central column of Decahedron
xyz = [0,0,-a*(N-1)/2];                %xyz - array will contain atomic coordinates of the particle
for i=1:N-1
    xyz = [xyz;[0,0,i*a-a*(N-1)/2]];
end

for i=1:M
    %in this cycle I generate M - shells of decahedron
    if i>K-1
        xyz_ring = ring_trunc(i,i-K+1,a);
    else
        xyz_ring = ring_trunc(i,0,a);
    end
    xyz_ring(:,3) = xyz_ring(:,3) - a*((N-i)-1)/2;
    
    for j=1:N-i   %shift of rings in z-direction (along the shell)
        xyz = [xyz;xyz_ring(2:size(xyz_ring,1),:)];
        xyz_ring(:,3) = xyz_ring(:,3) + a;       %step equals to the bonding length
    end
end

for i=1:size(xyz,1)
    if rand()<composition
        types(i) = 1;
    else
        types(i) = 2;
    end
end

X = xyz(:,1);
Y = xyz(:,2);
Z = xyz(:,3);


function xyz = ring_trunc(N,K,a)
% I use this function to generate rings of Decahedron
% N - number of shell (order of ring)
% K - truncation, i.e. how many atoms are missed from both ends of one
% side of pentagon ring

b = zeros(5,3);  %array for basic vectors of Decahedron

phi = 2*pi/5;  %72°

%initialise basic vectors
for i=1:6
    b(i,:) = 0.5*sqrt(3)*[cos(phi*i),sin(phi*i),0];
end

xyz = zeros(1,3); %coordinates of atoms in the ring

%here I generate atomic coordinates along each side of pentagon ring
for j=1:5
    if K == 0        %without truncation
        for k=0:N-1
            v1 = a*N*b(j,:) + a*(b(j+1,:)-b(j,:))*k;
            xyz = [xyz;v1];
        end
    else
        for k=K:N-K    %with truncation
            v1 = a*N*b(j,:) + a*(b(j+1,:)-b(j,:))*k;
            xyz = [xyz;v1];
        end
    end
end

