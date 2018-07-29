# Just Make It Already. Pretty Please?

This is a collection of scripts I collect to run GNU Make on Windows. Now,
GNU Make itself actually works [very well] on Windows, but Makefiles out there
generally assume you are using a POSIX shell (or even Bash) when you run it.
They therefore usually contains commands only available on POSIX, even though
they don't need to.

[very well]: (http://gnuwin32.sourceforge.net/packages/make.htm)

One such example is [Warehouse]. It uses a Makefile to start up development
Docker containers. The containers work fine, but the Makefile does not.

[Warehouse]: https://github.com/pypa/warehouse

Fortunately, those things are generally very easy to work around, since Windows
do have those functionalities, only not by the same command. This is a
collection of scripts I built progressively when I encounter this kind of
problems.

Note: I don't need to stub Python commands (e.g. `python3.6`) because that's
already covered by [PythonUp]. You should use it too.

[PythonUp]: https://github.com/uranusjr/pythonup-windows


## Commands

These are simple BAT files in `cmd`, generally one-liners mapping a trivial
functionality to Windows.

* `#.bat`: Make comments work. Basically a no-op, but bridges whatever return
  code was returned by the previous command forward (mimicking POSIX shell
  behaviour).
* `touch.bat`: "Touch" a file, creating it if needed. On Windows this can be
  done by writing `NUL` (nothing) to the end of a file.


## TODO

* `mkdir`. Need to at least support `-p`. Not sure if a BAT is enough.
* `rm`. Need to at least support `r` and `f` flags, as commonly needed. Can't
  do this simply with BAT, so Rust it is.
