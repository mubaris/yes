# yes

## About yes

The `yes` :zap: command is used to output __y__, or whatever word you choose, forever. :loop: :loop: :loop:

## Description

The `yes` :zap: command outputs the same string, STRING, in a constant stream. If STRING is not specified, the word it repeats is __y__. :repeat:

`yes` :zap: dates back to a time before Unix commands included the "force" (__-f__) option, which for many commands is the same as answering "yes" to all prompts.

`yes` can be used to do something very similar: if the output of yes is piped to a command, it will effectively answer __"yes"__ to any confirmation prompts. :+1: :+1:

## yes Syntax

```
yes [STRING]...
```

## yes Output

```
y
y
y
y
y
y
.
.
.
```

## Dangerous yes

### Redirecting output to a file

`yes` can be dangerous also. If you redirect the output stream of `yes` to a file, it will eat up your storage space. :bomb: :bomb:

```
$ yes >> yes.txt
^Z

$ du -h yes.txt
1007M yes.txt
```

I ran the command only for __10 Seconds__. And It consumed almost 1 GB. :boom: :boom:

### Nested yes

`yes` takes an argument and prints it infinitely. What if you take `yes` as argument itself. :boom: :bomb: :boom:

```
$ yes `yes`
```

You tell me what happens. :stuck_out_tongue_winking_eye:
