def generate_array()
	size = Random.rand(5..10)
	array = Array.new(size) {rand(-10..10)  }
end


#Task 1
p' Дан целочисленный массив. Необходимо вывести вначале его элементы с четными индексами, а затем - с нечетными.'
array = GenerateArray()
p array
p array.each_with_index{|el, i| p el if i.even? }
p array.each_with_index{|el, i| p el if i.odd? }
puts "______________________"

#Task2
p 'Дан целочисленный массив. Необходимо вывести вначале его элементы с нечетными индексами, а затем - четными.'
array = GenerateArray()
p array
p array.each_with_index{|el, i| p el if i.odd?}
p array.each_with_index{|el, i| p el if i.even?}
puts "______________________"

#Task3
p 'Дан целочисленный массив. Вывести номер первого из тех его элементов, которые удовлетворяют двойному неравенству: A[0] < A[i] < A[-1]. Если таких элементов нет, то вывести [ ].'
array = GenerateArray()
p array
array.uniq.each { |e| break e if array.first < e && e < array.last }
puts "______________________"

#Task 4
p 'Дан целочисленный массив. Вывести номер последнего из тех его элементов, которые удовлетворяют двойному неравенству: A[0] < A[i] < A[-1]. Если таких элементов нет, то вывести [ ]'
array = GenerateArray()
p array
array.reverse.each_with_index{|el , i| p(array.size - i - 1) && break if (el > array[0] && el < array[-1]) }
puts "______________________"


#Task5
p 'Дан целочисленный массив. Преобразовать его, прибавив к четным числам первый элемент. Первый и последний элементы массива не изменять.'
array = GenerateArray()
p array
array.each_with_index do |arr, index|
	if array[index] % 2 == 0 and index > 0 and index != array.length - 1
		array[index] += array[0]
	end
end
p array
puts "______________________"



#Task6
p 'Дан целочисленный массив. Преобразовать его, прибавив к четным числам последний элемент. Первый и последний элементы массива не изменять'
array = GenerateArray()
p array
array.each_with_index do |arr, index|
	if array[index] % 2 == 0 and index > 0 and index != array.length - 1
		array[index] += array[-1]
	end
end
p array
puts "______________________"

#Task7
p 'Дан целочисленный массив. Преобразовать его, прибавив к нечетным числам последний элемент. Первый и последний элементы массива не изменять.'
array = GenerateArray()
p array
array.each_with_index do |arr, index|
	if array[index] % 2 == 1 and index > 0 and index != array.length - 1
		array[index] += array[-1]
	end
end
p array
puts "______________________"

#Task8
p 'Дан целочисленный массив. Преобразовать его, прибавив к нечетным числам первый элемент. Первый и последний элементы массива не изменять.	'
array = GenerateArray()
p array
array.each_with_index do |arr, index|
	if array[index] % 2 == 1 and index > 0 and index != array.length - 1
		array[index] += array[0]
	end
end
p array
puts "______________________"

#Task9
p 'Дан целочисленный массив. Заменить все положительные элементы на значение минимального.'
array = GenerateArray()	
p array
array.each_with_index do |arr, index|
	if array[index] > 0
		array[index] = array.min
	end
end
p array
puts "______________________"

#Task10
p 'Дан целочисленный массив. Заменить все положительные элементы на значение максимального.'
array = GenerateArray()
p array
array.map { |e| e.positive? ? e = array.max : e }
p array
puts "______________________"

#Task11
p 'Дан целочисленный массив. Заменить все отрицательные элементы на значение минимального.'
array = GenerateArray()
p array
array.each_with_index do |arr, index|
	if array[index] < 0
		array[index] = array.min
	end
end
p array
puts "______________________"

#Task12
p 'Дан целочисленный массив. Заменить все отрицательные элементы на значение максимального.'
array = GenerateArray()
p array
array.each_with_index do |arr, index|
	if array[index] < 0
		array[index] = array.max
	end
end
p array
puts "______________________"

#Task13
p 'Дан целочисленный массив. Осуществить циклический сдвиг элементов массива влево на одну позицию.'
array = GenerateArray()
array = array.rotate(1)
p array
puts "______________________"

#Task14
p 'Дан целочисленный массив. Осуществить циклический сдвиг элементов массива вправо на одну позицию.'
array = GenerateArray()
p array
array = array.rotate(-1)
p array
puts "______________________"

#Task15
p 'Дан целочисленный массив. Проверить, образуют ли элементы арифметическую прогрессию. Если да, то вывести разность прогрессии, если нет - вывести nil.'
array = GenerateArray()
p array
#An+1 = An + d
isProgression = true
if array.length >= 2
	difference = array[1] - array[0]
else
	isProgression = false
	puts "nil"
end
array.each_with_index do |arr, index|
	if index < array.length-1 and array[index + 1] - array[index] != difference
		isProgression = false
		puts "nil"
		break
	end
