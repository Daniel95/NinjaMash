package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author Daniël Brand
	 */
	public class ninjaMash extends MovieClip 
	{
		public var Player:MovieClip;
		private var key:int;
		private var speed:int = 5;
		private var jump:int;
		
		private var doublePressTime:int = 0;
		
		public function ninjaMash() 
		{
			//setup listeners to listen for when a key is pressed and released
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
			//setup a game loop event listener
			stage.addEventListener(Event.ENTER_FRAME, gameLoop);
			
		}
		
		private function gameLoop(e:Event):void //update function
		{
			Player.x += speed;
			Player.y += jump;
			if (key == 2)
			{	
				jump += 5;
			}
			if (doublePressTime <= 0)
			{
				key = 0;
			}
		}
		
		private function keyDown(e:KeyboardEvent):void
		{
			if (e.keyCode == 32)
			{
				key += 1;
				speed -= (speed * 2);
				//doublePresstime + time
			}
		}
		
		private function keyUp(e:KeyboardEvent):void 
		{
			if (e.keyCode != 32)
			{
				
			}
		}
		
	}

}