/*********************************************
 * OPL 12.6.0.0 Model
 * Author: wissa
 * Creation Date: 22 févr. 2023 at 12:12:23
 *********************************************/
int m=...;
int n=...;
range I=1..m;
range J=1..n;
int d[I]=...;
int b[J]=...;
int c[I][J]=...;
dvar float x[I][J];

minimize sum(i in I)sum(j in J)c[i][j]*x[i][j];
subject to 
{
forall(i in I)
sum(j in J)x[i][j]<= d[i];

forall(j in J)
sum(i in I)x[i][j]>= b[j];
}

