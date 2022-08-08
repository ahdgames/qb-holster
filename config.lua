--These are default settings for a fresh server without EUP you may adjust them to your needs.

Config = {}

Config.HolsterTime = 2000 -- Time in ms to add/remove holster
Config.WaitTime = true --Wait x seconds before removing/adding holster

--Male options
Config.MaleCategory = 8 -- 0: Face\ 1: Mask\ 2: Hair\ 3: Torso\ 4: Leg\ 5: Parachute / bag\ 6: Shoes\ 7: Accessory\ 8: Undershirt\ 9: Kevlar\ 10: Badge\ 11: Torso 2
Config.MaleWearingNumber = 130 -- Neck accessory that will appear once used
Config.MaleRemovedNumber = 0 -- Neck accessory that will appear once removed
--Female options
Config.FemaleCategory = 8 --0: Face\ 1: Mask\ 2: Hair\ 3: Torso\ 4: Leg\ 5: Parachute / bag\ 6: Shoes\ 7: Accessory\ 8: Undershirt\ 9: Kevlar\ 10: Badge\ 11: Torso 2
Config.FemaleWearingNumber = 160 -- Neck accessory that will appear once used
Config.FemaleRemovedNumber = 0 -- Neck accessory that will appear once removed

--DO NOT foget to add the WearingNumber to qb-smallresouces/client/weapdraw.lua :3