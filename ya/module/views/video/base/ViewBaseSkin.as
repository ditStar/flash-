package ya.module.views.video.base
{
	import ya.component.YaCacheSprite;
	
	public class ViewBaseSkin extends YaCacheSprite
	{
		protected var _video:ViewBaseView;
		public function ViewBaseSkin(url:String)
		{
			super(url);
		}
		
		public function register(view:ViewBaseView):void{
			_video=view;
		}
		
		public function play():void{
			_video.pasvPlay();
		}
		
		public function seek(val:Number):void{
			_video.pasvSeek(val);
		}
		
		public function pause():void{
			_video.pasvPause();
		}
		
		public function stop():void{
			_video.pasvStop();
		}
		
		public function volume(level:Number):void{
			_video.pasvVolume(level)
		}
		
		public function param(param:Object):void{
		}
		
		public function pasvParam(param:Object):void{
		}
		
		public function playTime(int:String):void{
			
		}
		
		override public function destroy():void
		{
			
		}
	}
}