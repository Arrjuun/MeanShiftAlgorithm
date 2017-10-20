clear; close all; clc;

a = randn(200,2);
b = a + 4;
c = a;
c(:,1) = 3*c(:,1);
c = c - 4;
d = [a; b];
e = [a; b; c];
plot(a(:,1),a(:,2),'+');
hold on;
plot(b(:,1),b(:,2),'o');
plot(c(:,1),c(:,2),'*');
hold off;

lambda = 2.9;
S = [a;b;c];
z=0;
while true
    mx = [];
    %for i=1:length(centroids)
    for i=1:length(S)
        num = 0;
        den = 0;
        for j=1:length(S)
            %distance = sqrt(((centroids(i,1)-S(j,1))^2) + ((centroids(i,2)-S(j,2))^2));
            distance = sqrt(((S(i,1)-S(j,1))^2) + ((S(i,2)-S(j,2))^2));
            num = num + ((kernel(distance,lambda)) .* S(j,:));
            den = den + (kernel(distance,lambda));
        end
        mx = [mx; num./den];
    end
    %centroids = unique(mx,'rows');
    if(sum(sum(S==mx)) == 1200)
        break;
    end
    S = mx;
    z = z + 1;
end
centroids = unique(S,'rows');
hold on;
plot(centroids(:,1),centroids(:,2),'o','MarkerSize',60);
plot(centroids(:,1),centroids(:,2),'x','MarkerSize',60);
hold off;