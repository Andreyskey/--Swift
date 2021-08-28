import UIKit

// Homework Lesson-6

// Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
// Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
// * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

struct Queue<T> {
    
    var elements : [T] = []
    
    let even: (Int) -> Bool = { (element: Int) -> Bool in
        return element % 2 == 0
    }
    
    let odd: (Int) -> Bool = { (element) -> Bool in
        return element % 2 != 0
    }
    
    let evenThree: (Int) -> Bool = { return $0 % 3 == 0 } // Короткая запись замыкания
    
    func filter(elements: [Int], predicate: (Int) -> Bool ) -> [Int] {
        var arr = [Int]()
        
        for element in elements {
            if predicate(element) {
                arr.append(element)
            }
        }
        return arr
    }
    
    
    mutating func push(_ element: T) {
            elements.append(element)
        }
    
    mutating func pop() -> T? {
            return elements.removeLast()
        }
    
    subscript(index: Int) -> T? {
        get {
            if index >= 0 && index < elements.count {
                return elements[index]
            }
            return nil
        }
    }

}
