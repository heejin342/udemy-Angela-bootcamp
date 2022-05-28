import UIKit

class Animal {
    var name: String

    init(n: String){
        name = n
    }
}

class Human: Animal {
    func code(){
        print("Type...")
    }
}

class Fish: Animal {
    func breathUnderWater(){
        print("Breatring under water")
    }
}

struct Fish2 {
    func breathUnderWater2(){
        print("Breatring under water")
    }
}


let heejin = Human(n: "heejin")
let jack = Human(n: "jack")
let nemo = Fish(n: "nemo")
let nemo2 = Fish2()

let neighbor = [heejin, jack, nemo]

if neighbor[0] is Human {
    print("Human")
}

if neighbor[2] is Human {
    print("Human")
}

func findNemo(from animals: [Animal]) {
    for animal in animals {
//        print(animal.name)
        if animal is Fish {
            print(animal.name)
            let fish = animal as! Fish
            fish.breathUnderWater()
            
            //upcasting
            let animalFish = fish as Animal
        }
    }
}
findNemo(from: neighbor)

if let fish = neighbor[1] as? Fish {
    fish.breathUnderWater()
}else {
    print("Casting failed")
}

if let fish = neighbor[2] as? Fish {
    fish.breathUnderWater()
}else {
    print("Casting failed")
}

let fish = neighbor[1] as? Fish
let fish2 = neighbor[2] as? Fish
print(fish?.name) // nil
print(fish2?.name) // name

if let fish = neighbor[1] as? Fish {
    fish.breathUnderWater()
}


let num = 12
// AnyObject는 클래스 타입만 허용가능하다
//let neighbors2: [AnyObject] = [heejin, jack, nemo, num]
let neighbors2: [Any] = [heejin, jack, nemo, num]




//Any는 struct 포함가능
let neihhbor3: [Any] = [heejin, jack, nemo2]
//클래스가 아니기때문에 에러
//let neihhbor4: [AnyObject] = [heejin, jack, nemo2]



let num2: NSNumber = 12
let word: NSString = "abc"
// 클래스타입, struct 둘다 허용안함. NS- 타입만 허용함
let neighbor4: [NSObject] = [num2, word]
let neighbor5: [NSObject] = [num2, word]
