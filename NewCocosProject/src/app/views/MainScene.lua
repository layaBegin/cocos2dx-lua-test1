
local MainScene = class("MainScene", cc.load("mvc").ViewBase)

MainScene.RESOURCE_FILENAME = "MainScene.csb"

-- 获取UI控件
MainScene.RESOURCE_BINDING = {
    -- 筹码起始位置
    ["Button_1_0"] = {["varname"] = "Button_1_0"},

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

    ["targetNode_1"] = {["varname"] = "targetNode_1"},
    ["targetNode_2"] = {["varname"] = "targetNode_2"},
    ["targetNode_3"] = {["varname"] = "targetNode_3"},
    ["targetNode_4"] = {["varname"] = "targetNode_4"},
    ["targetNode_5"] = {["varname"] = "targetNode_5"},
    ["targetNode_6"] = {["varname"] = "targetNode_6"},
    ["targetNode_7"] = {["varname"] = "targetNode_7"},
    ["targetNode_8"] = {["varname"] = "targetNode_8"},
    ["targetNode_9"] = {["varname"] = "targetNode_9"},
    ["targetNode_10"] = {["varname"] = "targetNode_10"},
    ["targetNode_11"] = {["varname"] = "targetNode_11"},
   
    

    ["Image_me_1"] = {["varname"] = "Image_me_1"},
    ["Image_me_2"] = {["varname"] = "Image_me_2"},
    ["Image_me_3"] = {["varname"] = "Image_me_3"},
    ["Image_me_4"] = {["varname"] = "Image_me_4"},
    ["Image_me_5"] = {["varname"] = "Image_me_5"},
    ["Image_me_6"] = {["varname"] = "Image_me_6"},
    ["Image_me_7"] = {["varname"] = "Image_me_7"},
    ["Image_me_8"] = {["varname"] = "Image_me_8"},
    ["Image_me_9"] = {["varname"] = "Image_me_9"},
    ["Image_me_10"] = {["varname"] = "Image_me_10"},
    ["Image_me_11"] = {["varname"] = "Image_me_11"},

    ["Text_all_1"] = {["varname"] = "Text_all_1"},
    ["Text_all_2"] = {["varname"] = "Text_all_2"},
    ["Text_all_3"] = {["varname"] = "Text_all_3"},
    ["Text_all_4"] = {["varname"] = "Text_all_4"},
    ["Text_all_5"] = {["varname"] = "Text_all_5"},
    ["Text_all_6"] = {["varname"] = "Text_all_6"},
    ["Text_all_7"] = {["varname"] = "Text_all_7"},
    ["Text_all_8"] = {["varname"] = "Text_all_8"},
    ["Text_all_9"] = {["varname"] = "Text_all_9"},
    ["Text_all_10"] = {["varname"] = "Text_all_10"},
    ["Text_all_11"] = {["varname"] = "Text_all_11"},

    ["Text_me_1"] = {["varname"] = "Text_me_1"},
    ["Text_me_2"] = {["varname"] = "Text_me_2"},
    ["Text_me_3"] = {["varname"] = "Text_me_3"},
    ["Text_me_4"] = {["varname"] = "Text_me_4"},
    ["Text_me_5"] = {["varname"] = "Text_me_5"},
    ["Text_me_6"] = {["varname"] = "Text_me_6"},
    ["Text_me_7"] = {["varname"] = "Text_me_7"},
    ["Text_me_8"] = {["varname"] = "Text_me_8"},
    ["Text_me_9"] = {["varname"] = "Text_me_9"},
    ["Text_me_10"] = {["varname"] = "Text_me_10"},
    ["Text_me_11"] = {["varname"] = "Text_me_11"},

    

}


