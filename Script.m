%
% Script
%
data = read_input('data/set2.txt') ; 

%Base de patterns carree
%pat = [] ; 
%pat.filename ='' ; 
%pat.dim_input = 2 ; 
%pat.n_class = 0 ; 
%pat.n_pattern = 1000 ; 
%pat.pattern = 0.5*rand(pat.n_pattern ,pat.dim_input)+0.25*ones(pat.n_pattern ,pat.dim_input) ;
%pat.class =  zeros (1, pat.n_pattern); 
%data = pat ;

%pat = [] ; 
%pat.filename ='' ; 
%pat.dim_input = 2 ; 
%pat.n_class = 0 ; 
%pat.n_pattern = 1000 ; 
%pat.pattern = zeros (pat.n_pattern ,pat.dim_input) ;
%for i = 1:pat.n_pattern  
%    teta=2*pi*rand() ;
%    r   =0.5*rand() ;
%    pat.pattern(i,1) = r*cos(teta) ;
%    pat.pattern(i,2) = r*sin (teta) ; 
%end 
%pat.class =  zeros (1, pat.n_pattern); 
%data = pat ;


% Création d'une carte de Kohonen
N                   = 10;
learning_rate       = [0.5 0.1] ;       % Initial et final
neighborhood_spread = [3e0 1.0e-1] ;  % Initial et final
size_pattern        = data.dim_input ;
map = SOM_Create2D (N , learning_rate , neighborhood_spread , size_pattern) ;


% Nettoyage de l'affichage
clf ;

% Initialisation du premier affichage
hold on ;
SOM_PlotPatterns(data.pattern) ;
h = SOM_PlotNodes(map) ;
title('T = 0.  Cliquer pour commencer ...')
waitforbuttonpress ;
figure(1) ;


% Lancement de l'apprentissage sur un certain nombre d'itération %
iter_max = 100 ;

% Mise à jour de la carte pour chaque itération
for iter = 1:iter_max
    
    % Mise à jour de la carte
    map = SOM_OneStepLearning (map , data , iter , iter_max) ;
    
    % Affichage des poids des neurones  
    if iter <= iter_max
        delete(h) ;
    end
    h = SOM_PlotNodes(map) ;
    title(sprintf('T = %d', iter)) ;
    drawnow ;
   
end


