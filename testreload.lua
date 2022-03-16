local reload = require "reload"
-- reload.postfix = "_update"	-- for test

local mymod = require "mymod"

function reload.print(...)
	print("  DEBUG:", ...)
end

mymod.foobar(42)

local tmp = {}
local foo = mymod.foo2()
tmp[foo] = foo
print("FOO before", foo)

print("before fo=",foo())
local obj = mymod.new()

obj:show()

function test()
	print("***************记得修改mymod文件**************")
	print("BEFORE update foo", foo)
	reload.reload { "mymod" }
	print("AFTER update foo", foo)
end

local skynet = require "skynet"
skynet.sleep(3000)

test()
print("after fo=",foo())

print("FOO after", foo)
assert(tmp[foo] == foo)

obj:show()
