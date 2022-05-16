%DATA COMMUNICATION(CAECC12)
%MADE BY: TARUN KISHORE
%BRANCH: CSAI-II
%ROLL NO: 2020UCA1876
%EXPERIMENT-7: Configure and study star topology

distinct_BOUND = 5;
Z = zeros(50,2);
T = rand(1,2)*50;
Z(1,:) = T;
for i = 2:50
    T = rand(1,2)*50;
    for j = 1:i-1        
        while pdist([T;Z(j,:)],'euclidean') < distinct_BOUND
            T = rand(1,2)*50;
        end
    end
    Z(i,:) = T;
end


m = mean(Z);
d = pdist([m;Z(1,:)],'euclidean');
r = Z(1,:);
root = 1;
for i = 2:50
    if pdist([m;Z(i,:)],'euclidean') < d
        d= pdist([m;Z(i,:)],'euclidean');
        r = Z(i,:);
        root = i;
    end
end


Weight = zeros(50,50);
for i = 1:50
    for j = 1:50
        Weight(i,j) = pdist([Z(j,:) ; Z(i,:)],'euclidean');
    end
end

coverage_range = 10;
for i = 1:50
    for j = 1:50
        if  Weight(i,j) > coverage_range
            Weight(i,j) = 0;    
        end
    end
end
G = Weight;
G = sparse(G);

[dist, path, pred] = graphshortestpath(G, root);

NUM_link = length(cell2mat(path));
G_adj = zeros(50,50);
for i = 1:50
    for j = 1:50
        if G(i,j)~=0
            G_adj(i,j) = 1;
        end
    end
end
gplot(G_adj,Z);   
depth_MAX = 10;
path_mat = zeros(50, depth_MAX);
for i = 1:50
    t = cell2mat(path(i));
    t(depth_MAX)=0;
    path_mat(i,:) = t;
end
G_tree = zeros(50,50);
for i = 1:50
    for j = 1:nnz(path_mat(i,:))-1
        s = path_mat(i,j);
        t = path_mat(i,j+1);
        G_tree(s,t) = 1;
    end
end
   gplot(G_tree,Z);