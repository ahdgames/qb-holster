# qb-holster
 QB-Core holster script that let you wear and remove holster to quickly draw a gun

# Features
- Quickly wear and remove holster
- Holster as item
- Customizable draw time
- Offer support via issues and discord :3

## Previews

[Without holster](https://streamable.com/d877wj)

[Using holster](https://streamable.com/ovu3h9)

[With holster](https://streamable.com/tu7ln2)
 
## Dependencies:

[qb-core](https://github.com/qbcore-framework/qb-core)

[ps-progressbar](https://github.com/Project-Sloth/progressbar)

# **Installation**
## Go to `qb-small resources/client/weapdraw.lua` then set the same number as config to true
```lua
--Line ~150
local HolsterVariant = GetPedDrawableVariation(ped, 8) --Replace with category number
if HolsterVariant == 130 then --Replace to match config
    WearingHolster = true
elseif HolsterVariant == 160 then --Replace to match config
	WearingHolster = true
end
```

Navigate to `/qb-inventory/html/images` and drag `holster.png` from [image folder](image/holster.png) to `/qb-inventory/html/images`
## **add in qb-core/shared/items.lua**
```lua
['holster']						 = {['name'] = 'holster', 						['label'] = 'Holster', 					['weight'] = 5, 		['type'] = 'item', 		['image'] = 'holster.png',		 		['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true, 	['combinable'] = nil,  ['description'] = 'An holster to quickly draw your handgun.'},

```


# Feel free to fork and contribute with [Pull requests](https://github.com/YoungDev06/qb-holster/pulls)!