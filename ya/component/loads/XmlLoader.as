package ya.component.loads
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	public class XmlLoader extends URLLoader
	{
		private var _fun:Function;
		private var _url:String;
		public function XmlLoader(url:String,callFun:Function)
		{
			_url=url;
			_fun=callFun;
			
			this.addEventListener(Event.COMPLETE,completeFun);
			this.addEventListener(IOErrorEvent.IO_ERROR,errorfun);
			this.addEventListener(SecurityErrorEvent.SECURITY_ERROR,errorfun);
			this.load(new URLRequest(url));
		}
		private function completeFun(e:Event):void{
			if(_fun)_fun(e.target.data);
		}
		
		private function errorfun(e:Event):void{
			
		}
	}
}