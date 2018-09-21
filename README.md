# jLib

LUA library for [XenoBot](http://xenobot.net/) developed in 2015/2016. Only used with my own scripts.

## Tutorial

If you want to use one of the scripts, follow steps below.

1. Download **jLib.lua**, **SCRIPTNAME.xbst**, **SCRIPTNAME.ini** (library, waypoints, config)
2. Open jLib.lua with an editor of your choice
3. Go to line 180 (SCRIPT_DATA["Name"] = "|NAME|") and replace |NAME| with your **SCRIPTNAME**
4. Go to line 223 (local SCRIPT_CONFIG = [[|CONFIG|]]) and replace |CONFIG| with **SCRIPTNAME**.ini content
5. Save everything, open Tibia, open XenoBot, load settings (**SCRIPTNAME**.xbst), load library (jLib.lua)

##### Notes:
* **SCRIPTNAME** refers to the name of downloaded script
* New script requires a new jLib.lua (rename it to anything you want)
* You can launch the script anywhere in correct town

#### Troubleshooting
If anything goes wrong, it's probably the .xbst file. Open it, then scroll to the bottom and find these lines:
```
<panel name="Scripter">
	<control name="RunningScriptList">
		<script name="|NAME|.xblua" noprompt="1"><![CDATA[|BASE64|]]></script>
	</control>
</panel>
```
Then delete them and everything should be working - if not, feel free to contact me via email.

#### Navi scripts
Yes - they are working.

## Scripts list
| Vocation | Recommended level | Script name                  |
| :------- | :---------------- | :--------------------------- |
| EK       | 8+                | Ankrahmun Larvas West        |
| EK       | 15+               | Liberty Bay Rotworms         |
| EK       | 25+               | Yalahar Minotaurs            |
| EK       | 40+               | Yalahar Magicians            |
| EK       | 50+               | Yalahar Dragons              |
| EK       | 60+               | Yalahar Pirates              |
| EK       | 60+               | Barbarian Camp               |
| EK       | 70+               | Yalahar Zombies              |
| EK       | 70+               | Yalahar Arena                |
| EK       | 80+               | Vandura Mountain -2          |
| EK       | 80+               | Yalahar Bog Raiders          |
| EK       | 80+               | Yalahar Giant Spiders        |
| EK       | 90+               | Drefia Necromancers          |
| EK       | 100+              | Isle of Strife               |
| EK       | 100+              | Vandura Wyrms                |
| EK       | 120+              | Quara Hell                   |
| EK       | 160+              | Vengoth Castle West and East |
| EK       | 220+              | Glooth Bandits South         |
| EK       | 220+              | Glooth Bandits East          |
| EK       | 220+              | Glooth Bandits West          |
| EK       | 350+              | Oramond Tower                |
| RP       | 8+                | Ankrahmun Larvas West        |
| RP       | 15+               | Yalahar Cemetery West        |
| RP       | 30+               | Upper Spike -3               |
| RP       | 35+               | Yalahar Magicians            |
| RP       | 50+               | Kazordoon Dragon Lair        |
| RP       | 50+               | Yalahar Cults                |
| RP       | 50+               | Yalahar Dragons              |
| RP       | 100+              | Lower Spike -1               |
| RP       | 100+              | Isle of Strife               |
| RP       | 100+              | Vandura Wyrms                |
| RP       | 110+              | Drillworms West              |
| RP       | 110+              | Drillworms East              |
| RP       | 120+              | East Rathelon                |
| RP       | 130+              | Hidden Lizards               |
| RP       | 140+              | Pick N Shovel Mine           |
| RP       | 140+              | Forbidden Lands Hydras       |
| RP       | 140+              | Minotaur Plains East         |
| RP       | 150+              | War Golems Lake              |
| RP       | 150+              | Lower Spike -2               |
| RP       | 160+              | Splintered Stone Mine        |
| RP       | 160+              | Demona Warlocks              |
| RP       | 160+              | Drunken Fellow Mine          |
| RP       | 160+              | Oramond Sewers Easy          |
| RP       | 180+              | Fire Dragon Dojo             |
| RP       | 180+              | Roshamuul Bridge             |
| RP       | 200+              | Oramond Sewers Medium        |
| RP       | 200+              | Vengoth Castle West and East |
| RP       | 210+              | Goroma Medusa Cave           |
| RP       | 220+              | Abandoned Sewers             |
| RP       | 230+              | Yalahar Demons West and East |
| RP       | 250+              | Roshamuul City South         |
| RP       | 260+              | Ghastly Dragon Palace        |
| RP       | 280+              | Lower Roshamuul              |
| RP       | 280+              | Ferumbras Tower              |
| RP       | 300+              | Oramond Fury                 |
| MS/ED    | 8+/13+            | Ankrahmun Larvas West        |
| MS/ED    | 13+               | Yalahar Cemetery West        |
| MS/ED    | 13+               | Mistrock                     |
| MS/ED    | 30+               | Upper Spike -3               |
| MS/ED    | 30+               | Meriana Gargoyle Cave        |
| MS/ED    | 35+               | Yalahar Magicians            |
| MS/ED    | 50+               | Yalahar Dragons              |
| MS/ED    | 50+               | Folda Water Elementals       |
| MS/ED    | 80+               | Peninsula Tomb -4            |
| MS/ED    | 80+               | Vandura Wyrms                |
| MS/ED    | 100+              | Isle of Strife               |
| MS/ED    | 120+              | East Rathelon                |
| MS/ED    | 130+              | Hidden Lizards               |
| MS/ED    | 160+              | Demona Warlocks              |
| MS/ED    | 180+              | Goroma Medusa Cave           |
| MS/ED    | 180+              | Fire Dragon Dojo             |
| MS/ED    | 220+              | Glooth Bandits East          |
| MS/ED    | 220+              | Glooth Bandits West          |
| MS/ED    | 220+              | Glooth Bandits South         |
| MS/ED    | 230+              | Yalahar Demons West and East |
| MS/ED    | 250+              | Lizard City                  |

#### Youtube videos
[Youtube channel](https://www.youtube.com/channel/UCIJ48keuNw8xgOGbk0rr-TQ)