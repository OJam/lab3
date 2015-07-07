package objects 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.PNGEncoderOptions;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import com.greensock.TweenLite;
	import flash.geom.Matrix;
	import flash.net.FileReference;
	import flash.utils.ByteArray;
	import com.adobe.images.JPGEncoder;
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
			this.bg.height = _stage.stageHeight - 48;
			this.zoomedM.x = _stage.width / 2 - zoomedM.width / 2;
			this.zoomedM.y = _stage.height / 2 - zoomedM.height / 2 - 68;
			this.saveBut.addEventListener(MouseEvent.CLICK, takeScreen);
			this.saveBut.x = this.width - this.saveBut.width;
			this.saveBut.buttonMode = true;
			this.saveBut.y = this.height - 60;
			this.saveMat.alpha = 0;
			this.saveMat.mouseEnabled = false;
			this.saveMat.width = 400;
			this.saveMat.height = 343.80;
		}
		
		private function takeScreen(e:MouseEvent):void {
						
			var jpgEncoder:JPGEncoder = new JPGEncoder(90);
			
			var bitmapData:BitmapData = new BitmapData(saveMat.width, saveMat.height - 20);
			bitmapData.draw(saveMat, new Matrix());
			
			var img:* = jpgEncoder.encode(bitmapData);
			
			var file:FileReference = new FileReference();
			file.save(img, "screen.jpg");
		}
		
		public function hide(e:MouseEvent):void{
			bg.mouseEnabled = false;
			this.mouseEnabled = false;
			this.buttonMode = false;
			this.saveBut.buttonMode = false;
			this.saveBut.mouseEnabled = false;
			//TweenLite.to(this, 0.5, { alpha:0 } );
			this.alpha = 0;
		}
		
		public function show():void {
			this.saveMat.gotoAndStop(frameNumber);
			this.zoomedM.gotoAndStop(frameNumber);
			this.y = 48;	
			bg.mouseEnabled = true;
			this.mouseEnabled = true;
			this.buttonMode = true;
			this.alpha = 1;
			this.saveBut.buttonMode = true;
			this.saveBut.mouseEnabled = true;
		}
		
		public function onRes():void {
			//this.zoomedM.width = 500;
			//this.zoomedM.height = 429.75;
			//this.zoomedM.x = this.zoomedM.x = stage_.width / 2 - zoomedM.width / 2;
			//this.zoomedM.y =stage_.height / 2 - zoomedM.height / 2 - 68;
			//this.bg.width = stage_.width;
			//this.bg.height = stage_.height;
			this.bg.width = stage_.stageWidth;
			this.bg.height = stage_.stageHeight - 48;
			this.zoomedM.x = stage_.stageWidth / 2 - zoomedM.width / 2;
			this.zoomedM.y = stage_.stageHeight / 2 - zoomedM.height / 2;
		}
	}

}