class Yes
{
	static void Main(string[] argv)
	{
		string st = "y";
		if(argv.Length > 0)
		{
			st = string.Join(" ", argv);
		}
		while (true)
		{
			System.Console.WriteLine(st);
		}
	}
}

