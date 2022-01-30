local component = require("component")
local args, _ = require("shell").parse(...)
if args[1] == nil then
    local cnt = 1
    for i, v in component.list() do
        print(cnt, i, v)
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
