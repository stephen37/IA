/*********************************************
 * Modèle OPL Pour le problème des billes
 *
 * Utiliser un ou plusieurs tableau pour regrouper les variables 
 * dans des structures adéquates, permettant de simplifier 
 * l'énoncé de certaines contraintes ainsi que l'affichage de la solution.
 *********************************************/
using CP;			/* Utilisation du solveur CP-Solver */

/* Déclarations domaines et variables */

{string} nomVars = {"Anne", "Bernard", "Claudine", "Denis", "Bleue", "Jaune", "Noire", "Rouge", "Jardin", "Parc", "Chambre", "Salon"};

range ages = 4..7;

// Initialisation des valeurs du tableau
dvar int ageTableau[nomVars] in ages;

/* Paramétrage du solveur */
execute {
    cp.param.searchType = "DepthFirst";
    cp.param.workers = 1;
}  


/* Contraintes */
constraints {

   // Toutes les contraintes sont différentes
   ageTableau["Anne"] != ageTableau["Bernard"];
   ageTableau["Anne"] != ageTableau["Claudine"];
   ageTableau["Anne"] != ageTableau["Denis"];
   ageTableau["Bernard"] != ageTableau["Claudine"];
   ageTableau["Bernard"] != ageTableau["Denis"];
   ageTableau["Claudine"] != ageTableau["Denis"];
   ageTableau["Bleue"] != ageTableau["Jaune"];
   ageTableau["Bleue"] != ageTableau["Noire"];
   ageTableau["Bleue"] != ageTableau["Rouge"];
   ageTableau["Jaune"] != ageTableau["Noire"];
   ageTableau["Jaune"] != ageTableau["Rouge"];
   ageTableau["Noire"] != ageTableau["Rouge"];
   ageTableau["Jardin"] != ageTableau["Parc"];
   ageTableau["Jardin"] != ageTableau["Chambre"];
   ageTableau["Jardin"] != ageTableau["Salon"];
   ageTableau["Parc"] != ageTableau["Chambre"];
   ageTableau["Parc"] !=  ageTableau["Salon"];
   ageTableau["Chambre"] != ageTableau["Salon"];

   //1.Denis joue dans le parc et n’a pas 4 ans, contrairement à l’enfant qui a des billes bleues.
   ageTableau["Denis"] != 4;
   ageTableau["Denis"] == ageTableau["Parc"];
   ageTableau["Bleue"] == 4;
   //2. La fille de 6 ans a des billes jaunes
   ageTableau["Jaune"] == 6;
   //3. L’enfant qui joue avec des billes noires est plus âgé que l’enfant qui joue dans le jardin mais plus jeune que Anne.
   ageTableau["Noire"] > ageTableau["Jardin"];
   ageTableau["Noire"] < ageTableau["Anne"];
   //4. Anne, qui joue dans sa chambre, a 1 an de plus que l’enfant qui joue dans le salon.
   ageTableau["Anne"] == ageTableau["Chambre"];
   ageTableau["Chambre"] == ageTableau["Salon"] + 1;

}


/* Post-traitement (Affichage Solution) */


execute {
    writeln("Anne =", ageTableau["Anne"]);
    writeln("Bernard =", ageTableau["Bernard"]);
    writeln("Claudine =", ageTableau["Claudine"]);
    writeln("Denis =", ageTableau["Denis"]);
    writeln("Bleue =", ageTableau["Bleue"]);
    writeln("Jaune =", ageTableau["Jaune"]);
    writeln("Noire =", ageTableau["Noire"]);
    writeln("Rouge =", ageTableau["Rouge"]);
    writeln("Jardin =", ageTableau["Jardin"]);
    writeln("Parc =", ageTableau["Parc"]);
    writeln("Chambre =", ageTableau["Chambre"]);
    writeln("Salon =", ageTableau["Salon"]);

}