function MainScene:onCreate()
    printf("resource node = %s", tostring(self:getResourceNode()))
    print("====MainScene:onCreate","****")

    -- 初始化分数
    self.targetNodeArr = {}
    self.scores = {}
    self.scoreMeImages = {}
    self.scoreAllLabels = {}
    self.scoreMeLabels = {}
    for i = 1, 11 do
        self.targetNodeArr[i] = self["targetNode_" .. i]
    end
    for i = 1, 11 do
        self.scoreMeImages[i] = self["Image_me_" .. i]
        self.scoreMeImages[i]:setVisible(false)
    end

    for i = 1, 11 do
        self.scores[i] = 0
    end

    for i = 1, 11 do
        self.scoreAllLabels[i] = self["Text_all_" .. i]
        self.scoreAllLabels[i]:setString("")
    end

    for i = 1, 11 do
        self.scoreMeLabels[i] = self["Text_me_" .. i]
        self.scoreMeLabels[i]:setString("")
    end
   
    
    -- 按钮使用
    self.Button_man:addClickEventListener(function(sender)
        print("====Button_man","====")

        self:flyChipToButton(1)
    end)

    self.Button_tie:addClickEventListener(function(sender)
        print("====Button_tie","====")
        self:flyChipToButton(2)
    end)

    self.Button_woman:addClickEventListener(function(sender)
        print("====Button_woman","====")
        self:flyChipToButton(3)
    end)
 
    self.Button_one_tonghua:addClickEventListener(function(sender)
        print("====Button_one_tonghua","====")
        self:flyChipToButton(4)
    end)

    self.Button_one_pair:addClickEventListener(function(sender)
        print("====Button_one_pair","====")
        self:flyChipToButton(5)
    end)

    self.Button_one_A:addClickEventListener(function(sender)
        print("====Button_one_A","====")
        self:flyChipToButton(6)
    end)

    self.Button_win_gaopai:addClickEventListener(function(sender)
        print("====Button_win_gaopai","====")
        self:flyChipToButton(7)
    end)

    self.Button_win_twopair:addClickEventListener(function(sender)
        print("====Button_win_twopair","====")
        self:flyChipToButton(8)
    end)

    self.Button_win_santiao:addClickEventListener(function(sender)
        print("====Button_win_santiao","====")
        self:flyChipToButton(9)
    end)

    self.Button_win_fullhouse:addClickEventListener(function(sender)
        print("====Button_win_fullhouse","====")
        self:flyChipToButton(10)
    end)

    self.Button_win_four:addClickEventListener(function(sender)
        print("====Button_win_four","====")
        self:flyChipToButton(11)
    end)


    function MainScene:updateScoreLabel(scoreKey)
        local labelAll = self.scoreAllLabels[scoreKey]
        local labelMe = self.scoreMeLabels[scoreKey]
        if labelAll then
            labelAll:setString(tostring(self.scores[scoreKey]))
        end
        if labelMe then
            self.scoreMeImages[scoreKey]:setVisible(true)
            labelMe:setString(tostring(self.scores[scoreKey]))
        end
    end


    function MainScene:flyChipToButton(key)
        local targetNode = self.targetNodeArr[key]
        self.scores[key] = self.scores[key] + 1
        self:updateScoreLabel(key)
        -- 创建筹码精灵
        local chip = cc.Sprite:create("chip1.png")
        targetNode:addChild(chip)
        
        -- -- 设置筹码初始位置
        -- local startPosition = cc.p(display.cx, display.cy)
        local  x, y = self.Button_1_0:getPosition()
        print("====startPosition1:",x,y)
        local startPos = self.Button_1_0:getParent():convertToWorldSpace(cc.p(x,y))
        local startPos1 = targetNode:convertToNodeSpace(startPos)

        chip:setPosition(startPos1)
    
        -- 获取目标按钮的位置
        -- local endPositionX,endPositionY = targetNode:getPosition()
    
        -- -- 将目标位置转换为世界坐标系
        local endPosition = cc.p(0,0)
        -- 添加随机偏移量
        local offsetX = math.random(-100, 100)
        local offsetY = math.random(-50, 50)
        endPosition.x =  offsetX
        endPosition.y =  offsetY
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
