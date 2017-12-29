function h = SOM_PlotNodes(map)
% PLOT_NODES(W) displays edges and vertices of NxN or NxNxN grid according
% to their weights W.

% we want to plot edges and weights together
hold on

% we return a handle to the plotted objects for erasure
h = [];

switch map.n_dims
    
    %
    % Carte 1D
    %
    case 1
        
    % plot edges between columns
    h = [h plot(map.weights(:,1), map.weights(:,2))];

    % plot vertices
    hh = plot(map.weights(:,1), map.weights(:,2), ...
        'ko', 'MarkerSize',7, 'MarkerFaceColor','r');

    % add vertex plot to graphics-handle array
    h = [h reshape(hh, 1, size(hh, 1))];

    % plot inside unit square
    axis([-0.6 0.6 -0.6 0.6]);
    
    %
    % Carte 2D
    %
    case 2
        
    % weights are represented as an N^2 x 2 array, but we want N x N x 2
    w = reshape(map.weights , map.n_nodesPerDim , map.n_nodesPerDim , 2) ;

    % plot edges between columns
    for i = 1:map.n_nodesPerDim
        h = [h plot(w(i,:, 1), w(i,:,2))];
    end

    % plot edges between rows
    for j = 1:map.n_nodesPerDim
        h = [h plot(w(:,j,1), w(:,j,2))];
    end

    % plot vertices
    hh = plot(w(:,:,1), w(:,:,2), ...
        'ko', 'MarkerSize',7, 'MarkerFaceColor','r');

    % add vertex plot to graphics-handle array
    h = [h reshape(hh, 1, size(hh, 1))];

    % plot inside unit square
    axis([0 1 0 1]);
    
    
    %
    % Sinon
    %
    otherwise
        
end

