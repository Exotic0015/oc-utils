local component = require("component")
local gpu = component.gpu
local args, _ = require("shell").parse(...)
if args[1] == nil then
    local cnt = 1
    for i, v in component.list() do
        gpu.setForeground(0x2E86C1)
        io.write(cnt .. "\t")
        gpu.setForeground(0x2EC173)
        io.write(i .. "\t")
        gpu.setForeground(0xFFFFFF)
        io.write(v .. "\n")
        cnt = cnt + 1
    end
else
    local cnt = 1
    for i, v in component.list() do
        if tostring(cnt) == args[1] then
            local dev, reason = component.proxy(component.get(i))
            for a, b in pairs(dev) do
                gpu.setForeground(0x2E86C1)
                io.write(a .. "\t")
                gpu.setForeground(0x2EC173)
                io.write(b .. "\n")
                gpu.setForeground(0xFFFFFF)
            end
        end
        cnt = cnt + 1
    end
end