end
if isProgression
	puts difference
end
puts "______________________"


#Task16
p 'Дан целочисленный массив. Проверить, образуют ли элементы геометрическую прогрессию. Если да, то вывести знаменатель прогрессии, если нет - вывести nil.'
array = GenerateArray()
p array
isProgression = true
if array.length >= 2
	denominator = array[1] / array[0]
else
	isProgression = false
	puts "nil"
end
if isProgression
	array.each_with_index do |arr, index|
		if index < array.length-1 and array[index] * denominator != array[index+1]
			isProgression = false
			puts "nil"
			break
		end
	end
end
if isProgression
	puts denominator
end
puts "______________________"


#Task17
p 'Дан целочисленный массив. Найти количество его локальных максимумов.'
array = GenerateArray()
p array
count = 0
for i in 1..array.length-2
	if array[i-1]<array[i] and array[i+1]<array[i]
		count +=1
	end
end
puts count

#Task18
p 'Дан целочисленный массив. Найти количество его локальных минимумов.'
array = GenerateArray()
p array
count = 0
(1..array.length-2).each do |i|
	if array[i-1]>array[i] and array[i+1]>array[i]
		count +=1
	end
end
puts count
puts "______________________"

#Task19
p 'Дан целочисленный массив. Найти максимальный из его локальных максимумов'
array = GenerateArray()
p array
localmax = array.min-1 # Щоб зайти в другий if, коли буде знайдено перший локальний максимум
(1..array.length-2).each do |i|
	if array[i-1]<array[i] and array[i+1]<array[i]
		if localmax < array[i]
			localmax = array[i]
		end
	end
end
if array.include?(localmax)
	puts localmax
else
	puts 'There is no local maximum in this array. Try again with another array'
end
puts "______________________"

#Task20
p 'Дан целочисленный массив. Найти минимальный из его локальных минимумов'
array = GenerateArray()
p array
localmin = array.max+1 # Щоб зайти в другий if, коли буде знайдено перший локальний minimum
(1..array.length-2).each do |i|
	if array[i-1]>array[i] and array[i+1]>array[i]
		if localmin > array[i]
			localmin = array[i]
		end
	end
end
if array.include?(localmin)
	puts localmin
else
	puts 'There is no local minimum in this array. Try again with another array'
end
puts "______________________"

#Task21
p 'Дан целочисленный массив. Определить количество участков, на которых его элементы монотонно возрастают.'
array = GenerateArray()
p array
x = 0
array.each_with_index do |arr, index|
	if index <array.length-1 and array[index+1] > array[index]
		x+=1
		if index > 0 and array[index] > array[index-1]
			x-=1
		end
	end
end
p x
puts "______________________"


#Task22
p 'Дан целочисленный массив. Определить количество участков, на которых его элементы монотонно убывают.'
array = GenerateArray()
p array
x = 0
array.each_with_index do |arr, index|
	if index <array.length-1 and array[index+1] < array[index]
		x+=1
		if index > 0 and array[index] < array[index-1]
			x-=1
		end
	end
end
p x
puts "______________________"



#Task23
p 'Дано вещественное число R и массив вещественных чисел. Найти элемент массива, который наиболее близок к данному числу.'
array = GenerateArray()
p array
r = Random.rand(0.1..9.99) #Рандомно вибирає число з проміжкаr
p "R = : #{r}"
x = (array[0] - r).abs
answer = 0
array.each_with_index do |element, index|
	if x  > (array[index]- r).abs
		x = (array[index] - r).abs
		answer = index
	end
end
puts array[answer]
puts "______________________"

#Task24
p 'Дано вещественное число R и массив вещественных чисел. Найти элемент массива, который наименее близок к данному числу'
array = GenerateArray()
p array
r = Random.rand(0.1..9.99) #Рандомно вибирає число з проміжка
p r
x = (array[0] - r).abs
answer = 0
array.each_with_index do |element, index|
	if x  < (array[index]- r).abs
		x = (array[index] - r).abs
		answer = index
	end
end
puts array[answer]
puts "______________________"

#Task25
p 'Дан целочисленный массив. Преобразовать его, вставив перед каждым положительным элементом нулевой элемент.'
array = GenerateArray()
p array
count = 0
(0..array.length).each do |i|
	if count + i < array.length and array[i+count] > 0
		array.insert(i+count, array[0])
		count += 1
	end
end
p array

#Task26
p 'Дан целочисленный массив. Преобразовать его, вставив перед каждым отрицательным элементом нулевой элемент.'
array = GenerateArray()
p array
count = 0
(0..array.length).each do |i|
	if count + i < array.length and array[i+count].negative?
		array.insert(i+count, array[0])
		count += 1
	end
end
p array

