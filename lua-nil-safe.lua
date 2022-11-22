local nil_metatable = {}

function nil_metatable:__index()    return nil        end
function nil_metatable:__newindex() return            end
function nil_metatable:__ipairs()   return ipairs({}) end
function nil_metatable:__pairs()    return pairs({})  end
function nil_metatable:__call(...)  return ...        end

function nil_metatable:__concat(v) return v end
function nil_metatable:__unm(v)    return v end
function nil_metatable:__add(v)    return v end
function nil_metatable:__sub(v)    return v end
function nil_metatable:__mul(v)    return v end
function nil_metatable:__div(v)    return v end
function nil_metatable:__idiv(v)   return v end
function nil_metatable:__mod(v)    return v end
function nil_metatable:__pow(v)    return v end
function nil_metatable:__band(v)   return v end
function nil_metatable:__bor(v)    return v end
function nil_metatable:__bxor(v)   return v end
function nil_metatable:__bnot(v)   return v end
function nil_metatable:__shl(v)    return v end
function nil_metatable:__shr(v)    return v end

debug.setmetatable(nil,nil_metatable)
