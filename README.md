# lua-nil-safe
This lib hacks nil type metatable making it ignoring most common nil related errors. This is very small trick, by overring metamethods you can simply, for e.g. when checking if file exists you usually do:

```lua
function file_exists(name)
  local file = io.open(name, "r") -- Open the file in read mode
  if file then f:close() end      -- Check if file isn't nil, if not, close it
  return file ~= nil              -- return if file isn't nil
end
```

With this "hack":

```lua
function file_exists(name)
  local file = io.open(name, "r") -- Open the file in read mode
  file:close()                    -- Just close the file, you don't need to care if is nil
  return file ~= nil              -- return if file isn't nil
end
```

