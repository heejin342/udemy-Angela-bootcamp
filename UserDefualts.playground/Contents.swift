import UIKit

let defaults = UserDefaults.standard
let dicKey = "myDic"

defaults.set(0.24, forKey: "Volume")
defaults.set(true, forKey: "MusicOn")
defaults.set("heejin", forKey: "PlayerName")
defaults.set(Date(), forKey: "AppLastOpenedByUser")

let array = [1,2,3]
defaults.set(array, forKey: "myArray")

let dic = ["name": "heejin"]
defaults.set(dic, forKey: dicKey)


let volume = defaults.float(forKey: "Volume")
let MusicOn = defaults.bool(forKey: "MusicOn")
let appLastOpened = defaults.object(forKey: "AppLastOpenedByUser")
let myArray = defaults.array(forKey: "myArray") as! [Int]
let myDic = defaults.dictionary(forKey: dicKey)

print("SDFSDF")


class Car {
    var colour = "Red"
}

let myCar = Car()
myCar.colour = "Blue"

let yourCar = Car()
print(yourCar.colour)



class Car2 {
    var colour = "Red"
    // let defaults = UserDefaults.standard 처럼 싱글톤 객체를 만드는 방법
    static let singletonCar = Car2()
}

let myCar2 = Car2.singletonCar
myCar2.colour = "Blue"

let yourCar2 = Car2.singletonCar
print(yourCar2.colour) // Blue

class A {
    init(){
        Car2.singletonCar.colour = "Brown"
    }
}

class B {
    init(){
        print(Car2.singletonCar.colour) //Brown
    }
}

let a = A()
let b = B()
