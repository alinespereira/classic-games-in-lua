local Colors = {}

function Colors:fromRGB(r, g, b)
    return r / 255, g / 255, b / 255
end

function Colors:fromHex(hex)
    hex = hex:gsub("#","")
    
    if hex:len() == 3 then
        return {
            tonumber("0x" .. hex:sub(1, 1)) * 17 / 255,
            tonumber("0x" .. hex:sub(2, 2)) * 17 / 255,
            tonumber("0x" .. hex:sub(3, 3)) * 17 / 255
        }
    else
        return {
            tonumber("0x" .. hex:sub(1, 2)) / 255,
            tonumber("0x" .. hex:sub(3, 4)) / 255,
            tonumber("0x" .. hex:sub(5, 6)) / 255
        }
    end
end

Colors.gray = {
    darker  = Colors:fromHex("#999999"),
    dark    = Colors:fromHex("#777777"),
    medium  = Colors:fromHex("#555555"),
    light   = Colors:fromHex("#333333"),
    lighter = Colors:fromHex("#111111")
}
Colors.white = {
    darker  = Colors:fromHex("#fbfbfb"),
    dark    = Colors:fromHex("#fffefe"),
    medium  = Colors:fromHex("#fdfdff"),
    light   = Colors:fromHex("#fdfdfd"),
    lighter = Colors:fromHex("#ffffff")
}

return Colors
