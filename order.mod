/*********************************************
 * OPL 12.6.0.0 Model
 * Author: wissa
 * Creation Date: 8 mars 2023 at 10:36:14
 *********************************************/
range planes = 1..10; 
range times = 1..744;

// Données
int H_min[planes]     =  [129, 195, 89, 96, 110, 120, 124, 126, 135, 160];
int H_max[planes]     =  [559, 744, 510, 521, 555, 576, 577, 573, 591, 657];
//int H[planes][times]  =  [155, 258, 98, 106, 123, 135, 138, 140, 150, 180];
int P_avance[planes]  =  [10, 10, 30, 30, 30, 30, 30, 30, 30, 30];
int P_retard[planes]  =  [10, 10, 30, 30, 30, 30, 30, 30, 30, 30];
int T[planes][planes] =  [ [0, 3, 15, 15, 15, 15, 15, 15, 15, 15],
  						   [3, 0, 15, 15, 15, 15, 15, 15, 15, 15],
						   [15, 15, 0, 8, 8, 8, 8, 8, 8, 8],
						   [15, 15, 8, 0, 8, 8, 8, 8, 8, 8],
						   [15, 15, 8, 8, 0, 8, 8, 8, 8, 8],
						   [15, 15, 8, 8, 8, 0, 8, 8, 8, 8],
						   [15, 15, 8, 8, 8, 8, 0, 8, 8, 8],
						   [15, 15, 8, 8, 8, 8, 8, 0, 8, 8],
						   [15, 15, 8, 8, 8, 8, 8, 8, 0, 8],
						   [15, 15, 8, 8, 8, 8, 8, 8, 8, 0]];

// Variables de décision
dvar boolean x[planes][times];
dvar int H[planes][times] ;

// Fonction objectif
minimize sum(i in planes, j in times) (P_avance[i]*(x[i][j]-H[i][j])+ P_retard[i]*(H[i][j]-x[i][j]));

// Contraintes
subject to {
  // Un avion atterrit à une heure donnée
  forall(i in planes) sum(j in times) x[i][j] == 1;
  
  // Respect de la fenêtre de temps pour chaque avion
  forall(i in planes) {
    sum(j in times) j*x[i][j] >= H_min[i];
    sum(j in times) j*x[i][j] <= H_max[i];
  }
  
  // Respect de l'intervalle de temps minimum entre chaque paire d'avions
  forall(i in planes, j in planes: j != i) {
     x[i][j]*T[i][j] <= sum(k in times) x[i][k];
  }
 }

 
