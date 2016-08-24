package ya.component
{
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	
	public class YaLoaderBinary extends EventDispatcher
	{
		private var _urlloader:URLLoader;
		private var _loader:Loader;
		private var _url:String;
		private var _rqst:URLRequest;
		
		private var _call:Function;
		public function YaLoaderBinary(url:String,complete:Function)
		{
			_call=complete;
			_url    = url;
			_rqst = new URLRequest(_url)
			_urlloader = new URLLoader();
			_urlloader.addEventListener(Event.COMPLETE, completeHandler);
			_urlloader.addEventListener(ProgressEvent.PROGRESS,progressHanlder);
			_urlloader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);
			_urlloader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			_urlloader.dataFormat = URLLoaderDataFormat.BINARY;
			_urlloader.load(_rqst);
		}
		
		private function completeHandler(event:Event):void {
			var data:ByteArray = new ByteArray();
			data = event.target.data;
			if(data==null){
			
			}else{
				_loader = new Loader();
				_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, __loadComplete);
				_loader.loadBytes(data);
			}
		}
		
		private function __loadComplete(e:Event):void{
			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, __loadComplete);
			
			
			var swfInfo:LoaderInfo=LoaderInfo(e.target);
			_call(_url,swfInfo.applicationDomain);
		}
		
		private function progressHanlder(event:ProgressEvent):void{		
		}
		
		private function httpStatusHandler(event:HTTPStatusEvent):void{
		}
		
		private function onSecurityError(evt:SecurityErrorEvent):void
		{
			this.dispose();
		}
		
		private function ioErrorHandler(evt:IOErrorEvent):void {
		}
		
		public function dispose():void{
			if(_urlloader){
				_urlloader.removeEventListener(Event.COMPLETE, completeHandler);
				_urlloader.removeEventListener(ProgressEvent.PROGRESS,progressHanlder);
				_urlloader.removeEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
				_urlloader.removeEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
				_urlloader.close();
				_urlloader = null;
			}
		}
		
		public function disposeLoader():void{
			if(_loader){
				_loader.unloadAndStop();
				_loader = null;
			}
			this._rqst = null;
		}
	}
}