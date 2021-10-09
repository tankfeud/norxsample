# norxsample
A trivial sample using [Norx](https://github.com/tankfeud/norx).


# Requirements
First you need a compiler for the Nim language, see [nim-lang.org](https://nim-lang.org).
Easiest is to use Choosenim like this for Linux:

    curl https://nim-lang.org/choosenim/init.sh -sSf | sh

Then you can build a release version with `nimble build -d:release` or `nim c -d:release -o:norxsample src/norxsample`.

In order to run the sample you will also need `liborx[d|p].so|.dll|.dylib` since we load the ORX library dynamically!
See instructions in [Norx](https://github.com/tankfeud/norx) for how to build and install these library files.

With the library in place you can then run with `./norxsample`
