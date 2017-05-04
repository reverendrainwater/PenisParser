--[[
    Penis Parser in LUA
    Written by ImFalling
]]

print("Enter File Path")

filePath = io.read()

file = io.open(filePath,"r")
content = file:read("*all")
file:close()

content = string.gsub(content, "(%w+)", function() return "penis" end)

file = io.open(filePath, "w")
file:write(content)
file:close()