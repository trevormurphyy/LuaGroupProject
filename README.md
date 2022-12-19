# LuaGroupProject
Collection of Sample Lua Programs Created During IT327 @ Illinois State University

Installing and Running Lua Programs

These programs were developed on Windows 11 and are intended to be run on a Windows system. NOT iOS or Linux.

1. https://luabinaries.sourceforge.net/download.html
2. Download either lua-5.4.2_win32 or win64 based on your system
3. extract the files into a folder of your choosing (recommended that this folder is named 'lua' and is located in your C: drive in the lowest directory.
example file path: 'C:\lua'
4. open settings
5. search 'edit the system environment variables' and open
6. click 'environment variables'
7. edit 'path' in the 'system variables' window
8. click new
9. type in the file path of the folder you unzipped the lua folder into (if you've followed our instructions, copy/paste in the example file path on instruction 3.)
10. Click ok
11. Exit settings menus
12. Open command prompt
13. Type in ‘lua54’ and hit enter
14. You are now running lua5.4 on your computer.
15. You can now close this command prompt.
If you are not running lua54 and you've received an error message, you have done something wrong. Please review the previous steps in their entirety.

Running Programs
SETUP
1. Download and unzip our Lua_Group_Project folder into a folder of your choosing
2. Move the programs into a folder of your choosing as well
3. These instructions will assume the programs are in this directory
C:\Users\user\Documents\luaproject
^ note that user will be whatever your particular username is
4. Open a command prompt if you do not have one already open and type in 'cd C:\Users\user\Documents\luaproject'
REMEMBER TO CHANGE user TO YOUR USERNAME BEFORE HITTING ENTER

INSTRUCTIONS
Running Program 1
1. In the command prompt, type 'lua54 program1.lua' and hit enter
2. You should now see 'Hello World' on the screen.

Running Program 2
1. In the command prompt, type 'lua54 program2.lua' and hit enter
2. You should now see our banking programs menu on the screen.

Running Program 3
1. In the command prompt, type 'lua54 program3.lua <filename>' and hit enter
2. You should now see our weather calculation program’s output on the screen.
We have provided 1 sample text file for this program titled ‘program3.txt’ that can be inserted into the <filename> token.

Running Program 4
1. In the command prompt, type 'lua54 program4.lua <filename>' and hit enter
2. You should now see our stack parsing program’s output on the screen.
We have provided 4 sample text files for this program titled ‘balanced.txt’, ‘unbalanced.txt’, ‘balanced2.txt’, and ‘unbalanced2.txt’ that can be inserted into the <filename> token.
