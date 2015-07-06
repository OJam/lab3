package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import Interface._scrollBar.ScrollBar_C;
	import Interface.Header_C;
	import Interface.MainBanner;
	import Interface.PhazesInfo;
	import objects.Material_C;
	import objects.Materials_C;
	import objects.Preview;
	import objects.StageOne_C;
	/**
	 * ...
	 * @author Nikolaev Yuriy
	 */
	[Frame(factoryClass="Preloader")]
	public class Main extends Sprite 
	{
		private var mainBan:MainBanner;
		private var phazesInfo:PhazesInfo;
		private var scrollBar:ScrollBar_C;
		private var preview:Preview;
		private var stageOne:StageOne_C;
		private var stages:Array = new Array;
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event = null):void 
		{
			stage.addEventListener(Event.RESIZE, onRes);
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			//рисуем баннер
			mainBan = new MainBanner(stage.stageWidth, stage.stageHeight);
			addChild(mainBan);
			//рисуем скроллбар
			scrollBar = new ScrollBar_C(stage);			
			addChildAt(scrollBar, 0);
			//рисуем информацию о сценах и кнопки переключения
			phazesInfo = new PhazesInfo(stage.stageWidth, stage.stageHeight);
			addChild(phazesInfo);
			//превью
			preview = new Preview("videos/preview.flv");
			stages[0] = preview;
			addChildAt(preview, 0);
			preview.onRes(stage.stageWidth, stage.stageHeight);
			//первый этап
			stageOne = new StageOne_C(stage);
			trace(stage.stageWidth);
			stages[1] = stageOne;
			addChildAt(stages[1], 1);
			stages[1].setUnActive();
			
			var zoomedMaterials:Materials_C;
			zoomedMaterials = new Materials_C(stage);
			addChild(zoomedMaterials);
			zoomedMaterials.hide(null);
			stageOne.setZoomedMaterials(zoomedMaterials);
			///!!!!!!!!!!!!!!
			//stageOne.mask1_.addEventListener(MouseEvent.CLICK, function():void {zoomedMaterials.show();}	);
			
			phazesInfo.setStages(stages);
			onRes(null);
		}
		
		protected function getStage(stageNum:Number):Object
		{
			if(stages[stageNum]) 
				return stages[stageNum];
			else
				return 0;
		}
		
		protected function getStages():Array
		{
			return stages;
		}
		
		//функция перерисовки при изменении размеров
		private function onRes(e:Event):void{
			mainBan.onRes(stage.stageWidth, stage.stageHeight);
			phazesInfo.onRes(stage.stageWidth, stage.stageHeight);
			scrollBar.onRes(stage.stageHeight);
			preview.onRes(stage.stageWidth, stage.stageHeight);
			stageOne.onRes(stage.stageWidth, stage.stageHeight);
		}
	}

}