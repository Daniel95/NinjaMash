package  
{
	import flash.display.MovieClip;
	//import flash.display.DisplayObject
	import flash.events.Event;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Daniël Brand
	 */
	public class CharBase extends MovieClip//in dit script komen de overeenkomsten van de player en anderen characters
	//bv dat als je tegen een muur aan loop, dat je dan de anderen richting op gaat
	{
		//protected var tankBody:TankBodyArt;
		
		public var lives:int = 6;
		private var speed:int = 5;
		private var _chests:Vector.<Chest>;
		
		public function CharBase(chests:Vector.<Chest> = null) 
		{
			_chests = chests;
			trace(chests);
			
			this.addEventListener(Event.ENTER_FRAME, loop);
			//tankBody = new TankBodyArt();
			//this.addChild(tankBody);
			//tankTurret = new TankTurretArt();
			//this.addChild(tankTurret);	
			
			addEventListener(Event.ENTER_FRAME, loop);
			this.scaleX = this.scaleY = 0.2;
		}
		public function loop(e:Event):void 
		{
			this.x += speed;
			
			deadEnd();
		}
		public function destroy():void
		{
			this.removeEventListener(Event.ENTER_FRAME, loop);
		}
		public function deadEnd():void
		{
			var length:int = _chests.length;
			for (var i:int = 0; i < length;i++ )
			{
				if (this.hitTestObject(_chests[i]))
				{
					speed -= (speed * 4);//turns around
				}
			}
			
		}
	}

}