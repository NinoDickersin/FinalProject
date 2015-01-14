FinalProject
============

Final Project for Mr. Ks APCS Class

We are going to make a projectile launch game. The game will feature a launch device (cannon, ramp, slingshot, etc.), a lovable ferret (who will be the projectile), various items that can be purchased with in-game coins to assist the ferret in its launch, and powerups that can be grabbed during the ferret's flight. The player will be able to control the angle and power of the launch device, and purchase items that boosts the device's power, allowing the ferret to travel farther. The distance the ferret travels will be determined by its initial velocity and gravity. The player will also be able to purchase items that boost the ferret during flight, including a jetpack and a glider that allows the player to fall at varying speeds. Various powerups can be collected during the ferret's flight, including additional jetpack fuel, coins, and launch rockets. At the end of the flight, the player will acquire a number of coins depending on the ferret's airbore time, vertical, and horizontal max height. The game is complete once the ferret has reached a certain distance, and the player's score is determined by how many flights it took to reach that distance.

1/5/15: Added Game.java and updated README.md

1/6/15: Started work on PhysXEngine.java + Ferret sprite image

1/7/15 We got parabolic motion to work, further developed the PhysX engine, and created Ferret.java

1/8/15 We added music and the beginnings of a main menu.  The ferret is now launched when the player presses a button.

1/9/15 Created play / pause button, added bounce() but it doesn't work correctly.  Tried to work on sound, didn't go well.

1/11/15 bounce() now works correctly!  Created a processing file to test the changing of background color when a button is pushed, will eventually become our main screen.

1/12/15 Added a background to the main screen.  Started work on cannon and repaired bugs in bounce().

1/13/15 updated Ferret, cannonPower now determiens velocity, ferret semi-work.  Added scrolling background.
