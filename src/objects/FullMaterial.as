package objects 
{
	import flash.automation.MouseAutomationAction;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import com.greensock.TweenLite;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author ...
	 */
	public class FullMaterial extends Sprite
	{
		private var info:InfMsg_C;
		private var material:Material_C;
		private var _this:FullMaterial;
		private var mask_:MovieClip;
		private var mask1_:MovieClip;
		private var materialName:String = "name";
		private var frameNumber:Number;
		public var zoomed:Materials_C;
		public var isUsed:Boolean = false;
		
		public function FullMaterial() 
		{
			material = new Material_C();
			material.buttonMode = true;
			_this = this;
			
			info = new InfMsg_C();			
			info.mouseEnabled = false;
			info.alpha = 0;
			addChild(material);
			
			material.addEventListener(MouseEvent.MOUSE_OVER, showInfo);
			material.addEventListener(MouseEvent.MOUSE_OUT, hideInfo);
				
			material.addEventListener(MouseEvent.MOUSE_DOWN, downHandler);
		}
		
		public function setFrame(numb:Number):void{ //
			this.frameNumber = numb;				//
		}											//	
													//номер кадра увеличенного материала
		public function getFrame():Number{			//
			return frameNumber;						//
		}											//
		
		public function setName(_name:String):void{
			materialName = _name;
			info.txt.text ="Материал " + materialName;
		}
		
		public function getName():String {
			return materialName;
		}
		private function showInfo(e:MouseEvent):void{
			addChild(info); 				
			info.x = 13;
			info.y = 5;
			TweenLite.to(info, 1, { alpha:1 } );
		}
		
		private function hideInfo(e:MouseEvent):void{
			TweenLite.to(info, 1, { alpha:0 } );
			removeChild(info); 	
		}
		
		public function setMask(_mask:MovieClip, _mask1:MovieClip):void{
			mask_ = _mask;
			mask_.alpha = 0.7;
			mask_.addEventListener(MouseEvent.MOUSE_OVER, hideMask);			
			mask_.addEventListener(MouseEvent.MOUSE_OUT, showMask);
			
			mask1_ = _mask1
			mask1_.alpha = 0.7;
		}
		
		private function showMask(e:MouseEvent):void{
			e.target.alpha = 0.7;
		}
		
		private function hideMask(e:MouseEvent):void{
			e.target.alpha = 0;
		}
		
		//начальные координаты
		private var startX:Number;
		private var startY:Number;
		
		private function downHandler(e:MouseEvent):void {
			material.removeEventListener(MouseEvent.MOUSE_OVER, showInfo);
			material.removeEventListener(MouseEvent.MOUSE_OUT, hideInfo);
			
			this.addEventListener(MouseEvent.MOUSE_UP, upHandler);
			this.stage.addEventListener(MouseEvent.MOUSE_MOVE, moveHandler);
			TweenLite.to(info, 0.3, { alpha:0 } );
			if(!material.isSet){
				startX = _this.x;
				startY = _this.y;
			}
			this.startDrag();
			
		}
		
		private function moveHandler(e:MouseEvent):void{
			e.updateAfterEvent();
			var point:Point = localToGlobal(new Point(mouseX, mouseY));
			if (mask_.hitTestPoint(point.x, point.y, true)) {
				mask_.alpha = 0;			
			}
			else{
				mask_.alpha = 0.7;
			}
		}
		
		private function upHandler(e:MouseEvent):void {
			material.addEventListener(MouseEvent.MOUSE_OVER, showInfo);
			material.addEventListener(MouseEvent.MOUSE_OUT, hideInfo);	
			isUsed = true; //просмотрен ли материал
			this.stopDrag();
			this.zoomed.frameNumber = this.frameNumber;
			var point:Point = localToGlobal(new Point(mouseX, mouseY));
			if (mask_.hitTestPoint(point.x, point.y, true)) {
				trace(mouseX);
				e.currentTarget.x = mask_.x + 35;
				e.currentTarget.y = mask_.y - 10;	
				material.setMaterial(true);
				mask1_.alpha = 0.7;
				mask1_.mouseEnabled = true;
				mask1_.buttonMode = true;
				mask1_.addEventListener(MouseEvent.MOUSE_OVER, function():void { mask1_.alpha = 0; } );
				mask1_.addEventListener(MouseEvent.MOUSE_OUT, function():void { mask1_.alpha = 0.7; } );
				mask_.removeEventListener(MouseEvent.MOUSE_OVER, hideMask);			
				mask_.removeEventListener(MouseEvent.MOUSE_OUT, showMask);
			}
			else {
				mask1_.alpha = 0;
				mask1_.buttonMode = false;
				mask1_.mouseEnabled = false;
				
				material.setMaterial(false);
				e.currentTarget.x = startX;
				e.currentTarget.y = startY;
				
			}				
		}
	}

}