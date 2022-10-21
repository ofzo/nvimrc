
return function(name, action)
    local ok, plug = pcall(require, name)
    if not ok then
        print(string.format("Module `%s` not found", name))
        return ok, plug
    end
    if type(action) == "function" then
        action(plug)
    end
    if type(action) == "table" and type(plug.setup) == "function" then
        plug.setup(action)
    end
    return ok, plug
end

