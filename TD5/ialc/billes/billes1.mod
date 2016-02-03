/*********************************************
 * Modèle OPL Pour le problème des billes
 *
 * Dans ce modèle chaque variable est déclarée explicitement
 * avec son nom d'origine dans le modèle initial
 *********************************************/

using CP;			/* Utilisation du solveur CP-Solver */


/* Déclarations domaines et variables */
range r = 4..7;
dvar int Anne in r;
dvar int Claudine in r;
dvar int Denis in r;
dvar int Bernard in r;
dvar int Bleue in r;
dvar int Jaune in r;
dvar int Noire in r;
dvar int Rouge in r;
dvar int Jardin in r;
dvar int Parc in r;
dvar int Chambre in r;
dvar int Salon in r;


/* Paramétrage du solveur */
execute {
    cp.param.searchType = "DepthFirst";
    cp.param.workers = 1;
} 



/* Contraintes */
constraints {

   // Toutes les contraintes sont différentes
   Anne != Bernard;
   Anne != Claudine;
   Anne != Denis;
   Bernard != Claudine;
   Bernard != Denis;
   Claudine != Denis;
   Bleue != Jaune;
   Bleue != Noire;
   Bleue != Rouge;
   Jaune != Noire;
   Jaune != Rouge;
   Noire != Rouge;
   Jardin != Parc;
   Jardin != Chambre;
   Jardin != Salon;
   Parc != Chambre;
   Parc !=  Salon;
   Chambre != Salon;

   //1.Denis joue dans le parc et n’a pas 4 ans, contrairement à l’enfant qui a des billes bleues.
   Denis != 4;
   Denis == Parc;
   Bleue == 4;
   //2. La fille de 6 ans a des billes jaunes
   Jaune == 6;
   //3. L’enfant qui joue avec des billes noires est plus âgé que l’enfant qui joue dans le jardin mais plus jeune que Anne.
   Noire > Jardin;
   Noire < Anne;
   //4. Anne, qui joue dans sa chambre, a 1 an de plus que l’enfant qui joue dans le salon.
   Anne == Chambre;
   Chambre == Salon + 1;
}
/* Post-traitement (Affichage Solution) */

execute {
    writeln("Anne =", Anne)
    writeln("Bernard =", Bernard)
    writeln("Claudine =", Claudine)
    writeln("Denis =", Denis)
    writeln("Bleue =", Bleue)
    writeln("Jaune =", Jaune)
    writeln("Noire =", Noire)
    writeln("Rouge =", Rouge)
    writeln("Jardin =", Jardin)
    writeln("Parc =", Parc)
    writeln("Chambre =", Chambre)
    writeln("Salon =", Salon)

}
main {
    thisOplModel.generate();
    if (cp.solve()) {
        var obj = cp.getObjValue();
        thisOplModel.postProcess();
    }
}
