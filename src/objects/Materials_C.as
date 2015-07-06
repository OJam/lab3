package objects 
{
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import com.greensock.TweenLite;
	/**
	 * ...
	 * @author ...
	 */
	public class Materials_C extends Materials
	{
		public var frameNumber:Number;
		private var stage_:Stage;
		
		public function Materials_C(_stage:Stage) 
		{
			this.addEventListener(MouseEvent.CLICK, hide);	
			this.zoomedM.mouseEnabled = false;
			this.stage_ = _stage;
			this.bg.width = _stage.width;
			this.bg.height = _stage.height - 48;
			this.zoomedM.x = _stage.width / 2 - zoomedM.width / 2;
			this.zoomedM.y = _stage.height / 2 - zoomedM.height / 2 - 68;
		}
		
		public function hide(e:MouseEvent):void{
			bg.mouseEnabled = false;
			this.mouseEnabled = false;
			this.buttonMode = false;
			//TweenLite.to(this, 0.5, { alpha:0 } );
			this.alpha = 0;
		}
		
		public function show():void {
			this.zoomedM.gotoAndStop(frameNumber);
			this.y = 48;	
			bg.mouseEnabled = true;
			this.mouseEnabled = true;
			this.buttonMode = true;
			this.alpha = 1;
		}
		
		public function onRes():void {
			this.zoomedM.width = 500;
			this.zoomedM.height = 429.75;
			this.zoomedM.x = this.zoomedM.x = stage_.width / 2 - zoomedM.width / 2;
			this.zoomedM.y =stage_.height / 2 - zoomedM.height / 2 - 68;
			this.bg.width = stage_.width;
			this.bg.height = stage_.height;
		}
	}

}