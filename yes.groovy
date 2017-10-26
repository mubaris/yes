#!/usr/bin/env groovy

///////////////////////////////////
// How to execute
//
// option 1 - output 'yes'
// ./yes.groovy
//
// option 2 - output argument list
// ./yes.groovy argument_list

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
