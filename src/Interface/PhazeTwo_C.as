package Interface 
{
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author ...
	 */
	public class PhazeTwo_C extends PhazeTwo
	{
		private var isActive:Boolean = false;
		public var currStage:Object;
		
		public function PhazeTwo_C(_stageWidth:Number, _stageHeight:Number) 
		{
			this.gotoAndStop(1);
			this.buttonMode = false;
			this.x = _stageWidth - this.width;
			this.y = _stageHeight - this.height;
			this.addEventListener(MouseEvent.MOUSE_OVER, function():void {
				if(!isActive) gotoAndStop(3);
			});
			this.addEventListener(MouseEvent.MOUSE_OUT, function():void {
				if(!isActive) gotoAndStop(2);
			});			
		}
		
		public function setStageActive():void{
			currStage.alpha = 1;
		}
		
		//активность кнопки		
		public function setActive():void
		{
			//trace(23232323);
			this.buttonMode = true;
			isActive = true;
			this.gotoAndStop(3);
		}
		//активность кнопки
		public function setUnActive():void
		{
			this.buttonMode = false;
			isActive = false;
			this.gotoAndStop(1);
		}
	}

}