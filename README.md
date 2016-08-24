# flash-
版本1：2016/8/24
1.由于是1天时间写的demo还有许多细节并不完善，但基本框架有了
2.主文件16K,秒开视频，延迟组件初始化；可插拔播放器皮肤，异步延迟加载机制，统一世界时间，弹幕缓存机制
3.结构简介
component 基础组件库
managers 一些管理器js debug 右键 层级 资源 错误 配置 url...等管理器，目的就是避免到处乱调用js接口 显示层混乱等等...
module  模块文件 包含view controller model 子级文件，主要是为了模块划分减小耦合。模块间通信最好通过controller来处理。
4：类介绍
 YaCacheSprite 主要处理了数据和资源的异步使用问题。
 BarrageBaseItem 弹幕基类，只要复写frameAction函数就可以在世界时间下实现自己的扩展动作。
 ViewBaseView 解析视频流类 ViewBaseSkin 视频的皮肤包括暂停 快进 声音等 可以自己扩展。
