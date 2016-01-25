class Ui extends GameObject
{
	Blitz blitz;
	AttackBoost attack;
	PImage sol;
	PImage sol2;
	PImage sol3;
	PImage sprite2;

	Ui ()
	{
		sol = loadImage("solidier.png");
		sol2 = loadImage("solidier2.png");
		sol3 = loadImage("solidier3.png");
		sprite = loadImage("blitz.jpg");
		sprite2 = loadImage("attackboost.jpg");
		spriteHeight = height * 0.1f;
		spriteWidth = width * 0.1f;
	}

	void init()
	{
	}

	void update()
	{
		//Checking if the button was pressed
	}

	void render()
	{
		//Display the Units that can be spawned
		if(canAffordSolidierLvl1)
		{
			tint(255, 255);
			image(sol, 0, MAP_HEIGHT, spriteWidth, spriteHeight);
		}
		else
		{
			tint(255, 127);
			image(sol, 0, MAP_HEIGHT, spriteWidth, spriteHeight);
		}

		if(canAffordSolidierLvl2)
		{
			tint(255, 255);
			image(sol2, width * 0.1f, MAP_HEIGHT, spriteWidth, spriteHeight);
		}
		else
		{
			tint(255, 127);
			image(sol2, width * 0.1f, MAP_HEIGHT, spriteWidth, spriteHeight);
		}

		if(canAffordSolidierLvl3)
		{
			tint(255, 255);
			image(sol3, width * 0.2f, MAP_HEIGHT, spriteWidth, spriteHeight);
		}
		else
		{
			tint(255, 127);
			image(sol3, width * 0.2f, MAP_HEIGHT, spriteWidth, spriteHeight);
		}

		//Displays the buffs that are availible
		if(blitzActive)
		{
			tint(255, 255);
			image(sprite, width * 0.5f, MAP_HEIGHT, spriteWidth, spriteHeight);
		}
		else
		{
			tint(255, 127);
			image(sprite, width * 0.5f, MAP_HEIGHT, spriteWidth, spriteHeight);
		}

		if(attackboostActive)
		{
			tint(255, 255);
			image(sprite2, width * 0.6f, MAP_HEIGHT, spriteWidth, spriteHeight);
		}
		else
		{
			tint(255, 127);
			image(sprite2, width * 0.6f, MAP_HEIGHT, spriteWidth, spriteHeight);
		}
	}

	void checkUIButtonPressed()
	{
		// println("method called");
		if(mousePressed && solSpawnTimer > 30)
		{
			if(mouseY > MAP_HEIGHT && mouseY < height
			   && mouseX > 0 && mouseX < spriteWidth)
			{
				// The level one solidier has been pressed
				solidierLvl1Bought = true;
			}

			if(mouseY > MAP_HEIGHT && mouseY < height
			   && mouseX > spriteWidth && mouseX < (spriteWidth * 2.0f))
			{
				// The level two solidier has been pressed
				solidierLvl2Bought = true;
			}

			if(mouseY > MAP_HEIGHT && mouseY < height
			   && mouseX > (spriteWidth * 2.0f) && mouseX < (spriteWidth * 3.0f))
			{
				// The level three solidier has been pressed
				solidierLvl3Bought = true;
			}

			if(mouseY > MAP_HEIGHT && mouseY < height
			   && mouseX > (spriteWidth * 5.0f) && mouseX < (spriteWidth * 6.0f))
			{
				// Blitz buff has been pressed
				blitzActive = true;
			}

			if(mouseY > MAP_HEIGHT && mouseY < height
			   && mouseX > (spriteWidth * 6.0f) && mouseX < (spriteWidth * 7.0f))
			{
				// Attack boost buff has been pressed
				attackboostActive = true;
			}

			solSpawnTimer = 0;
		}
	}

	void checkUIKeyPressed()
	{
		if(keyPressed && solSpawnTimer > 30)
		{
			if(keys['1'])
			{
				solidierLvl1Bought = true;
			}

			if(keys['2'])
			{
				solidierLvl2Bought = true;
			}

			if(keys['3'])
			{
				solidierLvl3Bought = true;
			}

			if(keys['A'])
			{
				attackboostActive = true;
			}	

			if(keys['B'])
			{
				blitzActive = true;
			}

			solSpawnTimer = 0;
		}
	}
}