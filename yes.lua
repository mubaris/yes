if #arg == 0 then
    while true do
        print("y")
    end
else
    while true do
        for i = 1, #arg do
            io.write(arg[i], " ")
        end
        print()
    end
end
