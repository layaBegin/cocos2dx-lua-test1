local Countdown = require("app.views.Countdown")
local CardManager = require("app.views.CardManager")

local MainScene = class("MainScene", cc.load("mvc").ViewBase)

MainScene.RESOURCE_FILENAME = "MainScene.csb"

-- 获取UI控件
MainScene.RESOURCE_BINDING = {
    -- 筹码起始位置
    ["Button_1_0"] = {["varname"] = "Button_1_0"},

    ["Node_Card"] = {["varname"] = "Node_Card"},

    -- 闹钟
    ["Node_clock"] = {["varname"] = "Node_clock"},
    -- ["Text_Clock"] = {["varname"] = "countdownLabel"},
    

    ["Button_man"]   = {["varname"] = "areaButton_1"},
    ["Button_tie"] = {["varname"] = "areaButton_2"},
    ["Button_woman"] = {["varname"] = "areaButton_3"},
    ["Button_one_tonghua"] = {["varname"] = "areaButton_4"},
    ["Button_one_pair"] = {["varname"] = "areaButton_5"},
    ["Button_one_A"] = {["varname"] = "areaButton_6"},
    ["Button_win_gaopai"] = {["varname"] = "areaButton_7"},
    ["Button_win_twopair"] = {["varname"] = "areaButton_8"},
    ["Button_win_santiao"] = {["varname"] = "areaButton_9"},
    ["Button_win_fullhouse"] = {["varname"] = "areaButton_10"},
    ["Button_win_four"] = {["varname"] = "areaButton_11"},

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
    ["DefualtHead_3"] = {["varname"] = "playerAvatarPosition"},


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
    self.areaBtnArr = {}
    self.targetNodeArr = {}
    self.scores = {}
    self.scoreMeImages = {}
    self.scoreAllLabels = {}
    self.scoreMeLabels = {}

    for i = 1, 11 do
        self.areaBtnArr[i] = self["areaButton_" .. i]
        self.areaBtnArr[i]:addClickEventListener(function(sender)
            print("====Button_man","====")
            self:flyChipToButton(i)
        end)
    end
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

    -- 初始化倒计时
    self:initCountdown()
    -- 初始化卡牌管理器
    self:initCardManager()

    self:startGame()

end

--倒计时
function MainScene:initCountdown()
    -- 创建倒计时对象，传入圆形图片路径
    self.countdown = Countdown.new("countdown1.png", self.countdownLabel)
   
    self.Node_clock:addChild(self.countdown)

end

--倒计时
function MainScene:initCardManager()
    -- 创建倒计时对象，传入圆形图片路径
    self.cardManager = CardManager.new()
    
    self.Node_Card:addChild(self.cardManager)
   
end

function MainScene:startGame()
    -- 开始下注
    self:startBetting()
    -- 使用定时器无限循环游戏流程
    local function updateGame(dt)
        -- self:stopBetting()
        -- self:resetGame()
        self:startBetting()
    end
    cc.Director:getInstance():getScheduler():scheduleScriptFunc(updateGame, 20, false)
end

function MainScene:startBetting()
    -- -- 初始化卡牌位置
    -- self:initCardPositions()
    -- 发牌并翻开第一张公共牌
    self.cardManager:dealCards()

    local delay = cc.DelayTime:create(3) -- 
    local countDownAction = cc.CallFunc:create(function()
        self.countdown:setOnComplete(function()
            print("====Countdown complete!")
            self:stopBetting()
    
        end)
        -- 启用倒计时
        self.countdown:start()
    end)
    local sequence = cc.Sequence:create(delay, countDownAction)
    self:runAction(sequence)
    -- 激活区域按钮
    self:setBtnEnabled(true)
end


function MainScene:stopBetting()
    print("===进入停止下注")
    self:setBtnEnabled(false)
    self.countdown:reset()
    self.cardManager:openCard()

    local delay1 = cc.DelayTime:create(1) -- 发牌时间 + 额外延迟
    local unfoldAction1 = cc.CallFunc:create(function()
        -- 结算输赢（需要实现具体逻辑）
        self:settleGame()
    end)
    local delay2 = cc.DelayTime:create(1) -- 发牌时间 + 额外延迟
    local unfoldAction2 = cc.CallFunc:create(function()
         -- 结算输赢（需要实现具体逻辑）
        self:settleGame()
    end)
    local sequence = cc.Sequence:create(delay1,unfoldAction1,delay2,unfoldAction2)
    self:runAction(sequence)
end





function MainScene:setBtnEnabled(enable)
    for i = 1, 11 do
        self.areaBtnArr[i]:setEnabled(enable)
    end

end


-- 更新label
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

function MainScene:resetScoreLabel()
    for i = 1, 11 do
        self.scoreAllLabels[i]:setString("")
    end

    for i = 1, 11 do
        self.scoreMeImages[i]:setVisible(false)

        self.scoreMeLabels[i]:setString("")
    end
end

function MainScene:settleScore()

end



function MainScene:settleGame()
    self:resetScoreLabel()
    self:settleScore()
    self:settleChips()
    -- 延迟一段时间后重置游戏
    self:runAction(cc.Sequence:create(cc.DelayTime:create(4.0), cc.CallFunc:create(function()
        self:resetGame()
    end)))

end

function MainScene:resetGame()
    -- 重新初始化牌堆
    self.cardManager:resetCard()
    -- self:resetChips()


end

function MainScene:settleChips()
    local winningAreaIndexArr = {3,4,8}
    -- 判断索引是否在数组中
    local function isIndexInArray(index, array)
        for _, value in ipairs(array) do
            if value == index then
                return true
            end
        end
        return false
    end

    for i = 1, 11 do
        local targetNode = self.targetNodeArr[i]
        local  x, y = self.playerAvatarPosition:getPosition()
        local avarPos = self.playerAvatarPosition:getParent():convertToWorldSpace(cc.p(x,y))
        local localPos = targetNode:convertToNodeSpace(avarPos)

        if targetNode then
            local chips = targetNode:getChildren()
            for _, chip in ipairs(chips) do
                if isIndexInArray(i,winningAreaIndexArr) then
                    -- 赢的筹码飞向玩家头像
                    local moveAction = cc.MoveTo:create(0.5, localPos)
                    local fadeOut = cc.FadeOut:create(0.5)
                    local removeChip = cc.CallFunc:create(function()
                        chip:removeFromParent(true)
                    end)
                    local sequence = cc.Sequence:create(moveAction, fadeOut, removeChip)
                    chip:runAction(sequence)
                else
                    -- 其他筹码渐隐
                    local fadeOut = cc.FadeOut:create(0.5)
                    local removeChip = cc.CallFunc:create(function()
                        chip:removeFromParent(true)
                    end)
                    local sequence = cc.Sequence:create(fadeOut, removeChip)
                    chip:runAction(sequence)
                end
            end
        end
    end
end


-- 飞筹码
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


return MainScene
