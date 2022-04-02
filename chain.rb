T = readline.to_i

T.times do |tt|
	n = readline.to_i
	f = readline.split(' ').map(&:to_i)
	ps = readline.split(' ').map{|x| x.to_i - 1}
	counts = [0] * n
	big = 10 ** 9 + 1

	ps.each do |i|
		next if i == -1
		counts[i] += 1
	end

	stack = []
	n.times do |i|
		stack << i if counts[i] == 0
	end

	min_and_sum = [nil] * n
	total = 0
	while !stack.empty?
		top = stack.pop
		parent = ps[top]
	
		if min_and_sum[top].nil?
			min_and_sum[top] = [f[top], f[top]]	
		end

		if parent == -1
			total += min_and_sum[top][1]
			next
		end

		if min_and_sum[parent].nil?
			min_and_sum[parent] = [big, f[parent]]	
		end
	
		min_and_sum[parent][0] = [min_and_sum[parent][0], min_and_sum[top][0]].min
		min_and_sum[parent][1] += min_and_sum[top][1] 

		counts[parent] -= 1
		
		if counts[parent] == 0 
			min_and_sum[parent][1] -= [min_and_sum[parent][0], f[parent]].min
			min_and_sum[parent][0] = [min_and_sum[parent][0], f[parent]].max
			stack << parent
		end	
	end

	puts "Case ##{tt + 1}: #{total}"	
end
