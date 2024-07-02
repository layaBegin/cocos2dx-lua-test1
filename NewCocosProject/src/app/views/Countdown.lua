local Countdown = class("Countdown", function()
    return cc.Node:create()
end)

function Countdown:ctor(circleImage, countdownLabel)
    self.remainingTime = 12

    -- 创建倒计时标签
    -- self.countdownLabel = cc.Label:createWithSystemFont(string.format("%ds", duration), "Arial", fontSize or 36)
    self.countdownLabel = countdownLabel
    -- self:addChild(self.countdownLabel)

    -- 创建倒计时圈
    local circleSprite = cc.Sprite:create(circleImage)
    circleSprite:setColor(cc.c3b(0, 255, 0))  -- 设置颜色为绿色
    self.progressTimer = cc.ProgressTimer:create(circleSprite)
    self.progressTimer:setType(cc.PROGRESS_TIMER_TYPE_RADIAL)
    self.progressTimer:setReverseDirection(true)  -- 从整圆开始，逐渐减少
    self.progressTimer:setPercentage(100)
    self:addChild(self.progressTimer)

    -- 更新函数
    self:scheduleUpdateWithPriorityLua(function(dt)
        self:update(dt)
    end, 0)
end

function Countdown:start()
    self.running = true
end

function Countdown:stop()
    self.running = false
end

function Countdown:update(dt)
    if not self.running then return end

    self.remainingTime = self.remainingTime - dt
    if self.remainingTime <= 0 then
        self.remainingTime = 0
        self:stop()
        if self.onComplete then
            self.onComplete()
        end
    end
    self:updateLabel()
    self:updateProgressTimer()
end

function Countdown:updateLabel()
    self.countdownLabel:setString(string.format("%ds", math.ceil(self.remainingTime)))
end

function Countdown:updateProgressTimer()
    local percentage = (self.remainingTime / 10) * 100
    self.progressTimer:setPercentage(percentage)
end

function Countdown:setOnComplete(callback)
    self.onComplete = callback
end

return Countdown
