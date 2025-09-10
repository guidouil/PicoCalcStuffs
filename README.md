# PicoCalc Stuffs I coded in MMBasic (for now)

## cmatrix

A wanabe clone of the famous linux command screensaver: `cmatrix`.

Launch it using `run "cmatrix` command.

## DVD

A wanabe clone of the infamous DVD players screensaver.

Launch it using `run "dvd` command.

## MODP

My most ambitious mmbasic programm yet, 5k to make a `.mod` files music player / sampler. Tested on Pico2W only.

It requires 2 things
- have the MODBUFFER enabled on yout PicoCalc. **This will format your A: drive, so do backup if you store some stuff as autorun.** To enable the buffer use this command `option modbuff enable 192` (if you don't put the 192 it will only take 128ko for buff and as max mod file size to play)
- have a `modfiles` directory at the same level as `modp.bas` with some `.mod` files in it, you can [get some here](https://modarchive.org/).

The player can only play file up to 192k

Launch it using `run "nodp` command.

## RGB

A little tool to show rgb colors and corresponding code. Two command are available when running `a` for again and `s` to save a screenshot, any other key to quit.

Launch it using `run "rgb` command.

## w95

A windows 95 emulator, needs the `w95.wav` file to be in the same directory as the `w95.bas` file to work "properly".

Launch it using `run "w95` command.
