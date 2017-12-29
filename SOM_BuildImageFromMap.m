function img = SOM_BuildImageFromMap (map)
         
         w = [] ;
         w.pattern = map.weights ;
         t = size(map.weights ) ;
         w.n_pattern = t(1,1) ;
         w.n_class =   10;
         w.dim_input    = 256; 
         
 
 t = SOM_BuildImageFromData (w);
 img = t; 