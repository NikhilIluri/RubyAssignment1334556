def pass_encrypt(str,n)
	arr=('A'..'Z').to_a
	cypher_text_temp=str.tr('A-Z',(arr[n..25]<< arr[0..n]).flatten.join).tr('0-9',   ('0'..'9').to_a.reverse.join).reverse
        cypher_text=""
	cypher_text_temp.each_char.with_index{|c,i|
	if i.even?
		cypher_text<< c.upcase
 	else
		cypher_text<< c.downcase
	end
}
cypher_text
end
p pass_encrypt("IMAGINE DRAGONS 789!!",2)	
