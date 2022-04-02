T = readline().to_i

def getC(row, col)
	if [row, col] == [0, 0] ||
		[row, col] == [0, 1] ||
		[row, col] == [1, 0]
		return '.'
	end

	if row.even?
		if col.even?
			return '+'
		end
		return '-'
	end

	if col.even?
		return '|'
	end

	return '.'
end

T.times do |tt|
	puts "Case ##{tt + 1}:"
	r, c = readline().split(' ').map(&:to_i)
	r, c = r * 2 + 1, c * 2 + 1
	r.times do |row|
		list = c.times.map do |col|
			getC row, col
		end
		puts list.join ''
	end
end