#Task27
p 'Дан целочисленный массив. Преобразовать его, вставив после каждого положительного элемента нулевой элемент'
array = GenerateArray()
p array
count = 0
(0..array.length).each do |i|
	if count + i < array.length and array[i+count].positive?
		array.insert(i+count + 1, array[0])
		count += 1
	end
end
p array

#Task28
p 'Дан целочисленный массив. Преобразовать его, вставив после каждого отрицательного элемента нулевой элемент.'
array = GenerateArray()
p array
count = 0
(0..array.length).each do |i|
	if count + i < array.length and array[i+count].negative?
		array.insert(i+count + 1, array[0])
		count += 1
	end
end
p array


#Task29
p 'Дан целочисленный массив. Упорядочить его по возрастанию.'
array = GenerateArray()
p array
array = array.sort
p array
puts "______________________"

#Task30
p 'Дан целочисленный массив. Упорядочить его по убыванию.'
array = GenerateArray()
p array
array = array.sort
array = array.reverse
p array
puts "______________________"

#Task31
p 'Дан целочисленный массив. Вывести индексы массива в том порядке, в котором соответствующие им элементы образуют убывающую последовательность.'
array = GenerateArray()
p array
array.each_with_index do |arr, index|
	if index < array.length-1 and array[index] > array[index+1]
		print "#{index} "
	end
end
puts ' '
puts "______________________"

#Task32
p 'Дан целочисленный массив. Вывести индексы массива в том порядке, в котором соответствующие им элементы образуют возрастающую последовательность'
array = GenerateArray()
p array
array.each_with_index do |arr, index|
	if index < array.length-1 and array[index] < array[index+1]
		print "#{index} "
	end
end
puts ' '
puts "______________________"


#Task33
p 'Дан целочисленный массив. Найти индекс минимального элемента.'
array = GenerateArray()
p array
array.each_with_index do |arr, index|
	if array[index] == array.min
		p index
	end
end
puts "______________________"

#Task34
p 'Дан целочисленный массив. Найти индекс максимального элемента.'
array = GenerateArray()
p array
array.each_with_index do |arr, index|
	if array[index] == array.max
		p index
	end
end
puts "______________________"




#Task35
p 'Дан целочисленный массив. Найти индекс первого минимального элемента.'
array = GenerateArray()
p array
p array.index(array.min)
puts "______________________"

#Task36
p 'Дан целочисленный массив. Найти индекс первого максимального элемента.'
array = GenerateArray()
p array
p array.index(array.max)
puts "______________________"

#Task37
p 'Дан целочисленный массив. Найти индекс последнего минимального элемента.'
array = GenerateArray()
p array
p array.rindex(array.min)
puts "______________________"

#Task38
p 'Дан целочисленный массив. Найти индекс последнего максимального элемента.'
array = GenerateArray()
p array
p array.rindex(array.max)
puts "______________________"

#Task39
p 'Дан целочисленный массив. Найти количество минимальных элементов.'
array = GenerateArray()
p array
array.map { |e| e if e == array.min }.compact.count
p count
puts "______________________"

#Task40
p 'Дан целочисленный массив. Найти количество максимальных элементов.'
array = GenerateArray()
p array
count = 0
(0..array.length-1).each do |i|
	if array[i] == array.max
		count +=1
	end
end
p count
puts "______________________"

#Task41
p 'Дан целочисленный массив. Найти минимальный четный элемент.'
array = GenerateArray()
p array
array = array.select { |element| element.even? }
p "Array only with even elements : #{array}"
p "Min = : #{array.min}"
puts "______________________"

#Task42
p 'Дан целочисленный массив. Найти минимальный нечетный элемент.'
array = GenerateArray()
p array
array = array.select { |element| element.odd? }
p "Array only with odd elements : #{array}"
p "Min = : #{array.min}"
puts "______________________"

#Task43
p 'Дан целочисленный массив. Найти максимальный четный элемент.'
array = GenerateArray()
p array
array = array.select { |element| element.even? }
p "Array only with even elements : #{array}"
p "Max = : #{array.max}"
puts "______________________"

#Task44
p 'Дан целочисленный массив. Найти максимальный нечетный элемент.'
array = GenerateArray()
p array
array = array.select { |element| element.odd? }
p "Array only with odd elements : #{array}"
p "Max = : #{array.max}"
puts "______________________"

#Task45
p 'Дан целочисленный массив. Найти минимальный положительный элемент.'
array = GenerateArray()
p array
array = array.select { |element| element.positive? }
p "Array only with positive elements : #{array}"
p "Min = : #{array.min}"
puts "______________________"

#Task46
p 'Дан целочисленный массив. Найти максимальный отрицательный элемент.'
array = GenerateArray()
p array
array = array.select { |element| element.negative? }
p "Array only with negative elements : #{array}"
p "Max = : #{array.max}"
puts "______________________"

