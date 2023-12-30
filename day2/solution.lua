local i = 1

local t = {
	red = 12,
	green = 13,
	blue = 14,
}

local sum = 0

local pattern = '(%d+) (%w+)'

for line in io.lines(arg[1]) do
	for count, color in line:gmatch(pattern) do
		if tonumber(count) > t[color] then
			goto skip
		end
	end
	sum = sum + i
	::skip::
	i = i + 1
end

print(sum)

-- part 2

sum = 0

for line in io.lines(arg[1]) do
	local m = {}
	for count, color in line:gmatch(pattern) do
		m[color] = math.max(m[color] or 0, tonumber(count))
	end

	local power = 1
	for _, v in pairs(m) do
		power = power * v
	end

	sum = sum + power
end

print(sum)
