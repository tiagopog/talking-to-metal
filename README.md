# Talking to Metal

Not as good as Heavy Metal but it's a good challenge trying to master some stuff in machine (metal) code.

This repo contains a collection of Assembly programs that I've been writing
only for study and practice purpose. So please don't take it that serious :-)

## Assembler

All programs are written for Intel x86-64 machine and macOS operating system
hence the executable format used must be the "Mach-O 64".

For this reason I strongly recommend the use of the `nasm` assembler.

You can install it via Homebrew:

```
brew install nasm
```

## Running

For running one of the programs you just need to:

1. Assemble the source code with `nasm`:

```
nasm -f macho64 hello_world.asm
```

2. Link the resulting binary:

```
ld -macosx_version_min 10.7.0 -lSystem -o hello_world hello_world.o
```

3. Run:

```
./hello_world
```
