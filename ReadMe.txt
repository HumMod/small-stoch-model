README

There are a couple of changes in the code necessary for running on your own computer.  These all involve localizing directories in programs where inheritance is ill-defined.
First, in svm_light_windows\SVMLEARNmathematica.bat, all addresses need to be pointed to the svm_light_windows directory obtained from git.
Second, in the Mathematica file, pathdirectory needs to be pointed to the folder obtained from git.  

The program is executed through mathematica scripting.  Sequentially activating the blocks in ScriptedMetropolis.nb generates new data.  
The first block establishes directory names and pointers.
The second block generates the target distribution for CO and TPR.
The third block is the collection of algorithms that make up the data generation and analysis algorithms.
the fourth and fifth blocks initialize a data generation run, and the sixth block is the data generation.  The calnumber is the number of discarded data points, and valnumber is the number of retained points.  number of runs determines the number of restarts.
Subsequent blocks detail the analysis of the output, and are largely self-explanatory.

If any other changes are necessary, please address comments to drew-pruett through the git site.