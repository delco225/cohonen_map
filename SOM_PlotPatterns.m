function SOM_PlotPatterns (patt)
% SOM_PlotPattern affiche des patterns à 2 dimensions dans un repère 
% unitaire
% [IN]
%   patt : Matrice [n_pattern x 2] de patterns (1 ligne = 1 pattern)


% Affichage effectif avec un marqueur simple
plot(patt(:,1), patt(:,2), '.', 'MarkerSize', 5,'Color',[0,1,0])
axis([0 1 0 1])
axis square


