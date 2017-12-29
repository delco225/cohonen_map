function [d  n] = SOM_NearestNode (patt , map)
% SOM_Distance : Calcule les distances entre le pattern et les différents
% noeuds de la carte (dans l'espace des patterns)
% [IN]
%   patt : pattern d'entrée
%   map  : carte de Kohonen dans laquelle on recherche le neurone le
%          plus proche
% [OUT]
%   d    : distance entre le pattern et le plus proche neurone
%   n    : index du neurone le plus proche

              previous = map.weights(1 ,: )- patt ;
              value = sqrt (previous*previous') ;
              index  = 1  ;  
          for i =2 : map.n_node 
              y =  map.weights(i ,: )-patt ; 
              val = sqrt (y*y') ;
              if ( val < value )
                  index =    i ; 
                  value =  val ; 
              end
          end 
          
          d= val ; 
          n = index ; 

 