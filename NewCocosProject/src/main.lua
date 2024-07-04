

---- 添加搜索路径，为了避免运行时获取不到目录文件，将其置顶
--local writePath = cc.FileUtils:getInstance():getWritablePath()
--local resSearchPaths = {
--    writePath,
--    writePath .. "lua_classes/",
--    writePath .. "src/",
--    writePath .. "res/",
--    "lua_classes/",
--    "src/",
--    "res/",
--}
--cc.FileUtils:getInstance():setSearchPaths(resSearchPaths)

cc.FileUtils:getInstance():setPopupNotify(false)
cc.FileUtils:getInstance():addSearchPath("src/")
cc.FileUtils:getInstance():addSearchPath("res/")

--local breakSocketHandle,debugXpCall = require("LuaDebugjit")("localhost",7003)
--CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(breakSocketHandle ,0.3,false)


require "config"
require "cocos.init"

local function main()
    print("====进入main函数")
    require("app.MyApp"):create():run()
end


----如果已经存在 __G__TRACKBACK__ 请将 debugXpCall 直接加入 __G__TRACKBACK__ 即可
----__G__TRACKBACK__ 方法不是必须 debugXpCall是实现的是在lua 脚本调用错误时进行代码错误定位
--function __G__TRACKBACK__(errorMessage)
--    debugXpCall();
--    print("----------------------------------------")
--    local msg = debug.traceback(errorMessage, 3)
--    print(msg)
--    print("----------------------------------------")
--end

local status, msg = xpcall(main, __G__TRACKBACK__)
if not status then
    print(msg)
end
