local component = require("component")
local gpu = component.gpu
local args, _ = require("shell").parse(...)

local function listComponents()
    local i = 1

    for addr, name in component.list() do
        gpu.setForeground(0x2E86C1)
        io.write(i .. "\t")
        gpu.setForeground(0x2EC173)
        io.write(addr .. "\t")
        gpu.setForeground(0xFFFFFF)
        io.write(name .. "\n")
        i = i + 1
    end
end

local function componentDetails(index)
    local i = 1

    for addr, _ in component.list() do
        if tostring(i) == index then
            local dev, _ = component.proxy(component.get(addr))

            for name, prop in pairs(dev) do
                gpu.setForeground(0x2E86C1)
                io.write(name .. " ")
                gpu.setForeground(0x2EC173)
                io.write(tostring(prop) .. "\n")
                gpu.setForeground(0xFFFFFF)
            end
        end
        i = i + 1
    end
end

if #args == 0 then
    listComponents()
else
    componentDetails(args[1])
end
