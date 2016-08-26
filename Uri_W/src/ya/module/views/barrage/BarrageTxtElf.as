package ya.module.views.barrage
{
	import flash.text.TextField;
	
	import ya.utils.YaFactory;

	public class BarrageTxtElf extends BarrageBaseElf
	{
		private var _txt:TextField;
		public function BarrageTxtElf()
		{
			super();
		}
		
		override public function initView():void{
			_txt=YaFactory.getTextFied({"mouseEnabled":false});
			this.addChild(_txt);
		}
	}
}