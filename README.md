# Text Controller

Show phrases on VGA displays easily and fast (using a framebuffer).  
For my project [Mastermind](https://github.com/MrOverflOOw/Mastermind), I was using a framebuffer to render scene to a VGA display; at a certain point, I had to display many phrases in game. I discovered this fantastic [library](https://github.com/Derek-X-Wang/VGA-Text-Generator), but there was a problem: it didn't adapt very well with how I was writing the scene to the framebuffer; moreover, there was another problem regarding displaying more than one phrase: following this library, I had to instantiate many times a module called **pixel_on_text** (see library's link to check it out). So, I decided to take this library and refactor it to adapt to my needs: I'm now putting this here as I hope it can helps another developer speed up development. 

## How it works

This project is based on two files: **font_rom** and **text_controller**. See next sections to find out how they work.
### font_rom
*It's a module containing all the data of characters from ASCII 0 - 127. Basically, it is a long array containing all the characters. Each character contains 8 * 16 pixels. There's also a process returning a row of a character based on a input address* (description taken from Derek Wang's repository). This file remained unchanged, I put it here for the sake of completeness.
### text_controller
This is the main module: its logic remains unchanged from Derek Wang's one, I just added some more stuff to make it adapt to every project. Apart from CLOCK and RESET_N signals, that I will take for granted, there are four signals that I will explain:
1. CHOSEN_TEXT: it's an input signal that will tell this module which one, of the many phrases you need to show to the display, you need to show now. It's associated with a **message** type, that is defined like this `type message is (TEXT1, TEXT2, TEXT3, TEXT4);`: you need to put this definition in a module, I will tell you after how I suggest you to do it
1. NEXT_BIT: it's an input signal that will tell this module to go to the next bit of the phrase. If it corresponds to a 1 in the font_rom, PIXEL will become 1 at the end of the process, otherwise, it will stay at 0
1. NEXT_LINE: like with NEXT_BIT, but this signal tell this module when to go to the next line
1. PIXEL: it will tell you when you need to write to the current coordinates of the framebuffer

## How to use it
Check my project linked before, to see an example of how I implemented it.  
I suggest you to create a *package*, in which you define all your **string constants** (all your phrases that will need to be displayed on screen sooner or later) and put the **message type definition** (you can find it in the previous section), that is basically a list of labels for your phrases. Then, you also need to put this other **type definition** `type codes is array(natural range<>) of integer;` (it's a dependency for text_controller). Finally, you need to add this row `char_codes(n) <= character'pos(TEXT_NAME(char_position));` many times: one for each phrase you need to display; you only need to change n and TEXT_NAME: *n* stands for the integer associated to the phrase (you define it implicitly when you declare labels for your phrases in the message type, because message is an enum) and *TEXT_NAME* stands for the label you assigned to the phrase at position *n*.  
You can find a simple **text_package** in this repo with the message and codes types definition, you can start with that: you only need to modify the message type and add your strings to be displayed.

## License and more

Text Controller is published under **Apache License 2.0**. Special thanks to [**Derek Wang**](https://github.com/Derek-X-Wang), for his [VGA-Text-Generator](https://github.com/Derek-X-Wang/VGA-Text-Generator).

Copyright (©) [**Davide Di Donato**](https://github.com/MrOverflOOw) 2018
