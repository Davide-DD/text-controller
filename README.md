# Text Controller

Show phrases on VGA displays easily and fast (using a framebuffer). For my project [Mastermind](https://github.com/MrOverflOOw/Mastermind), I was using a framebuffer to render scene to a VGA display; at a certain point, I had to display many phrases in game. I discovered this fantastic [library](https://github.com/Derek-X-Wang/VGA-Text-Generator), but there was a problem: it didn't adapt very well with how I was writing the scene to the framebuffer; moreover, there was another problem regarding displaying more than one phrase: following this library, I had to instantiate many times a module called **pixel_on_text** (see library's link to check it out). So, I decided to take this library and refactor it to adapt to my needs: I'm now putting this here as I hope it can helps another developer speed up development. 

## How it works

This project is based on two files: **font_rom** and **text_controller**. See next sections to find out how they work.
### font_rom
*It's a module containing all the data of characters from ASCII 0 - 127. Basically, it is a long array containing all the characters. Each character contains 8 * 16 pixels. There's also a process returning a row of a character based on a input address.* (from Derek Wang's repository). This file remained unchanged, I put it here for the sake of completeness.
### text_controller


## License and more

Text Controller is published under **Apache License 2.0**. Special thanks to [**Derek Wang**](https://github.com/Derek-X-Wang), for his [VGA-Text-Generator](https://github.com/Derek-X-Wang/VGA-Text-Generator).

Copyright (©) [**Davide Di Donato**](https://github.com/MrOverflOOw) 2018
