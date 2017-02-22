class yes
{
	static void Main(string[] argv)
	{
		if (argv.Length == 0)
		{
			while (true)
			{
				System.Console.WriteLine("y");
			}
		}
		else
		{
			string pr = string.Join(" ", argv);
			while (true)
			{
				System.Console.WriteLine(pr);
			}
		}
	}
}

