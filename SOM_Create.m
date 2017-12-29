function map = SOM_Create (N , dim , learning_rate , neighborhood_spread , size_pattern)

map =[] ; 
map.n_dims = dim ; 
map.n_nodesPerDim = N ;
map.n_node = N*N ; 
map.learning_rate_i =  learning_rate(1,1) ; 
map.learning_rate_f = learning_rate(1,2) ; 
map.neighborhood_spread_i = neighborhood_spread(1,1) ; 
map.neighborhood_spread_f = neighborhood_spread(1,2) ; 
map.weights = rand(map.n_node  ,size_pattern ) ;
if (dim == 1  )
  map.topology = zeros(map.n_node ,1 );
  for i = 1:map.n_node
      map.topology(i ,1) = i ;
  end 
else 
     map.topology = zeros(map.n_node,2);
  for i = 1:map.n_node
    
      map.topology(i ,1) = ceil(i/map.n_nodesPerDim)  ;
      if ( mod( i , map.n_nodesPerDim) == 0 )
        map.topology(i ,2) =   map.n_nodesPerDim ;
      else 
        map.topology(i ,2) =  mod( i , map.n_nodesPerDim) ; 
      end 
  end 
end 
     
    
    
end




