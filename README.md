# lua-nil-safe
This lib hacks the nil-type metatable, making it ignore the most common nil-related bugs. When overriding metamethods, you can simply, for example:
 
When checking if the file exists, you usually do:
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

Another use, optional callbacks:

Without hack:
 
```lua
function filter(tbl,callback)
  local result = {}
  if callback == nil then
    callback = function (v)
                 return v
               end
  end
  for i,value in ipairs(tbl) do
    if callback(tbl) ~= nil then
      result[#result+1] value
    end
  end
  return result
end
```

With this "hack":

```lua
function filter(tbl,callback)
  local result = {}
  for i,value in ipairs(tbl) do
    if callback(tbl) ~= nil then
      result[#result+1] value
    end
  end
  return result
end
```

Also works with nil-at-left operations:
 
```lua 
(nil) + 1 = 1
(nil) - 1 = 1
(nil) * 1 = 1
(nil) / 1 = 1
(nil) % 1 = 1
...
```

> **Note:** Doesn't work with nil at right, don't rise errors, but doesn't effectuate the operation
> ```lua 
> 1 + (nil) = nil
> 1 - (nil) = nil
> 1 * (nil) = nil
> 1 / (nil) = nil
> 1 % (nil) = nil
> ```

And finally `table`operations:

```lua
#(nil)   = -1        -- Getting lenght of nil
(nil)[1] = nil       -- Indexing a nil
(nil)[4] = (ignored) -- New indexing a nil
```

