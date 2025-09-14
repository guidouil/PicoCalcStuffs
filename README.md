# PicoCalc Stuffs I coded in MMBasic (for now)

## DEMO

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/1o-D2JVQz5Y/0.jpg)](https://www.youtube.com/watch?v=1o-D2JVQz5Y)


A 130 seconds demo with sound and many annimations gathered mostly on [TheBackShed](https://www.thebackshed.com/forum/ViewTopic.php?TID=17161&P=1).
You also need the file `laamaa.mod` in the same directory as `demo.bas` to have it working properly.
This was tested on a Raspberry Pico2W overclocked at 252MHz.

Requirements
- A PicoCalc (obvously)
- Having the modf buffer activated. **This will format your A: drive, so do backup if you store some stuff as autorun.** To enable the buffer use this command `option modbuff enable`. You can disable it latter on with `option modbuff disable`
- Running on a Raspberry Pico2W overclocked at 252MHz. You can overclock with the following command `option cpluclock 252000` (also it might run on a Pico1 on regular frequency since it's only MMBasic without 3D instructions in the code.

Launch it using `run "demo` command.

## chain

A little demo stolen from [this page](https://www.thebackshed.com/forum/ViewTopic.php?TID=17161&P=2#227043) that looks like this

![Chain screenshot](https://raw.githubusercontent.com/guidouil/PicoCalcStuffs/refs/heads/main/chain.bmp)

Launch it using `run "chain` command.

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

![RGB screenshot](https://raw.githubusercontent.com/guidouil/PicoCalcStuffs/refs/heads/main/rgb.bmp)

Launch it using `run "rgb` command.

## w95

A windows 95 emulator, needs the `w95.wav` file to be in the same directory as the `w95.bas` file to work "properly".

Launch it using `run "w95` command.
