
%The boundary conditions on left side are set to 1 and right side set to 0
%The Top and Bottom boundaries set to free nodes

nx= 10;
ny = 5;

V = zeros(ny,nx);

[X,Y] = meshgrid(1:nx,1:ny);

for i = 1:100
    V(:,1) = 1;
    V(:,10) = 1;

    for m = 2:9
        for n = 2:4
            V(n,m) = [V(n,m+1) + V(n,m-1) + V(n+1,m) + V(n-1,m)]/4;
        end
    end
    
    V2 = imboxfilt(V,3);
    
    [VX,VY] = gradient(V2);
    surf(X,Y,VX,VY)    
    figure(1);
    
    quiver(X,Y,VX,VY)
    figure(2);
    
    
    pause(0.017);
end