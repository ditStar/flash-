package ya.component
{
	import flash.utils.Dictionary;
	
	import ya.manages.ResManager;
	
	public class YaCacheSprite extends YaSprite
	{
		private var _cacheVo:Dictionary=new Dictionary();
		private var _hasRes:Boolean=false;
		public function YaCacheSprite(url:String=null)
		{
			super();
			if(url&&url!=""){
				ResManager.instance.load(url,resManagerCall);
				ResManager.instance.load(url,resManagerCall);
				ResManager.instance.load(url,resManagerCall);
			}
		}
		
		protected function resManagerCall():void{
			_hasRes=true;
			initView();
			refshCache();
		}
		
		public function setCacheVo(key:Object,vo:Object):void{
			if(_hasRes){
				updateCacheVo(key,vo);
			}else{
				_cacheVo[key]=vo;
			}
		}
		
		private function refshCache():void{
			for(var key:Object in _cacheVo){
				updateCacheVo(key,_cacheVo[key]);
				delete _cacheVo[key];
			}
		}
		
		protected function updateCacheVo(key:Object,vo:Object):void{
			
		}
		
		override public function destroy():void{
			
		}
	}
}