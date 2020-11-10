array =  [621, 445, 147, 159, 430, 222, 482, 44, 194, 522, 652,
           494, 14, 126, 532, 387, 441, 471, 337, 446, 18, 36, 
           202, 574, 556, 458, 16, 139, 222, 220, 107, 82, 264,
           366, 501, 319, 314, 430, 55, 336]
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

p "получить новый массив, который бы содержал в себе те буквы английского алфавита, порядковый номер которых есть в нашем массиве;"
english_array = ('a'..'z').to_a
english_array_empty = []
english_array.each_with_index do |element, index|
	if array.include?(index + 1)
		 english_array_empty <<  element
	end
end
p english_array_empty

p "поменять местами минимальный и максимальный элементы массива"
puts '______________________________________'
min = array.index(array.min)
max = array.index(array.max)
array[min], array[max] = array[max], array[min]
p array
puts '______________________________________'

p "найти элементы, которые находятся перед минимальным числом в массиве"
p array[0...array.index(array.min)]
puts '______________________________________'

p "необходимо найти три наименьших элемента."
copiedArray = array
3.times do
	print "#{copiedArray.min} "
	copiedArray.delete(copiedArray.min)
end
print "\n"
puts '______________________________________'

