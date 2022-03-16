local mod = {}

local a = 5

local function foobar()
	return a
end

print("foobar:", foobar)

function mod.foo()
	return foobar
end

function mod.foo2()
	return foobar
end

function mod.foobar(x)
	a = x
end

local meta = {}

meta.__index = meta

function meta:show()
	self:foobar(3)
	print("new ==",foobar())
end

function mod.new()
	return setmetatable({}, meta)
end

return mod