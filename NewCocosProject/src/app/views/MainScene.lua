
local MainScene = class("MainScene", cc.load("mvc").ViewBase)

MainScene.RESOURCE_FILENAME = "MainScene.csb"

-- 获取UI控件
MainScene.RESOURCE_BINDING = {
    ["Button_man"]   = {["varname"] = "Button_man"},
    ["Button_tie"] = {["varname"] = "Button_tie"},
    ["Button_woman"] = {["varname"] = "Button_woman"},
    ["Button_one_tonghua"] = {["varname"] = "Button_one_tonghua"},
    ["Button_one_pair"] = {["varname"] = "Button_one_pair"},
    ["Button_one_A"] = {["varname"] = "Button_one_A"},
    ["Button_win_gaopai"] = {["varname"] = "Button_win_gaopai"},
    ["Button_win_twopair"] = {["varname"] = "Button_win_twopair"},
    ["Button_win_santiao"] = {["varname"] = "Button_win_santiao"},
    ["Button_win_fullhouse"] = {["varname"] = "Button_win_fullhouse"},
    ["Button_win_four"] = {["varname"] = "Button_win_four"},


    

}


function MainScene:onCreate()
    printf("resource node = %s", tostring(self:getResourceNode()))
    print("====MainScene:onCreate","****")

   
    
    -- 按钮使用
    self.Button_man:addClickEventListener(function(sender)
        print("====Button_man","====")
    end)

    self.Button_tie:addClickEventListener(function(sender)
        print("====Button_tie","====")
    end)

    self.Button_woman:addClickEventListener(function(sender)
        print("====Button_woman","====")
    end)
 
    self.Button_one_tonghua:addClickEventListener(function(sender)
        print("====Button_one_tonghua","====")
    end)

    self.Button_one_pair:addClickEventListener(function(sender)
        print("====Button_one_pair","====")
    end)

    self.Button_one_A:addClickEventListener(function(sender)
        print("====Button_one_A","====")
    end)

    self.Button_win_gaopai:addClickEventListener(function(sender)
        print("====Button_win_gaopai","====")
    end)

    self.Button_win_twopair:addClickEventListener(function(sender)
        print("====Button_win_twopair","====")
    end)

    self.Button_win_santiao:addClickEventListener(function(sender)
        print("====Button_win_santiao","====")
    end)

    self.Button_win_fullhouse:addClickEventListener(function(sender)
        print("====Button_win_fullhouse","====")
    end)

    self.Button_win_four:addClickEventListener(function(sender)
        print("====Button_win_four","====")
    end)


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
