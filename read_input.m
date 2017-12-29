function jeu = read_input (filename)
% Remplit une structure contenant un jeu de donn�es (patterns) pour 
% l'apprentissage ou le test, � partir d'un fichier texte au format
% suivant :
%   Ligne 1 : Commentaire sur le jeu de donn�es
%   Ligne 2 : Dimension d'un pattern (dim_input)
%   Ligne 3 : Nombre de classes dans le jeu (n_class) : [0,n_class-1]
%   Ligne 4 : Pattern 1 = dim_input 'double' + id de la classe
%   Ligne 5 : Pattern 2 ...
% Param�tres :
%   * filename  : Nom du fichier contenant les patterns & les classes
% R�sultats :
%   * jeu : Structure contenant les caract�ristiques & patterns
%       - filename  : Nom du fichier contenant le jeu de donn�es
%       - dim_input : Dimension d'un pattern
%       - n_class   : Nombre de classes dans le jeu de patterns
%       - n_pattern : Nombre de patterns dans le jeu
%       - pattern   : Matrice des patterns (1 pattern / ligne)
%                       [n_pattern x dim_input]
%       - class     : Matrice des identifiants de classe (1 id / ligne)
%                       [n_pattern x 1]
%       - output    : Matrice des classes de chaque pattern (1 pattern / ligne)
%                       classe 1 ==> (0.0 1.0 0.0 0.0) avec n_class = 4
%                       [n_pattern x n_class]

% Structure de sortie
jeu = [] ;
jeu.filename = filename ;

%
% Lecture du fichier d'entr�e
%

% Ouverture du fichier d'entr�e
fid = fopen (filename , 'rt') ;

% Lecture d'une ligne de commentaire
comment = fgetl (fid) ;
disp (comment) ;

% Lecture des param�tres du jeu de donn�es :
%   - dimension d'un pattern
%   - nombre de classes
line = fgetl(fid) ;
jeu.dim_input = str2num(line) ;
line = fgetl(fid) ;
jeu.n_class = str2num (line) ;

% Lecture des patterns
a = fscanf (fid , '%g' , [jeu.dim_input+1 inf]) ;

% Fermeture du fichier
fclose (fid) ;

% Formatage des donn�es pour l'apprentissage et le test
jeu.n_pattern = size(a,2) ;
jeu.pattern = a(1:jeu.dim_input,:)' ;
jeu.class = a(jeu.dim_input+1,:)' ;

% Passage i_class = 1 --> (-1.0 1.0 -1.0 -1.0)
jeu.output = [] ;
for (k = 1:jeu.n_pattern)
    jeu.output = [jeu.output ; 2*((1:1:jeu.n_class)==(ones(1,jeu.n_class)*(a(jeu.dim_input+1,k)+1)))-1 ] ;
end
