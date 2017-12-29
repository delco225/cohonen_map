function map = SOM_OneStepLearning ( map  , data , iter , iter_max)
% SOM_OneStepLearning : Réalise une itération de l'apprentissage d'une
% carte de Kohonen.
% Les poids sont mis à jour directement dans la structure map
% [IN]
%   map      : Structure contenant la carte de Kohonen
%   data     : Structure contenant les données  // pattern 
%   iter     : Numéro de l'itération courante
%   iter_max : Nombre maximum d'itération
% [OUT]
%   Les poids de la carte sont mis à jour dans la structure map
 i = 0 ; 
 Nta = map.learning_rate_i ; 
 Nta_end =map.learning_rate_f ; 
 delta = (Nta -Nta_end )/iter_max ; 
 
 Alpha     =  map.neighborhood_spread_i ; 
 Alpha_end =  map.neighborhood_spread_f ;
 delta_alpha = (Alpha - Alpha_end)/iter_max ; 

    
    % trouver le neurone gagnant 
    [d  n] = SOM_NearestNode ( data.pattern(iter,:) , map ) ; 
    % actualiser les poids du neurone gagnant  
    %map.weights (n,:) = map.weights (n,:) + (Alpha - (delta_alpha *iter))* (Nta - delta*iter) * (data.pattern(i,:) -  map.weights (n,:)) ;
   
    %%actualiser les poids des neurone voisin 
  

    
    for b =1 : map.n_node
       
        alpha =  closestNeigbor (map , n ,b, (Alpha - (delta_alpha*iter))) ;
     
        map.weights (b,:) = map.weights (b,:) + alpha*(Nta - delta*iter)*(data.pattern(iter,:) -  map.weights (b,:));
        
    end 
     