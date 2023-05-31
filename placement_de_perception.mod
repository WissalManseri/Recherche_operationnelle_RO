/*********************************************
 * OPL 12.6.0.0 Model
 * Author: wissa
 * Creation Date: 1 mars 2023 at 13:40:31
 *********************************************/
Minimize
  sum(i in 1..n, j in 1..m) x[i][j];

Subject To
  // Chaque point dans la zone doit être couvert par au moins un capteur
  forall(j in 1..m)
    sum(i in 1..n) x[i][j] >= 1;

  // Chaque capteur ne peut être placé qu'une seule fois
  forall(i in 1..n)
    sum(j in 1..m) x[i][j] <= 1;

Bounds
  // Les variables x_i_j doivent être binaires
  forall(i in 1..n, j in 1..m)
    x[i][j] in {0, 1};
 
