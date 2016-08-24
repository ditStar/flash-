package ya.module.views.barrage
{
	import flash.text.TextField;
	
	import ya.module.model.barrage.vo.BarrageVo;
	import ya.utils.YaFactory;

	public class BarrageRightTxtItem extends BarrageBaseItem
	{
		private var _txt:TextField;
		public function BarrageRightTxtItem()
		{
			super();
		}
		
		override public function initView():void{
			_txt=YaFactory.getTextFied({"mouseEnabled":false,'size':24,"filter":true,"color":0xffffff*Math.random()});
			this.addChild(_txt);
		}
		
		override public function setVo(vo:BarrageVo):void{
			_txt.text=vo.uname;
			super.setVo(vo);
		}
	}
}