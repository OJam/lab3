package objects 
{
	import flash.events.MouseEvent;
	import com.greensock.TweenLite;
	/**
	 * ...
	 * @author ...
	 */
	public class Material_C extends Material
	{
		private var startX:Number;
		private var startY:Number;
		public var isSet:Boolean = false;
		
		
		public function Material_C() 
		{
			startX = this.x;
			startY = this.y;
			this.buttonMode = true;			
		}
		
		public function setMaterial(_isset:Boolean):void{
			if (_isset) isSet = true;
			else isSet = false;
		}
		
		public function getX():Number{
			return startX;
		}
		public function getY():Number{
			return startY;
		}
	}

}