if ($#ARGV == -1) {
    while (1) {
        print "y\n";
    }
}else {
    while (1) {
        for ($i = 0; $i < $#ARGV + 1; $i = $i + 1) {
            print "$ARGV[$i] ";
        }
        print "\n";
    }
}
