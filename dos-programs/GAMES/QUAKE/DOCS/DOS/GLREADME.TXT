Glquake v0.95, Quake v1.09 release notes

3dfx owners -- read the 3dfx.txt file.

On a standard OpenGL system, all you should need to do to run glquake is put 
glquake.exe in your quake directory, and run it from there.  DO NOT install 
the opengl32.dll unless you have a 3dfx!  Glquake should change the screen 
resolution to 640*480*32k colors and run full screen by default.

If you are running win-95, your desktop must be set to 32k or 64k colors 
before running glquake.  NT can switch automatically.

Theoretically, glquake will run on any compliant OpenGL that supports the 
texture objects extensions, but unless it is very powerfull hardware that 
accelerates everything needed, the game play will not be acceptable.  If it 
has to go through any software emulation paths, the performance will likely 
by well under one frame per second.

At this time (march '97), the only standard opengl hardware that can play 
glquake reasonably is an intergraph realizm, which is a VERY expensive card.  
3dlabs has been improving their performance significantly, but with the 
available drivers it still isn't good enough to play.  Some of the current 
3dlabs drivers for glint and permedia baords can also crash NT when exiting 
from a full screen run, so I don't recommend running glquake on 3dlabs 
hardware.

3dfx has provided an opengl32.dll that implements everything glquake needs, 
but it is not a full opengl implementation.  Other opengl applications are 
very unlikely to work with it, so consider it basically a "glquake driver".  
See the encluded 3dfx.txt for specific instalation notes.  3dfx can only run 
full screen, but you must still have your desktop set to a 16 bit color mode 
for glquake to start.

resolution options
------------------
We had dynamic resolution changing in glquake for a while, but every single 
opengl driver I tried it on messed up in one way or another, so it is now 
limited to startup time only.

glquake -window
This will start glquake in a window on your desktop instead of switching the 
screen to lower resolution and covering everything.

glquake -width 800 -height 600
Tries to run glquake at the specified resolution.  Combined with -window, it 
creates a desktop window that size, otherwise it tries to set a full screen 
resolution.

texture options
---------------
The amount of textures used in the game can have a large impact on performance.  
There are several options that let you trade off visual quality for better 
performance.

There is no way to flush already loaded textures, so it is best to change 
these options on the command line, or they will only take effect on some of 
the textures when you change levels.

OpenGL only allows textures to repeat on power of two boundaries (32, 64, 
128, etc), but software quake had a number of textures that repeated at 24 
or 96 pixel boundaries.  These need to be either stretched out to the next 
higher size, or shrunk down to the next lower.  By default, they are filtered 
down to the smaller size, but you can cause it to use the larger size if you 
really want by using: 

glquake +gl_round_down 0
This will generally run well on a normal 4 MB 3dfx card, but for other cards 
that have either worse texture management or slower texture swapping speeds, 
there are some additional settings that can drastically lower the amount of 
textures to be managed.

glquake +gl_picmip 1
This causes all textures to have one half the dimensions they otherwise would.  
This makes them blurry, but very small.  You can set this to 2 to make the 
textures one quarter the resolution on each axis for REALLY blurry textures.

glquake +gl_playermip 1
This is similar to picmip, but is only used for other players in deathmatch.  
Each player in a deathmatch requires an individual skin texture, so this can 
be a serious problem for texture management.  It wouldn't be unreasonable to 
set this to 2 or even 3 if you are playing competatively (and don't care if 
the other guys have smudged skins).  If you change this during the game, it 
will take effect as soon as a player changes their skin colors.

run time options
----------------
At the console, you can set these values to effect drawing.

gl_texturemode GL_NEAREST
Sets texture mapping to point sampled, which may be faster on some GL systems 
(not on 3dfx).

gl_texturemode GL_LINEAR_MIPMAP
This is the default texture mode.

gl_texturemode GL_LINEAR_MIPMAP_LINEAR
This is the highest quality texture mapping (trilinear), but only very high 
end hardware (intergraph intense 3D / realizm) supports it.  Not that big of 
a deal, actually.

gl_finish 0
This causes the game to not issue a glFinish() call each frame, which may make 
some hardware run faster.  If this is cleared, the 3dfx will back up a number 
of frames and not be very playable.

gl_flashblend 0
By default, glquake just draws a shaded ball around objects that are emiting 
light.  Clearing this variable will cause it to properly relight the world 
like normal quake, but it can be a significant speed hit on some systems.

gl_ztrick 0
Glquake uses a buffering method that avoids clearing the Z buffer, but some 
hardware platforms don't like it.  If the status bar and console are flashing 
every other frame, clear this variable.

gl_keeptjunctions 0
If you clear this, glquake will remove colinear vertexes when it reloads the 
level.  This can give a few percent speedup, but it can leave a couple stray 
blinking pixels on the screen.

novelty features
----------------
These are some rendering tricks that were easy to do in glquake.  They aren't 
very robust, but they are pretty cool to look at.

r_shadows 1
This causes every object to cast a shadow.

r_wateralpha 0.7
This sets the opacity of water textures, so you can see through it in properly 
processed maps.  0.3 is very faint, almost like fog.  1 is completely solid 
(the default).  Unfortunately, the standard quake maps don't contain any 
visibility information for seeing past water surfaces, so you can't just play 
quake with this turned on.  If you just want to see what it looks like, you 
can set "r_novis 1", but that will make things go very slow.  When I get a 
chance, I will probably release some maps that have been processed properly 
for this.

r_mirroralpha 0.3
This changes one particular texture (the stained glass texture in the EASY 
start hall) into a mirror.  The value is the opacity of the mirror surface.



