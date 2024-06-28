
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

    ["Button_1_0"] = {["varname"] = "Button_1_0"},

    

}


function MainScene:onCreate()
    printf("resource node = %s", tostring(self:getResourceNode()))
    print("====MainScene:onCreate","****")

   
    
    -- 按钮使用
    self.Button_man:addClickEventListener(function(sender)
        print("====Button_man","====")
        self:flyChipToButton(self.Button_man)
    end)

    self.Button_tie:addClickEventListener(function(sender)
        print("====Button_tie","====")
        self:flyChipToButton(self.Button_tie)
    end)

    self.Button_woman:addClickEventListener(function(sender)
        print("====Button_woman","====")
        self:flyChipToButton(self.Button_woman)
    end)
 
    self.Button_one_tonghua:addClickEventListener(function(sender)
        print("====Button_one_tonghua","====")
        self:flyChipToButton(self.Button_one_tonghua)
    end)

    self.Button_one_pair:addClickEventListener(function(sender)
        print("====Button_one_pair","====")
        self:flyChipToButton(self.Button_one_pair)
    end)

    self.Button_one_A:addClickEventListener(function(sender)
        print("====Button_one_A","====")
        self:flyChipToButton(self.Button_one_A)
    end)

    self.Button_win_gaopai:addClickEventListener(function(sender)
        print("====Button_win_gaopai","====")
        self:flyChipToButton(self.Button_win_gaopai)
    end)

    self.Button_win_twopair:addClickEventListener(function(sender)
        print("====Button_win_twopair","====")
        self:flyChipToButton(self.Button_win_twopair)
    end)

    self.Button_win_santiao:addClickEventListener(function(sender)
        print("====Button_win_santiao","====")
        self:flyChipToButton(self.Button_win_santiao)
    end)

    self.Button_win_fullhouse:addClickEventListener(function(sender)
        print("====Button_win_fullhouse","====")
        self:flyChipToButton(self.Button_win_fullhouse)
    end)

    self.Button_win_four:addClickEventListener(function(sender)
        print("====Button_win_four","====")
        self:flyChipToButton(self.Button_win_four)
    end)


    function MainScene:flyChipToButton(targetButton)
        -- 创建筹码精灵
        local chip = cc.Sprite:create("chip1.png")
        self:addChild(chip)
        
        -- -- 设置筹码初始位置
        -- local startPosition = cc.p(display.cx, display.cy)
        local  x, y = self.Button_1_0:getPosition()
        print("====startPosition1:",x,y)
        local startPos = self.Button_1_0:getParent():convertToWorldSpace(cc.p(x,y))

        chip:setPosition(startPos)
    
        -- 获取目标按钮的位置
        local endPositionX,endPositionY = targetButton:getPosition()
    
        -- -- 将目标位置转换为世界坐标系
        local endPosition = targetButton:getParent():convertToWorldSpace(cc.p(endPositionX,endPositionY))
        -- 添加随机偏移量
        local offsetX = math.random(-100, 100)
        local offsetY = math.random(-50, 50)
        endPosition.x = endPosition.x + offsetX
        endPosition.y = endPosition.y + offsetY
        -- 创建飞行动作
        local moveAction = cc.MoveTo:create(0.2, endPosition)
        -- local rotateAction = cc.RotateBy:create(1.0, 360)
        -- 创建逐渐停止的旋转动作
        local rotateEaseOut = cc.EaseIn:create(cc.RotateBy:create(1, 2600), 0.5)

        local callback = cc.CallFunc:create(function()
            -- 动作完成后的回调，可以在这里添加其他逻辑
            print("===Chip reached target button")
            -- chip:removeFromParent()  -- 移除筹码精灵
        end)

        -- 并行动作和顺序动作组合
        local spawn = cc.Spawn:create(moveAction, rotateEaseOut)
        local sequence = cc.Sequence:create(spawn, callback)
    
        -- 运行动作
        chip:runAction(sequence)
    end



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
