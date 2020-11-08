array = [621, 445, 147, 159, 430, 222, 482, 44, 194, 522, 652, 494, 14, 126, 532, 387, 441, 471, 337, 446, 18, 36, 202, 574, 556, 458, 16, 139, 222, 220, 107, 82, 264, 366, 501, 319, 314, 430, 55, 336]
p array
p "Size = #{array.size}"
p '______________________________________'
p "Reversed array = #{array.reverse}"
p '______________________________________'
p "Max element = #{array.max}"
p '______________________________________'
p "Min element = #{array.min}"
p '______________________________________'
p "Sorted array: #{array.sort}"
p '______________________________________'
p "Descending sorted array: #{(array.sort).reverse}"
p '______________________________________'
p "Array without odd numbers: #{array.select { |element| element.even? }}"
p '______________________________________'
p "Nums that are divisible by 3 without remainder: #{array.select {|element| element % 3 == 0 }} "
p '______________________________________'
p "Array with uniq elements: #{array.uniq}"
p '______________________________________'
p "Every element divided by 10: #{array.map{ |element| element / 10.0}}"
#TODO

puts '______________________________________'
min = array.index(array.min)
max = array.index(array.max)
array[min], array[max] = array[max], array[min]
p array
puts '______________________________________'

array.each do |element|
	print "#{element} "
	if element == array.min
		print "\n"
		break
	end
end
puts '______________________________________'

copiedArray = array
3.times do
	print "#{copiedArray.min} "
	copiedArray.delete(copiedArray.min)
end
print "\n"
puts '______________________________________'
