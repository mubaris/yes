Module Module1


    Sub Main()
        Dim str As String = "y"
        Dim argsfull As String() = Environment.GetCommandLineArgs()

        If argsfull.Length > 1 Then
            Dim args As String()
            ReDim args(argsfull.Length - 1)

            ' exclude args(0) which is the .exe name
            Array.Copy(argsfull, 1, args, 0, argsfull.Length - 1)
            str = String.Join(" ", args)
        End If

        While True
            Console.WriteLine(str)
        End While

    End Sub


End Module
