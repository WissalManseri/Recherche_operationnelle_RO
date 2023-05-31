/*********************************************
 * OPL 12.6.0.0 Model
 * Author: wissa
 * Creation Date: 22 févr. 2023 at 13:28:48
 *********************************************/

 //model de sablage
 //nombre de carrefours
int nc=...;
	range Nodes=1..nc;
	int L[Nodes][Nodes]=...; //matrice de distance en metre 
	
	dvar int+ X[Nodes][Nodes];
//fct obj:minimiser la longeur totale parcourue	
	minimise sum(i in Nodes)
	         sum(j in Nodes)
	           L[i][j];
	           
	// contraintes
	subject to
	{
	forall(i in Nodes)
	  sum(j in Nodes :  L[i][j]>=1)x[i][j]==sum ( j in Nodes : L[j][i]>=1)x[j][i]);
	  
	forall(i in Nodes)
	  forall(j in Nodes)
	    if  ( L[i][j]>0)  X[i][j]>=1;
	    	}
