-- app/views/CardManager.lua

local CardManager = class("CardManager", function()
    return cc.Node:create()
end)

function CardManager:ctor()
    -- self:removeAllCards()
    self.cardBackImage = "little/card_back.png"
    self.cardFrontImages = {
        "little/card_1_2.png", -- 第一张公共牌正面图片
        "little/card_0_2.png",
        "little/card_3_5.png",
        "little/card_1_6.png",
        "little/card_2_13.png",
        "little/card_2_3.png",
        "little/card_2_7.png",
        "little/card_1_11.png",
        "little/card_1_5.png",
    }

    -- 公共牌位置
    self.publicCardPositions = {
        cc.p(- 150, 0),
        cc.p(- 75, 0),
        cc.p(0, 0),
        cc.p(75, 0),
        cc.p(150, 0)
    }

    -- 左右两人手牌位置
    self.leftHandPositions = {
        cc.p(- 550, - 200),
        cc.p(- 500, - 200)
    }

    self.rightHandPositions = {
        cc.p(500, - 200),
        cc.p(550, - 200)
    }

    -- 初始化卡牌
    self.publicCards = {}
    self.leftHandCards = {}
    self.rightHandCards = {}

    -- 创建公共牌
    for i, pos in ipairs(self.publicCardPositions) do
        local card = cc.Sprite:create(self.cardBackImage)
        if card then
            card:setPosition(0, 300) -- 牌堆位置
            self:addChild(card)
            table.insert(self.publicCards, card)
        else
            print("Failed to create public card " .. i)
        end
    end

    -- 创建左边手牌
    for i, pos in ipairs(self.leftHandPositions) do
        local card = cc.Sprite:create(self.cardBackImage)
        if card then
            card:setPosition(0, 300) -- 牌堆位置
            self:addChild(card)
            table.insert(self.leftHandCards, card)
        else
            print("Failed to create left hand card " .. i)
        end
    end

    -- 创建右边手牌
    for i, pos in ipairs(self.rightHandPositions) do
        local card = cc.Sprite:create(self.cardBackImage)
        if card then
            self:addChild(card)
            card:setPosition(0, 300) -- 牌堆位置
            table.insert(self.rightHandCards, card)
        else
            print("Failed to create right hand card " .. i)
        end
    end
end



--发牌
function CardManager:dealCards()
    -- 先将所有牌发到同一个位置
    local moveTime = 0.2

    local function moveCardsToStack(cards, positions)
        for i, card in ipairs(cards) do
            local moveAction = cc.MoveTo:create(moveTime, positions)
            card:runAction(moveAction)
        end
    end

    -- 发到公共牌堆
    moveCardsToStack(self.publicCards, self.publicCardPositions[1])
    -- 发到左边手牌堆
    moveCardsToStack(self.leftHandCards, self.leftHandPositions[1])
    -- 发到右边手牌堆
    moveCardsToStack(self.rightHandCards, self.rightHandPositions[1])

    -- 延迟一段时间后展开牌
    local delay = cc.DelayTime:create(moveTime + 0.2) -- 发牌时间 + 额外延迟
    local unfoldAction = cc.CallFunc:create(function()
        -- self:unfoldCards(self.publicCards, self.publicCardPositions)
        -- self:unfoldCards(self.leftHandCards, self.leftHandPositions)
        -- self:unfoldCards(self.rightHandCards, self.rightHandPositions)

        -- 展开公共牌，无旋转
        self:unfoldCards(self.publicCards, self.publicCardPositions, {0, 0, 0, 0, 0})
        -- 展开左边手牌，有旋转
        self:unfoldCards(self.leftHandCards, self.leftHandPositions, {-15, 0})
        -- 展开右边手牌，有旋转
        self:unfoldCards(self.rightHandCards, self.rightHandPositions, {-15, 0})

        -- 翻开第一张公共牌
        local flipDelay = cc.DelayTime:create(1.0) -- 延迟时间，确保所有牌都展开
        local flipAction = cc.CallFunc:create(function()
            self:flipCard(self.publicCards[1], self.cardFrontImages[1])
        end)
        local sequence = cc.Sequence:create(flipDelay, flipAction)
        self:runAction(sequence)
    end)
    local sequence = cc.Sequence:create(delay, unfoldAction)
    self:runAction(sequence)
end

function CardManager:unfoldCards(cards, positions, rotations)
    for i, card in ipairs(cards) do
        local moveAction = cc.MoveTo:create(0.3, positions[i])
        local rotateAction = cc.RotateTo:create(0.3, rotations[i] or 0)
        local spawnAction = cc.Spawn:create(moveAction, rotateAction)
        card:runAction(spawnAction)
    end
end

function CardManager:resetCard()
    for i, card in ipairs(self.publicCards) do
        card:setVisible(false)
        card:setTexture(self.cardBackImage) -- 翻转到正面图片
    end
    for i, card in ipairs(self.leftHandCards) do
        card:setVisible(false)
        card:setTexture(self.cardBackImage) -- 翻转到正面图片
    end
    for i, card in ipairs(self.rightHandCards) do
        card:setVisible(false)
        card:setTexture(self.cardBackImage) -- 翻转到正面图片
    end
end

function CardManager:openCard()
    -- 停止下注，翻开所有公共牌和手牌
    for i = 2, #self.publicCards do
        self:flipCard(self.publicCards[i], self.cardFrontImages[i])
    end

   -- -- 假设手牌也需要翻开，这里也翻开手牌
   for i, card in ipairs(self.leftHandCards) do
       self:flipCard(card, self.cardFrontImages[i + 5])  -- 示例，手牌的正面图片
   end
   for i, card in ipairs(self.rightHandCards) do
       self:flipCard(card, self.cardFrontImages[i + 7])  -- 示例，手牌的正面图片
   end

end

-- 翻牌
function CardManager:flipCard(card, frontImage)
    if not card then
        print("Card is nil, cannot flip")
        return
    end
    local flipTime = 0.3
    local scaleToZero = cc.ScaleTo:create(flipTime / 2, 0, 1)
    local scaleToOne = cc.ScaleTo:create(flipTime / 2, 1, 1)
    local function onFlipEnd()
        card:setTexture(frontImage) -- 翻转到正面图片
    end

    local flipSequence = cc.Sequence:create(
        scaleToZero,
        cc.CallFunc:create(onFlipEnd),
        scaleToOne
    )
    card:runAction(flipSequence)
end


function CardManager:removeAllCards()
    for _, card in ipairs(self.publicCards) do
        card:removeFromParent()
    end
    self.publicCards = {}

    for _, card in ipairs(self.leftHandCards) do
        card:removeFromParent()
    end
    self.leftHandCards = {}

    for _, card in ipairs(self.rightHandCards) do
        card:removeFromParent()
    end
    self.rightHandCards = {}
end

return CardManager