#Task47
p 'Дан целочисленный массив и интервал a..b. Найти минимальный из элементов в этом интервале.'
array = GenerateArray()
p array
a = 1
b = 4
min = array[a]
(a..b).each do |i|
	if min > array[i]
		min = array[i]
	end
end
p "Interval: #{a}..#{b}"
p "Min : #{min}"
puts "______________________"

#Task48
p 'Дан целочисленный массив и интервал a..b. Найти максимальный из элементов в этом интервале'
array = GenerateArray()
p array
a = 1
b = 4
max = array[a]
(a..b).each do |i|
	if max < array[i]
		max = array[i]
	end
end
p "Interval: #{a}..#{b}"
p "Max : #{max}"
puts "______________________"

#Task49
p 'Дан целочисленный массив. Найти количество элементов, расположенных перед первым минимальным.'
array = GenerateArray()
p array
p "Min : #{array.min}"
p array.index(array.min)
puts "______________________"

#Task50
p 'Дан целочисленный массив. Найти количество элементов, расположенных перед первым максимальным'
array = GenerateArray()
p array
p "Max : #{array.max}"
p array.index(array.max)
puts "______________________"


#______________________________________50 tasks done____________________________________________
# Дальше я увлекся и продолжил делать задачи. Их, как я понял проверять не будут, но пусть повисят)

#Task51
p 'Дан целочисленный массив. Найти количество элементов, расположенных после первого максимального'
array = GenerateArray()
p array
p "Max : #{array.max}"
p array.length - array.index(array.max) -1
puts "______________________"

#Task52
p 'Дан целочисленный массив. Найти количество элементов, расположенных после первого минимального'
array = GenerateArray()
p array
p "Min : #{array.min}"
p array.length - array.index(array.min) -1
puts "______________________"

#Task53
p 'Дан целочисленный массив. Найти количество элементов, расположенных перед последним максимальным.'
array = GenerateArray()
p array
p "Max : #{array.max}"
p array.rindex(array.max)
puts "______________________"

#Task54
p 'Дан целочисленный массив. Найти количество элементов, расположенных перед последним минимальным.'
array = GenerateArray()
p array
p "Min : #{array.min}"
p array.rindex(array.min)
puts "______________________"

#Task55
p 'Дан целочисленный массив. Найти количество элементов, расположенных после последнего максимального.'
array = GenerateArray()
p array
p "Max : #{array.max}"
p array.length - array.rindex(array.max) -1
puts "______________________"

#Task56
p 'Дан целочисленный массив. Найти количество элементов, расположенных после последнего минимального'
array = GenerateArray()
p array
p "Max : #{array.min}"
p array.length - array.rindex(array.min) -1
puts "______________________"

#Task57
p 'Дан целочисленный массив. Найти индекс первого экстремального (то есть минимального или максимального) элемента.'
array = GenerateArray()
p array
p "Max : #{array.max}"
p "Min : #{array.min}"
if array.index(array.max) > array.index(array.min)
	p array.index(array.min)
else 
	p array.index(array.max)
end
puts "______________________"

#Task58
p 'Дан целочисленный массив. Найти индекс последнего экстремального (то есть минимального или максимального) элемента.'
array = GenerateArray()
p array
p "Max : #{array.max}"
p "Min : #{array.min}"
if array.rindex(array.max) < array.rindex(array.min)
	p array.rindex(array.min)
else 
	p array.rindex(array.max)
end
puts "______________________"

#Task59
p 'Дан целочисленный массив. Найти количество элементов, между первым и последним минимальным.'
array = GenerateArray()
p array
firstMinIndex = array.index(array.min)
lasMinIndex = array.rindex(array.min)
p firstMinIndex
p lasMinIndex
if firstMinIndex != lasMinIndex
	p lasMinIndex - firstMinIndex - 1
else
	p firstMinIndex
end
puts "______________________"

#Task60
p 'Дан целочисленный массив. Найти количество элементов, между первым и последним максимальным.'
array = GenerateArray()
p array
firstMaxIndex = array.index(array.max)
lasMaxIndex = array.rindex(array.max)
p firstMaxIndex
p lasMaxIndex
if firstMaxIndex != lasMaxIndex
	p lasMaxIndex - firstMaxIndex - 1
else
	p firstMaxIndex
end
puts "______________________"

#Task65
p 'Дан целочисленный массив. Вывести вначале все его четные элементы, а затем - нечетные.'
array = GenerateArray()
p array
newArray = array.select { |element| element.even? }
p newArray.concat(array.select { |element| element.odd? })
puts "______________________"

#Task66
p 'Дан целочисленный массив. Вывести вначале все его нечетные элементы, а затем - четные.'
array = GenerateArray()
p array
newArray = array.select { |element| element.odd? }
p newArray.concat(array.select { |element| element.even? })
puts "______________________"
