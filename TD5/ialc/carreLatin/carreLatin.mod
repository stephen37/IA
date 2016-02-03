/*********************************************
 * Modèle pour le problème du carré latin
 *********************************************/
using CP;

/*** Données du problème  ***/
int n = 3;

 
/*** Variables et domaines  ***/
range r = 1..n;
dvar int carre[r][r] in r;



/* Paramétrage du solveur */
execute {
    cp.param.searchType = "DepthFirst";
    cp.param.workers = 1;
}  

/*** Contraintes  ***/

constraints {
    forall (i in r) {
        forall(j, k in r : j < k) {
            carre[i][j] != carre[i][k];
            carre[j][i] != carre[k][i];
        }
    }
}

/*** Post-traitement  ***/

execute {

write("       ",carre);

/*   for (var i in r) {
       for( var j in r) {
          write(carre[i][j]);
       }
   writeln();
   }
*/
}

main {
    var count = 1;
    thisOplModel.generate();
    cp.startNewSearch();
    while(cp.next()) {
       if (count == 1) {
           thisOplModel.postProcess(); 
       }
    count++;
	      
    }
writeln("Nb Solution =", count);

}
