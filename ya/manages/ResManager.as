package ya.manages
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.system.ApplicationDomain;
	import flash.utils.Dictionary;
	
	import ya.component.YaLoaderBinary;
	import ya.component.YaReflection;
	
	public class ResManager extends EventDispatcher
	{
		private static var _instance:ResManager;
		public static function get instance():ResManager{
			if(_instance==null){
				_instance=new ResManager();
			}
			return _instance;
		}
		
		private var _urlList:Dictionary=new Dictionary();
		public function ResManager(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		private var _urlCall:Dictionary=new Dictionary();
		public function load(url:String,call:Function):void{
			if(_urlList[url]){
				call();
			}else{
				if(_urlCall[url]==null){
					_urlCall[url]=[];
					new YaLoaderBinary(url,loadCompleteFun);
				}
				_urlCall[url].push(call);
			}
		}
		private function loadCompleteFun(url:String,app:ApplicationDomain):void{
			_urlList[url]=app;
			var funArr:Array=_urlCall[url];
			for each(var fun:Function in funArr){
				fun();
			}
			_urlCall[url]=null;
			delete _urlCall[url];
		}
		
		public function getInstanceObj(className:String,appName:String=""):*{
			return YaReflection.createInstance(className,_urlList[UrlManager.instance.getResUrl(appName)]);
		}
	}
}