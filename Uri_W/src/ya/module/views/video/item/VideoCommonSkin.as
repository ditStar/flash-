package ya.module.views.video.item
{
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import ya.component.YaImageProxy;
	import ya.component.YaStaticString;
	import ya.manages.LayerManager;
	import ya.manages.ResManager;
	import ya.manages.UrlManager;
	import ya.module.views.barrage.manager.BarrageRenderManager;
	import ya.module.views.video.base.ViewBaseSkin;
	import ya.utils.YaFactory;
	import ya.utils.YaUtils;
	
	public class VideoCommonSkin extends ViewBaseSkin
	{
		public function VideoCommonSkin()
		{
			super(UrlManager.instance.getResUrl(YaStaticString.VideoCommonSkin));
			LayerManager.Layer_UI.addChild(this);
		}
		
		private var _bg:Sprite;
		private var _playStateBtn:SimpleButton;
		private var _pauseStateBtn:SimpleButton;
		private var _musicHasBtn:SimpleButton;
		private var _musicNoBtn:SimpleButton;
		private var _yaTxt:TextField;
		override protected function initView():void{
			this.mouseEnabled=false;
			
			_bg=new Sprite();
			_bg.alpha=0.8;
			_bg.graphics.beginFill(0x000000);
			_bg.graphics.drawRect(0,0,_stage.stageWidth,40);
			_bg.graphics.endFill();
			this.addChild(_bg);
			
			_playStateBtn=ResManager.instance.getInstanceObj("VideoCommonSkin_Play_State_RES",YaStaticString.VideoCommonSkin);
			this.addChild(_playStateBtn);
			_playStateBtn.visible=true;
			
			_pauseStateBtn=ResManager.instance.getInstanceObj("VideoCommonSkin_Pause_State_RES",YaStaticString.VideoCommonSkin);
			this.addChild(_pauseStateBtn);
			_pauseStateBtn.visible=false;
			
			_yaTxt=YaFactory.getTextFied({"filter":true,"size":20,"mouseEnabled":false});
			this.addChild(_yaTxt);
			
			_musicHasBtn=ResManager.instance.getInstanceObj("VideoCommonSkin_Has_Music_RES",YaStaticString.VideoCommonSkin);
			this.addChild(_musicHasBtn);
			_musicHasBtn.visible=true;
			
			_musicNoBtn=ResManager.instance.getInstanceObj("VideoCommonSkin_No_Music_RES",YaStaticString.VideoCommonSkin);
			this.addChild(_musicNoBtn);
			_musicNoBtn.visible=false;
			
			addEvent();
			resizeFresh();
		}
		
		override protected function addEvent():void{
			_playStateBtn.addEventListener(MouseEvent.CLICK,eventFun);
			_pauseStateBtn.addEventListener(MouseEvent.CLICK,eventFun);
			_musicHasBtn.addEventListener(MouseEvent.CLICK,eventFun);
			_musicNoBtn.addEventListener(MouseEvent.CLICK,eventFun);
			BarrageRenderManager.instance.add(updateFun);
		}
		
		override protected function removeEvent():void{
			_playStateBtn.removeEventListener(MouseEvent.CLICK,eventFun);
			_pauseStateBtn.removeEventListener(MouseEvent.CLICK,eventFun);
			_musicHasBtn.removeEventListener(MouseEvent.CLICK,eventFun);
			_musicNoBtn.removeEventListener(MouseEvent.CLICK,eventFun);
			BarrageRenderManager.instance.remove(updateFun);
		}
		
		override public function destroy():void
		{
			removeEvent();
			_bg=null;
			_playStateBtn=null;
			_pauseStateBtn=null;
			_musicHasBtn=null;
			_musicNoBtn=null;
			_yaTxt=null;
		}
		
		private function updateFun():void{
			this.playTime(YaUtils.secToTime(_video.getPlayTime));
		}
		
		override protected function resizeFresh():void{
			_pauseStateBtn.x=_playStateBtn.x=10;
			_pauseStateBtn.y=_playStateBtn.y=_stage.stageHeight-25;
			
			_musicHasBtn.x=_musicNoBtn.x=140;
			_musicHasBtn.y=_musicNoBtn.y=_stage.stageHeight-25;
			
			_bg.y=_stage.stageHeight-_bg.height;
			
			_yaTxt.x=50;
			_yaTxt.y=_stage.stageHeight-30;
		}
		
		override public function playTime(str:String):void{
			_yaTxt.text=str;
		}
		
		private function eventFun(e:MouseEvent):void{
			if(e.currentTarget==_playStateBtn){
				_video.pasvPause();
				_playStateBtn.visible=!(_pauseStateBtn.visible=true);
			}else if(e.currentTarget==_pauseStateBtn){
				_video.pasvPlay();
				_playStateBtn.visible=!(_pauseStateBtn.visible=false);
			}else if(e.currentTarget==_musicHasBtn){
				_video.volume(0);
				_musicHasBtn.visible=!(_musicNoBtn.visible=true);
			}else if(e.currentTarget==_musicNoBtn){
				_video.volume(100);
				_musicHasBtn.visible=!(_musicNoBtn.visible=false);
			}
		}
	}
}