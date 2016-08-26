package ya.module.controller
{
	import ya.manages.ErrorManager;

	public class SystemController extends BaseController
	{
		private static var _instance:SystemController;
		public static function get instance():SystemController{
			if(_instance==null){
				_instance=new SystemController();
			}
			return _instance;
		}
		public function SystemController(){
			ErrorManager.singleError(_instance);
		}
	}
}