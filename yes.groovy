#!/usr/bin/env groovy
if (args) {
    repeatForever(args[0]);
} else {
    repeatForever('y');
}

def repeatForever(String phrase) {
    while(true) {
        println phrase;
    }
}
