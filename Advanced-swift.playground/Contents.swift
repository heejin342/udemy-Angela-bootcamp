import UIKit

var pizzaInches: Int = 14 {
    willSet { //이 값이 바뀌는지 보고 트리거된다
        print(newValue)
    }
    didSet { //이 값이 바뀌면 트리거된다.
        print(oldValue)
        
        if pizzaInches >= 18 {
            print("invalid size specified, pizza in inches set to 18.")
            pizzaInches = 18
        }
    }
}

pizzaInches = 8 // 이순간 willSet, didSet 순으로 실행되고, 8, 14 가 출력된다.
pizzaInches = 33
print(33)


var numberOfSlices: Int {
    get { // getter
        return pizzaInches - 4
    }
    set { // setter
        print("number \(newValue)")
    }
}

numberOfSlices = 12 // setter 작동. 만약 set{} 블락을 빼줬다면 read-only 기 때문에 이 거 작동 안함
print(numberOfSlices) //getter 작동

let a = numberOfSlices + 14
print(a)



var numberOfPeople: Int = 12
let slicesPerPerson: Int = 4

var numberOfPizza: Int {
    get {
        let numberOfPeopleFedPerPizza = numberOfSlices / numberOfPeople
        return numberOfPeople / numberOfPeopleFedPerPizzas
    }
    set {
        let totalSlices = numberOfSlices * newValue
        numberOfPeople = totalSlices / slicesPerPerson
    }
}

print(numberOfPizza)
numberOfPizza = 4

print(numberOfPeople)
