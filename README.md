# VNS-Clustering
VNS clustering for bearings' failure diagnosis. To start, you must Modify the 'ScriptSQL.m' file to configure your database access and the table structures.

Script 'RNDScript.m' : To run random solution generation.
Script 'CMOScript.m' : To run CMO clustering.
Script 'CMOExpand.m' : To run hybridized clustering CMO/Expand.
Script 'CMOReduce.m' : To run hybridized clustering CMO/Reduce.
Script 'CMOVNSScript.m' : To run hybridized clustering CMO/VNS. For CMO parameterization, you can modify the parameter 'Ratio' to adjust the algorithm behavior (Intensification / Diversification). To customize the results plot, you can modify the file 'Plot.m'.
