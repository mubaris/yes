.assembly yes {}
.assembly extern mscorlib {}
.method static void Main(string[])
{
	.entrypoint
	.maxstack 2
	.locals init(
		string V_0
	)

	// GET ARGV LENGTH	
	ldarg.0
	ldlen
	
	// COMPARE ARGV LENGTH
	conv.i4
	ldc.i4.0
	bgt SET_ARGS	// >1:  	BRANCH TO SET_ARGS
	br SET_YES		// ELSE:	BRANCH TO SET_YES
	
	SET_YES:
		ldstr "y"
		stloc.0
		br OUTPUT

	SET_ARGS:
		ldstr " "
		ldarg.0
		call string string::Join(string, string[])
		stloc.0
		br OUTPUT
	
	OUTPUT:
		ldloc.0
		call void [mscorlib]System.Console::WriteLine(string)
		br OUTPUT
}

