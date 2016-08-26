package ya.module.views.video
{
	import flash.events.NetStatusEvent;
	import flash.media.SoundTransform;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.utils.getTimer;
	
	import ya.component.YaImageProxy;
	import ya.manages.ConfigManager;
	import ya.manages.LayerManager;
	import ya.manages.LogManager;
	import ya.manages.UrlManager;
	import ya.module.model.player.vo.VideoVo;
	import ya.module.views.video.base.ViewBaseView;
	import ya.module.views.video.item.VideoCommonSkin;
	import ya.utils.YaUtils;
	
	public class VideoLiveView extends ViewBaseView
	{
		private var _video:Video;
		private var _connection:NetConnection;
		
		private var _logo:YaImageProxy;
		public function VideoLiveView()
		{
			this.graphics.clear();
			this.graphics.beginFill(0x000000,1);
			this.graphics.drawRect(0,0,ConfigManager.W_video,ConfigManager.H_video);
			this.graphics.endFill();
			
			
			initView();
			addEvent();
		}
		
		private function initView():void{
			_video = new Video(1280, 720);
			_video.smoothing=true;
			this.addChild(_video);
			
			_logo=new YaImageProxy(UrlManager.instance.getResUrl('art1.jpg'));
			this.addChild(_logo);
			
			_connection = new NetConnection();
			_connection.connect(null);
			
			_stream = new NetStream(_connection);
			
			_soundTransform=new SoundTransform();
			
			var clientobj:Object=new Object(); 
			clientobj.onMetaData=clientFun;	
			_stream.client=clientobj; 
			
			_video.attachNetStream(_stream);
		}
		
		private function addEvent():void{
			_stream.addEventListener(NetStatusEvent.NET_STATUS,streamEventFun);
		}
		
		private function streamEventFun(e:NetStatusEvent):void{
			switch(e.info.code){
				case "NetStream.Play.Start":
					updateLayout();
					LogManager.log(getTimer()/1000);
					this.register(new VideoCommonSkin());
					break;
				case 'NetStream.Buffer.Full':
					LogManager.log(getTimer()/1000);
					break;
			}
			LogManager.log("流状态："+e.info.code);
		}
		
		private function clientFun(o:Object):void{
		}
		
		public function setVideoVo(vo:VideoVo):void{
			var url:String=vo.linesAr[0];
			_stream.play(url);
		}
		
		public function initParant():void{
			LayerManager.Layer_Video.addChild(this);
		}
		
		public function updateLayout():void{
			var normalW:int=ConfigManager.W_video;
			var normalH:int=ConfigManager.H_video;
			
			var percentage:Number=Math.min(ConfigManager.W_Video_Gap/_video.videoWidth,ConfigManager.H_Video_Gap/_video.videoHeight);
			_video.width=_video.videoWidth*percentage;
			_video.height=_video.videoHeight*percentage;
			
			YaUtils.setCenterByDisplayObject(_video);
		}
		
		override public function destroy():void
		{
			if(this.parent){
				this.parent.removeChild(this);
			}
			_stream.pause();
			_stream.dispose();
			_stream=null;
			_video=null;
			_connection=null;
		}
	}
}