;MAIN===========================================================================
`::functionParameterTest()
1::functionParameterTest(1)
2::functionParameterTest(1,2)
3::functionParameterTest(1,2,3)

4::functionParameterTest2("four")
5::functionParameterTest2(1,"five")
6::functionParameterTest2(,,"six")
7::functionParameterTest2(0,0,"seven")


;METHODS========================================================================
/* NOTES
 * All variables are essentially a string data-type, of which is parsed by the compiler and evaluated as a reference to an object, a number value, or a string-literal.
 * functions/methods can only have one signature, of which can have optional paramaters with default values using the ":=" operator. 
 * all parameters to the right of the first ":=" must also have ":="
 * 
*/

functionParameterTest() ;overwritten
functionParameterTest(p_1 := "def_1") ;overwritten
functionParameterTest(p_1 := "def_1", p_2 := "def_2") ;overwritten
functionParameterTest(p_1 := "def_1", p_2 := "def_2", p_3 := "def_3"){
	MsgBox, , functionParameterTest, "parameter_1: " %p_1% `n"parameter_2: " %p_2% `n"parameter_3: " %p_3%
}


functionParameterTest2(p_1 := "def_1", p_2 := "def_2", p_3 := "def_3"){
	numberOfArgs := 3
	output1 := "`nparameter_1 = " p_1 
	output2 := "`nparameter_2 = " + p_2 
	output3 := "`nparameter_3 = " p_3 
	if (p_1 = "def_1"){
		numberOfArgs--
		output1 := ""
	}
	if (p_2 = "def_2"){
		numberOfArgs--
		output2 := ""
	}
	if (p_3 = "def_3"){
		numberOfArgs--
		output3 := ""
	}
	MsgBox, , functionParameterTest2, Number of Arguments = %numberOfArgs% %output1% %output2% %output3%
}
