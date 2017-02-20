# yes

## About yes

The `yes` command is used to output __y__, or whatever word you choose, forever.

## Description

The `yes` command outputs the same string, STRING, in a constant stream. If STRING is not specified, the word it repeats is __y__.

`yes` dates back to a time before Unix commands included the "force" (__-f__) option, which for many commands is the same as answering "yes" to all prompts.

`yes` can be used to do something very similar: if the output of yes is piped to a command, it will effectively answer __"yes"__ to any confirmation prompts.

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

`yes` can be dangerous also. If you redirect the output stream of `yes` to a file, it will eat up your storage space.

```
$ yes >> yes.txt
^Z

$ du -h yes.txt
1007M yes.txt
```

I ran the command only for __10 Seconds__. And It consumed almost 1 GB
