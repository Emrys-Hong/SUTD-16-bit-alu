//
// PlanAhead(TM)
// rundef.js: a PlanAhead-generated Runs Script for WSH 5.1/5.6
// Copyright 1986-1999, 2001-2013 Xilinx, Inc. All Rights Reserved.
//

var WshShell = new ActiveXObject( "WScript.Shell" );
var ProcEnv = WshShell.Environment( "Process" );
var PathVal = ProcEnv("PATH");
if ( PathVal.length == 0 ) {
  PathVal = "C:/Xilinx/14.7/ISE_DS/EDK/bin/nt;C:/Xilinx/14.7/ISE_DS/EDK/lib/nt;C:/Xilinx/14.7/ISE_DS/ISE/bin/nt;C:/Xilinx/14.7/ISE_DS/ISE/lib/nt;C:/Xilinx/14.7/ISE_DS/common/bin/nt;C:/Xilinx/14.7/ISE_DS/common/lib/nt;C:/Xilinx/14.7/ISE_DS/PlanAhead/bin;";
} else {
  PathVal = "C:/Xilinx/14.7/ISE_DS/EDK/bin/nt;C:/Xilinx/14.7/ISE_DS/EDK/lib/nt;C:/Xilinx/14.7/ISE_DS/ISE/bin/nt;C:/Xilinx/14.7/ISE_DS/ISE/lib/nt;C:/Xilinx/14.7/ISE_DS/common/bin/nt;C:/Xilinx/14.7/ISE_DS/common/lib/nt;C:/Xilinx/14.7/ISE_DS/PlanAhead/bin;" + PathVal;
}

ProcEnv("PATH") = PathVal;

var RDScrFP = WScript.ScriptFullName;
var RDScrN = WScript.ScriptName;
var RDScrDir = RDScrFP.substr( 0, RDScrFP.length - RDScrN.length - 1 );
var ISEJScriptLib = RDScrDir + "/ISEWrap.js";
eval( EAInclude(ISEJScriptLib) );


ISEStep( "ngdbuild",
         "-intstyle ise -p xc6slx9tqg144-2 -dd _ngo -uc \"mojo_top_0.ucf\" \"mojo_top_0.edf\"" );
ISEStep( "map",
         "-intstyle pa -w -pr b -mt on \"mojo_top_0.ngd\"" );
ISEStep( "par",
         "-intstyle pa \"mojo_top_0.ncd\" -w \"mojo_top_0_routed.ncd\" -mt on" );
ISEStep( "trce",
         "-intstyle ise -o \"mojo_top_0.twr\" -v 30 -l 30 \"mojo_top_0_routed.ncd\" \"mojo_top_0.pcf\"" );
ISEStep( "xdl",
         "-secure -ncd2xdl -nopips \"mojo_top_0_routed.ncd\" \"mojo_top_0_routed.xdl\"" );



function EAInclude( EAInclFilename ) {
  var EAFso = new ActiveXObject( "Scripting.FileSystemObject" );
  var EAInclFile = EAFso.OpenTextFile( EAInclFilename );
  var EAIFContents = EAInclFile.ReadAll();
  EAInclFile.Close();
  return EAIFContents;
}
