package  
{
	import flash.events.KeyboardEvent;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Daniel Brand
	 */
	
	 
	public class Player extends CharBase//dit script controlled de player
	{
		private var key:int;
		private var speed:int = 5;
		private var jump:int;
		public static var player:PlayerArt;
		//private var tankTurret:TankTurretArt;
		
		public function Player() 
		{
			player = new PlayerArt();
			this.addChild(player);
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}		
			
		override public function loop(e:Event):void 
		{		
			this.x += speed;
			this.y -= jump;
			if (key == 2)
			{	
				//jump += 5;
			}
			/*
			if (doublePressTimer <= 0)//als je niet binnen zoveel tijd weer klikt
			{
				key = 0;
			}
			*/
			
			super.loop(e);//zorgt ervoor dat de code in tankbase loop ook nog wordt uitgevoert	
		}
		private function onKeyUp(e:KeyboardEvent):void 
		{
			if (e.keyCode != 32)
			{
				
			}
		}		
		private function onKeyDown(e:KeyboardEvent):void 
		{
			if (e.keyCode == 32)//space
			{
				key += 1;
				speed -= (speed * 2);//turns around
				//doublePressTimer.start();
			}
		}
		override public function destroy():void
		{
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			super.destroy();
		}
	}

}