if ARGV.length == 0
    loop do
        puts "y"
    end
else
    loop do
        ARGV.each do |element|
            print "#{element} "
        end
        puts ""
    end
end
