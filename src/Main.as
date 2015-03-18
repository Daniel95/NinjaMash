package  
{
	import flash.display.Sprite;
	import flash.utils.Timer;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author Daniël Brand
	 */
	public class Main extends Sprite //in dit script gaan we alles spawnen
	{
		public static var player:Player;
		private var enemies:Array;
		private var chests:Vector.<Chest>;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			enemies = new Array();
			
			player = new Player();
			this.addChild(player);
			
			for (var i:int = 0; i < 10; i++)
			{
				var enemy:Enemy = new Enemy();
				enemies.push(enemy);
				addChild(enemy);
				enemy.x = Math.random() * stage.stageWidth;
				enemy.y = Math.random() * stage.stageHeight;
			}
			
			player.x = 300;
			player.y = 300;
			
			chests = new Vector.<Chest>();
			
			createChests();
			
			
			//this.addEventListener(Event.ENTER_FRAME, loop);
		}
		private function createChests():void 
		{
			
		}
	}

}