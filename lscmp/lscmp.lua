local component = require("component")
local gpu = component.gpu
local args, _ = require("shell").parse(...)
if args[1] == nil then
    local cnt = 1
    for i, v in component.list() do
        --print(cnt, i, v)
		--print(gpu.setForeground("0x2E86C1") .. cnt)
		--print(gpu.setForeground(0x2E86C1) .. cnt, gpu.setForeground(0x2EC173) .. i, gpu.setForeground(0xFFFFFF) .. v)
		gpu.setForeground(0x2E86C1)
		io.write(cnt .. "\t")
		--print(cnt)
		gpu.setForeground(0x2EC173)
		io.write(i .. "\t")
		--print(i)
		gpu.setForeground(0xFFFFFF)
		io.write(v .. "\n")
		--print(v)
        cnt = cnt + 1
    end
else
    local cnt = 1
    for i, v in component.list() do
        if tostring(cnt) == args[1] then
            local dev, reason = component.proxy(component.get(i))
            for a, b in pairs(dev) do
                print(a, b)
            end
        end
        cnt = cnt + 1
    end
end
