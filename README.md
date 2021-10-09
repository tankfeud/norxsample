# norxsample
A trivial sample using [Norx](https://github.com/tankfeud/norx).


# Requirements
First you need a compiler for the Nim language, see [nim-lang.org](https://nim-lang.org).
Easiest is to use Choosenim like this for Linux:

    curl https://nim-lang.org/choosenim/init.sh -sSf | sh

Then you can build with `nimble build` or `nim c -d:release -o:norxsample src/norxsample`.

In order to run the sample you will also need `liborxd.so|.dll` since we load the ORX library dynamically!

With the library in place you can also build and run at the same time with `nimble run norxsample`.
