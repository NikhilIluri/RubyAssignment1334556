def mix(s1, s2)
	arr = []; r = ""
	('a'..'z').each {|c|
	f = s1.count(c)
	s = s2.count(c)
	cnt = [f,s].max
	arr << [-cnt, f>s ? 1 : f<s ? 2 : 3, c] if cnt>1
	}
	arr.sort_by! {|i| [i[0], i[1], i[2]]}.each {|i|
	r += (i[1]==3 ? '=': i[1].to_s) + ':' + i[2].to_s * -i[0] + "/"}
	r.chop!
	r
	end
	
	p mix("looping is fun but dangerous", "less dangerous than coding")
