# Morse code transmitter, ie converter of characters/numbers to Morse code.

### Team members

* Mastný - everything
* Fedor - everything

### Table of contents

* [Project objectives](#objectives)
* [Hardware description](#hardware)
* [VHDL modules description and simulations](#modules)
* [TOP module description and simulations](#top)
* [Video](#video)
* [References](#references)

<a name="objectives"></a>

## Project objectives

Create morsecode transmiter.
by up and down buttons you can select alphanumerical character and then by pressing center butten it will be transmitted by led light in morse code.

<a name="hardware"></a>

## Hardware description

For this project is only needed board Nexys A7-50T with no extra hardware.

<a name="modules"></a>

## VHDL modules description and simulations

**State_machine module**

state_machine module handles input and based on it defines letter that should be visualized on 7segment display and transmitted via led light.

![](https://github.com/GabrielMastny/digital-electronics-1/blob/main/labs/Project/stateMachineTestBench.png)

**debouncer**

debouncer responsibility is to disable microflickering of pressed button

![](https://github.com/GabrielMastny/digital-electronics-1/blob/main/labs/Project/debouncerTest.png)

**blinker**

when letter is selected and module recieves enable flag it will via led signal trnsmit morse code, when the transmition is finished the finished flag wil be set to 0.


![image](https://user-images.githubusercontent.com/26280711/165842623-d1ab68f1-d465-4997-8b73-b950991fef6c.png)


**7 segment** 

this module was covered during lectures

**clock enable**

this module was covered during lectures



<a name="top"></a>

## TOP module description and simulations

Top module glues all modules above together

unfotunatelly eda could not for some reason draw the waveform

<a name="video"></a>

## Video

<a href="https://app.animaker.com/animo/C2ZFqOrO9pvQOa5A/"> comented video here</a>

<a name="references"></a>

## References

1. Write your text here.
