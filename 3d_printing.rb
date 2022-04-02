T = readline().to_i

N = 3
S = 1000000

colors = 4

T.times do |tt|
	c = []
	N.times do
		line = readline().split(' ').map(&:to_i)
		c << line
	end
	answer = 'IMPOSSIBLE'
	mins = []
	colors.times do |i|
		mins << [c[0][i], c[1][i], c[2][i]].min
	end	

	if mins.sum < S
		puts "Case ##{tt + 1}: #{answer}"
		next
	end

	colors.times do |i|
		mins[i] -= [mins.sum - S, mins[i]].min
	end	

	answer = mins.join ' '
	puts "Case ##{tt + 1}: #{answer}"	
end
