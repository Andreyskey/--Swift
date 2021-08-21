import UIKit

// Homework
// Задача 1
// Написать функцию, которая определяет, четное число или нет.

func isEven(number: Int) -> Bool {
    if number % 2 == 0 {
        return true
    } else {
        return false
    }
}


// Задача 2
// Написать функцию, которая определяет, делится ли число без остатка на 3

func isDividedByThree(number: Int) -> Bool {
    if number % 3 == 0 {
        return true
    } else {
        return false
    }
}


// Задача 3
// Создать возрастающий массив из 100 чисел.

var arr = Array(1...100)


// Задача 4
// Удалить из этого массива все четные числа и все числа, которые не делятся на 3

var newArr = [Int]()
for i in arr {
    if !isEven(number: i) && !isDividedByThree(number: i) {
        newArr.append(i)
    }
}
arr = newArr
newArr = []


// Задача 5
// Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.

func fibonachi(array: [Int]) -> Int {
    let fi: Int = array[array.count - 1] + array[array.count - 2]
    return fi
}

var arrFi = [1, 1]

for _ in 1...89 {
    arrFi.append(fibonachi(array: arrFi))
}
