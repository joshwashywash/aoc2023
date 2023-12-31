local t = {}

local safe = '.'

-- pad left and right
for line in io.lines(arg[1]) do
	table.insert(t, safe .. line .. safe)
end

local padding = string.rep(safe, #t[1])

-- pad top and bottom
table.insert(t, 1, padding)
table.insert(t, padding)

local sum = 0

local pattern = '[^.]'

for i, v in ipairs(t) do
	for s, e in v:gmatch('()%d+()') do
		local l = s - 1

		if
			v:sub(l, l) ~= safe -- left
			or v:sub(e, e) ~= safe -- right
			or t[i - 1]:sub(l, e):find(pattern) ~= nil -- bottom
			or t[i + 1]:sub(l, e):find(pattern) ~= nil -- top
		then
			sum = sum + tonumber(v:sub(s, e - 1))
		end
	end
end

print(sum)
