
local MainScene = class("MainScene", cc.load("mvc").ViewBase)

MainScene.RESOURCE_FILENAME = "MainScene.csb"

-- 获取UI控件
MainScene.RESOURCE_BINDING = {
    -- ["Btn_1"]   = {["varname"] = "btn"},
    -- ["Check_1"] = {["varname"] = "check_1"},
}


function MainScene:onCreate()
    printf("resource node = %s", tostring(self:getResourceNode()))
    print("====MainScene:onCreate","****")

    -- 按钮使用
    -- self.btn:addClickEventListener(function(sender)
    --     print("====info","====")
    -- end)
 
    -- self.check_1:setVisible(false)
    
    --[[ you can create scene with following comment code instead of using csb file.
    -- add background image
    display.newSprite("HelloWorld.png")
        :move(display.center)
        :addTo(self)

    -- add HelloWorld label
    cc.Label:createWithSystemFont("Hello World", "Arial", 40)
        :move(display.cx, display.cy + 200)
        :addTo(self)
    ]]
end

return MainScene
