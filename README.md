---
title: fcd
author: Stefan Wagner
colorlinks: true
---

# fcd

fcd - fast cd - fast change directory - A bash-shellscript to make wide jumps in
the directory tree fast and easy

## Usage

 `fcd DIRNAME`

Depending on the number of matching directories, there are 3 possible outcomes:

 * no such directory
 * one directory with this name
 * multiple directories with such a name

In case one, you get a message like:

`unknown directory: kamera`

In case 2, exactly one match, the shell changes the directory to the matched one,
after echoing the whole path:

```
fcd nager
1) match: /home/stefan/bilder/cliparts/tiere/nager
t201:~/bilder/cliparts/tiere/nager >
```
(your prompt will vary)

In case 3, more than one match, you get a list of candidates to select from, including an exit option as last entry on the list:

```bash
fcd Kamera
1) /home/stefan/Kamera
2) /home/stefan/bilder/Kamera
3) /exit/
#? 1
multi) /home/stefan/Kamera
```

Selecting one of them (except /exit/) will beam you into that directory.
Selecting the number, associated with /exit/, ("3" in this example) will terminate
without further notice.

### Prerequisites

This script depends on **locate** (or a replacement like mlocate) and hence on
**updatedb** and is aimed for the **bash**.
On most linux systems, **updatedb** and **locate** are preinstalled and running.

### Install

Put **fcd** and **fcd.sh** into a directory which is in your path, like `~/bin`,
depending on your distribution and personal taste.
If you lack such a directory, you may either create it as new and include it into
your PATH, or place the script in a directory which is already part of the PATH,
like `/usr/local/bin`.

Source the `fcd` script, which contains the function definition, from your `~/.bashrc`
file.

Since you don't want to perform the action just in a subshell, which would drop you
back into the starting dir, if performed as script, we need to perform it as function,
not as script.

```bash
# in your $HOME/.bashrc, do:
. fcd
# or
source fcd
```

## Tests

Test, for example with `fcd wpasupplicant`, which typically leads to multiple results,
to select from:

```bash
fcd wpasupplicant
1) /etc/network/if-down.d/wpasupplicant	       5) /usr/share/doc/wpasupplicant
2) /etc/network/if-post-down.d/wpasupplicant   6) /usr/share/lintian/overrides/wpasupplicant
3) /etc/network/if-pre-up.d/wpasupplicant      7) /exit/
4) /etc/network/if-up.d/wpasupplicant
#? 5
multi) /usr/share/doc/wpasupplicant
```

This shall beam you to /usr/share/doc/wpasupplicant for example. You might have
less or more matches and selected another one.
If you selected an entry, you can switch back with `cd -` as usual.

Test which typically leads to just one match:

```bash
t201:~ >
t201:~ > fcd rc3.d
1) match: /etc/rc3.d
t201:/etc/rc3.d >
```

Test which typically leads to no match:

```bash
t201:~ >
t201:~ > fcd 1232131313131
unknown directory: 1232131313131
t201:~ >
```

## Contributing

## Authors

* **Stefan Wagner** - *Initial work*

## License

This project is licensed under the [GPLv3](https://choosealicense.com/licenses/gpl-3.0/)

## Acknowledgments

Thanks to m_bostaurus for hints to a bug, missing results when fcd to "bin".

## History

 - Ver. 1.1 bugfix missing results when `fcd bin`
 - Ver. 1.0 initial release
