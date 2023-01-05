# qb-casinojob
This is a Casino Job designed exclusivley for QBCore. 
This resource stemed from https://github.com/Andyauk/qb-vanillaunicorn

## Requirements
- [QBCore](https://github.com/qbcore-framework/qb-core)
- [qb-menu](https://github.com/qbcore-framework/qb-menu)
- [qb-target](https://github.com/BerkieBb/qb-target)
- Gabz Casino

## Features
- Completely Translatable
- Fully commented
- Almost everything is configureable
- Stashes
- Toggle Duty
- Complete qb-target & qb-menu support
- Supports invoicing players, via the /invoice ID Amount command
- Boss Menu implemented allowing for hiring, firing and storage management

## Setup
1) Add the following into your qb-core > shared.lua, under the Items section:
```
-- Vanilla Unicorn
	['vodka'] 					 = {['name'] = 'vodka', 			  	  		['label'] = 'Vodka', 				['weight'] = 100, 		['type'] = 'item', 		['image'] = 'vodka.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Ever been so drunk you start speaking Russian? This will do the trick'},
	['whiskey'] 					 = {['name'] = 'whiskey', 			  	  		['label'] = 'Whiskey', 				['weight'] = 100, 		['type'] = 'item', 		['image'] = 'whiskey.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'The fine mans drink, not something most people can afford'},
	['rum'] 					 = {['name'] = 'rum', 			  	  		['label'] = 'Rum', 				['weight'] = 100, 		['type'] = 'item', 		['image'] = 'whiskey.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A beverage that seems to make you think you can fight anybody'},
	['cocacola'] 					 = {['name'] = 'cocacola', 			  	  		['label'] = 'CocaCola', 				['weight'] = 100, 		['type'] = 'item', 		['image'] = 'cocacola.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Probably have some issues with your blood suger level'},
```
2) Once added, add the job into your qb-core > shared.lua like so:
```
['vu'] = {
	label = 'Vanilla Unicorn',
	defaultDuty = true,
	grades = {
		['0'] = {
			name = 'Trainee',
			payment = 50
		},
		['1'] = {
			name = 'Employee',
			payment = 75
		},
		['2'] = {
			name = 'Management',
			isboss = true,
			payment = 100
		},
	},
},
```

3) You'll also need to setup the boss menu for this job, to do so, go to qb-bossmenu > config.lua and add the following:
```lua
['vu'] = vector3(93.57, -1292.3, 29.27)
```
