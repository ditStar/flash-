package ya.module.views.video.base
{
	import flash.media.SoundTransform;
	import flash.net.NetStream;
	
	import ya.component.YaCacheSprite;
	import ya.component.events.EventName;
	import ya.component.events.ParamEvent;
	import ya.component.events.YaDispatcher;
	
	public class ViewBaseView extends YaCacheSprite
	{
		protected var _skin:ViewBaseSkin;
		protected var _stream:NetStream;
		public function get getPlayTime():int{
			if(_stream){
				return _stream.time;
			}else{
				return 0;
			}
		}
		protected var _soundTransform:SoundTransform;
		public function ViewBaseView(url:String=null)
		{
			super(url);
		}
		
		public function register(skin:ViewBaseSkin):void{
			if(_skin!=null&&_skin==skin){
				_skin.destroy();
			}
			_skin=skin;
			_skin.register(this);
		}
		
		public function play():void{
			
		}
		public function seek():void{
			
		}
		public function pause():void{
			
		}
		public function stop():void{
			
		}
		public function volume(level:Number):void{
			streamVolume(level);
		}
		public function param(param:Object):void{
			_skin.pasvParam(param);
		}
		
		public function pasvPlay():void{
			_stream.resume();
			YaDispatcher.instance.dispatchEvent(new ParamEvent(EventName.Video_Play_State,true));
		}
		public function pasvSeek(val:Number):void{
			_stream.seek(val);
		}
		public function pasvPause():void{
			_stream.pause();
			YaDispatcher.instance.dispatchEvent(new ParamEvent(EventName.Video_Play_State,false));
		}
		public function pasvVolume(level:Number):void{
			streamVolume(level);
		}
		
		protected function streamVolume(level:Number):void{
			_soundTransform.volume = level / 100;
			if (_stream) {
				_stream.soundTransform = _soundTransform;
			}
		}
		public function pasvStop():void{
		}
		
		public function pasvParam(param:Object):void{
		}
		
		override public function destroy():void
		{
			
		}
	}
}