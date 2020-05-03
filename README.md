# ultrahack20

UNUS TERRA

<img src="https://challengepost-s3-challengepost.netdna-ssl.com/photos/production/software_photos/001/074/004/datas/gallery.jpg" />

People, especially the younger ones, are already forgetting about social distancing practices. They’re gathering in groups, and unknowingly might be infecting other people with the virus.

We see an engaging gamified mobile application as a solution to not only inform the users about the ongoing situation but also encourage them to keep practicing social distancing during this dire global situation.

With Unus Terra we want to promote the effectiveness of social distancing and show players around the world how the COVID-19 infections spread in semi real-time with daily infection updates.

In the game, you can see a world-wide heat map of the infection hot spots, and teleport to hard-hit areas to help the local players fight against the evil virus.

Daily, when the player checks in, they can see new infections around their area and need to start the daily fight from there, moving later to more far-aways areas of the world.

Infections around the user’s area affect the number of enemies in the action part of the game view. The users’ actions during the day, how they are keeping a distance from others, and staying in the safety of their homes affect the accumulation of antiviral points which are used to fight against the viruses.

We're thinking of having a monetization system not much different from modern mobile games, but we're looking into if part of the in-app purchases could be dedicated to COVID-19 related donations.

One aspect we're heavily concentrating on is the social element of the fight. We want people to be able to have light interaction in the game with other people to give encouragement to each other, as well as see how the fight is proceeding around the world. One idea is to have stories of the people affected (infected, self-isolated, and family members who lost loved ones) to share their individual stories in the world-view inside the game.

The game is won when the virus infection around the world has gone under R0<1, and effectively the infections have stopped spreading. The game will stay with the player until that, and with other players around the world, they can celebrate the win.

We have designed the game mechanics so it continuously engages the user, as every day there are more viruses to kill, and the player can unlock abilities and new antiviral drug recipes.

The game can transform for other epidemics as well, such as seasonal influenza, so there are endless possibilities for expanding the game.

So what is the data we’re using? Unus Terra uses data from multiple sources to create a picture of the ongoing crisis:

Semi-Real-time local & global infections data in the map and numbers
Ubiquitous mode for tracking the users’ movement outside (using LTE cell tower data and upcoming Apple’s and Google’s COVID-19 tracking APIs)
Core elements:

Motive people to do social distancing, especially young people
See real-time world-map of the infections
Join a worldwide community in the fight against COVID-19
Amount of in-game enemies connected to real-life data
iAPs to help COVID-19 related donations
Resistance level tree for upgrading the player’s resistance to the virus (leveling system)
Compounds for antiviral drugs can be found in different areas of the world (using teleport function)
Antiviral recipes can be unlocked on certain levels
Player’s movement in real-life affects the accumulation of antiviral points – EXPOSURE FACTOR (EF) changes if the player goes into areas with more cell phones – moving in areas with a lot of people make the fight against viruses harder
See also friends’ EF, can give them encouragement to keep social distancing rules
Incentives for having the location services on, more antiviral accumulation while using
R0 changes according to the activities the player does during the day
Limited powerups that can be obtained by following social distancing rules
Powerups can be used to help areas with more infected cases (use them sparingly)
Customization of the player’s avatar
What we’ve done so far is the design of the game, as well as creating a proof of concept MVP to test out the different data sources.

For this summer, we plan to develop a playable demo and get it tested by the end-users.

```sh
API used https://api.covid19api.com/
```
