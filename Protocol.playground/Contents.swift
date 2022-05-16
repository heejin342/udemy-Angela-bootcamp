protocol CanFly {
    func fly()
}

class Bird {
    
    var isFemale = true
    
    func layEgg(){
        if isFemale {
            print("egg")
        }
    }
}

class Eagle: Bird,CanFly {

    func fly() {
        print("eagle fly!")
    }

    func soar(){
        print("gooooor")
    }
}

class Pengun: Bird{
    func swim(){
        print("어푸")
    }
}

struct FlyingMuseum {
    // 펭귄은 CanFly 프로토콜을 채택하지 않아서 이 함수 콜 불가
    func flyingDemo(flyingObjet: CanFly) {
        flyingObjet.fly()
    }
}

struct Airplain: CanFly {
    func fly() {
        print("airplane fly!")
    }
}

let myEagle = Eagle()
myEagle.fly()
myEagle.layEgg()
myEagle.soar()


let myPenguin = Pengun()
myPenguin.layEgg()
myPenguin.swim()
//myPenguin.fly()


let myPlane = Airplain()
//myPlane.layEgg()
myPlane.fly()


let museum = FlyingMuseum()
museum.flyingDemo(flyingObjet: myEagle)
//museum.flyingDemo(flyingObjet: myPenguin)
museum.flyingDemo(flyingObjet: myPlane)

