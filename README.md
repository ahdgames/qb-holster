# qb-holster
 QB-Core holster script that let you wear and remove holster to quickly draw a gun

#Features
    - Quickly wear and remove holster
    - Holster as item
    - Customizable draw time

##Without holster
![Without holster](https://streamable.com/d877wj)

##Using holster
![Using holster](https://streamable.com/ovu3h9)

##With holster
![With holster](https://streamable.com/tu7ln2)
 
**Dependencies:**

    [qb-core](https://github.com/qbcore-framework/qb-core)

    [ps-progressbar](https://github.com/Project-Sloth/progressbar)

# **Installation**
    Navigate to `/qb-inventory/html/images` and drag `holster.png` from [image folder](image/holster.png) to `/qb-inventory/html/images`
    ## **add in qb-core/shared/items.lua**
    ```lua
    ['holster']						 = {['name'] = 'holster', 						['label'] = 'Holster', 					['weight'] = 5, 		['type'] = 'item', 		['image'] = 'holster.png',		 		['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true, 	['combinable'] = nil,  ['description'] = 'An holster to quickly draw your handgun.'},

    ```
