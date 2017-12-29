function alp = closestNeigbor (mat , i, j,alpha ) 

        %distance d eclude 
       y = (mat.topology(i,:) - mat.topology(j,:)) ; 
       v = y*y' ;
        %le prarametre alpha  multiplicateur 
        
        alp = alpha*exp(-v/(2*(alpha^2)));
       


