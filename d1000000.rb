T = readline.to_i

T.times do |tt|
	n = readline.to_i
	s = readline.split(' ').map(&:to_i)
	s.sort!
	ans = 0
	n.times do |i|
		if ans < s[i]
			ans += 1
		end
	end

	puts "Case ##{tt + 1}: #{ans}"	
end
