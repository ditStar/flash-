package ya.manages
{
	/**
	 * 错误管理器 
	 * @author wangshuang
	 * 
	 */	
	public class ErrorManager
	{
		public function ErrorManager()
		{
		}
		
		public function error():void{
			
		}
		
		public static function singleError(param:Object):void{
			if(param){
				throw new Error("single");
			}
		}
	}
}