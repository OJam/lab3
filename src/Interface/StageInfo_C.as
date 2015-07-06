package Interface 
{
	/**
	 * ...
	 * @author Nikolaev Yuriy
	 */
	public class StageInfo_C extends StageInfo
	{
		
		public function StageInfo_C(_stageWidth:Number, _stageHeight:Number, buttonsArray:Array) 
		{
			gotoAndStop(1);
			this.x = _stageWidth - this.width - 49 * buttonsArray.length + 11;
			this.y = _stageHeight - this.height;
		}
		
		public function onRes(_stageWidth:Number, _stageHeight:Number, buttonsArray:Array):void{
			this.x = _stageWidth - this.width - 49 * buttonsArray.length + 11;
			this.y = _stageHeight - this.height;
		}
	}

}