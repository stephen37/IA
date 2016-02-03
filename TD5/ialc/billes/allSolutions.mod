main {
    var count = 1;
    thisOplModel.generate();
    cp.startNewSearch();
    while(cp.next()) {
	      writeln("---------------------------------------------------------------");
	      writeln("Solution n° ", count);
	      writeln("---------------------------------------------------------------");
	      count++;
	      thisOplModel.postProcess(); 
    }

}
