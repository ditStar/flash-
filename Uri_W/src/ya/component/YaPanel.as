package ya.component
{
	import flash.display.Stage;
	import flash.events.Event;
	
	import ya.interfaces.IDestroy;

	public class YaPanel implements IDestroy
	{
		private var _stage:Stage;
		public function YaPanel()
		{
		}
		
		private function addStage():void{
			_stage.addEventListener(Event.RESIZE,resizereFresh);
		}
		protected function resizereFresh(e:Event):void{
			
		}
		public function destroy():void
		{
		}
	}
}