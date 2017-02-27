--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:aac647c5a428cb04ecafb87d5b7b7f9f:61ff0ba41a3a246bb0d28a66e98af714:c166aa414771df5499f4220533ae3500$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local SheetInfo = {}

SheetInfo.sheet =
{
    frames = {
    
        {
            -- burrow
            x=267,
            y=1,
            width=144,
            height=73,

        },
        {
            -- raccoon_angry
            x=1,
            y=1,
            width=131,
            height=200,

        },
        {
            -- raccoon_calm
            x=134,
            y=1,
            width=131,
            height=200,

        },
        {
            -- raccoon_icon
            x=267,
            y=76,
            width=75,
            height=82,

        },
        {
            -- timer_icon
            x=344,
            y=76,
            width=43,
            height=73,

        },
    },
    
    sheetContentWidth = 412,
    sheetContentHeight = 202
}

SheetInfo.frameIndex =
{

    ["burrow"] = 1,
    ["raccoon_angry"] = 2,
    ["raccoon_calm"] = 3,
    ["raccoon_icon"] = 4,
    ["timer_icon"] = 5,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
