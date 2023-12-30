local sum = 0

local f = function(line)
	local first = 0
	local last = 0
	for i = 1, #line do
		local n = tonumber(line:sub(i, i))
		if n ~= nil then
			first = n
			break
		end
	end
	for i = #line, 1, -1 do
		local n = tonumber(line:sub(i, i))
		if n ~= nil then
			last = n
			break
		end
	end
	return tonumber(first .. last)
end

for line in io.lines(arg[1]) do
	sum = sum + f(line)
end

print(sum)

-- part 2

sum = 0

local words = {
	'one',
	'two',
	'three',
	'four',
	'five',
	'six',
	'seven',
	'eight',
	'nine',
}

local replacement = {}
for i, value in ipairs(words) do
	replacement[value] = value:sub(1, 1) .. i .. value:sub(-1, -1)
end

for line in io.lines(arg[1]) do
	for key, value in pairs(replacement) do
		line = line:gsub(key, value)
	end
	sum = sum + f(line)
end

print(sum)
