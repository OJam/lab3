package Interface 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	/**
	 * информация о лабораторной вместе с кнопакми и переключением стадий
	 * @author Nikolaev Yuriy
	 */
	public class PhazesInfo extends Sprite
	{
		private var stageInfo:StageInfo_C;
		private var zeroPhaze:ZeroPhaze_C;
		public var buttons:Array;
		private var stages:Array;
		
		public function PhazesInfo(_stageWidth:Number, _stageHeight:Number) 
		{
			buttons = new Array;
			buttons[0] = new ZeroPhaze_C(_stageWidth, _stageHeight);
			buttons[1] = new PhazeOne_C(_stageWidth, _stageHeight);	
			stageInfo = new StageInfo_C(_stageWidth, _stageHeight, buttons);
			addChild(stageInfo);
			addChild(buttons[0]);
			addChild(buttons[1]);
			
			onRes(_stageWidth, _stageHeight);
			//включаем превью
			buttons[0].addEventListener(MouseEvent.CLICK, function():void{
				stageInfo.gotoAndStop(1);
				buttons[1].setUnActive();
				//buttons[2].setUnActive();
			});
			//включаем первую стадию
			buttons[1].addEventListener(MouseEvent.CLICK, function():void{
				stageInfo.gotoAndStop(2);
				buttons[1].setActive();
				//buttons[2].setActive();
			});
			
		}
		
		//переключение между сценами
		public function setStages(_stages:Array):void
		{	
			
			buttons[0].addEventListener(MouseEvent.CLICK, function():void{
				_stages[0].alpha = 1;
				_stages[1].alpha = 0;
				_stages[1].setUnActive();
			});
			buttons[1].addEventListener(MouseEvent.CLICK, function():void{
				_stages[1].alpha = 1;
				_stages[1].setActive();
				_stages[0].alpha = 0;
			});
		}
		
		public function getBut(num:Number){
			return buttons[num];
		}
		
		public function onRes(_stageWidth:Number, _stageHeight:Number):void{
			stageInfo.onRes(_stageWidth, _stageHeight, buttons);
			var butWidth:Number = 0;
			var butHeight:Number = 0;
				for (var i:Number = buttons.length-1; i >= 0; i--) {
					butWidth += buttons[i].width;
					butHeight = buttons[i].height;
					buttons[i].x = _stageWidth - butWidth;
					buttons[i].y = _stageHeight - butHeight;
				}
		}
	}

}