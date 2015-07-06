package objects 
{
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import logic.RND;
	/**
	 * ...
	 * @author ...
	 */
	public class StageOne_C extends StageOne
	{
		
		private var materials:Array = [];
		private var addedMaterials:Array = [];
		private var zoomedMaterials:Materials_C;
		private var rnd:RND;
		
		public function StageOne_C(_stage:Stage) 
		{
			rnd = new RND(10);
			
			this.alpha = 0;
			this.mouseEnabled = false;
			this.x = _stage.stageWidth - this.width;
			this.y = 48;
			
			//создаем материалы(объединить инфо и сам материал в отдельный класс)
			for (var i:int = 0 ; i < 11; i++){
				materials[i] = new FullMaterial();
				materials[i].setFrame(i+1);
				materials[i].setMask(mask_, mask1_);
			}
			for (var i:int = 0 ; i < 5; i++) {	
				var a:Number = rnd.getNum();
				trace(a);
				addedMaterials[i] = materials[a];
				addChild(addedMaterials[i]);
				addedMaterials[i].y = 250 - i * 7.5;
				addedMaterials[i].x = 140 + i * 40;
			}
			materials[0].setName("A");
			materials[1].setName("B");
			materials[2].setName("C");
			materials[3].setName("D");
			materials[4].setName("E");
			materials[5].setName("F");
			materials[6].setName("G");
			materials[7].setName("H");
			materials[8].setName("I");
			materials[9].setName("J");
			materials[10].setName("K");
			
			mask1_.alpha = 0;
			mask1_.addEventListener(MouseEvent.CLICK, function():void {zoomedMaterials.show();}	);
			
			mask_.buttonMode = true;
			
			trace(_stage.height);
			
		}
		
		public function setZoomedMaterials(zm:Materials_C):void{
			this.zoomedMaterials = zm;
			for (var i:int = 0 ; i < 11; i++){
				materials[i].zoomed = zoomedMaterials;
			}
		}
		
		public function setActive():void{
			this.alpha = 1;
			this.mouseEnabled = true;
		}
		
		public function setUnActive():void{
			this.alpha = 0;
			this.mouseEnabled = false;
		}
		
		public function onRes(Width:Number, Height:Number):void{
			this.width = Width*0.95;
			this.height = this.width / 16 *  9;
			this.y = Height / 2 - this.height / 2;
			this.x = Width - this.width - 20;
			zoomedMaterials.onRes();
		}
	}

}