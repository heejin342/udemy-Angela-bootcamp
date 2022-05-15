import UIKit

var myOptinal: String?

//myOptinal = nil
//let text:String = myOptinal! //error

struct MyOptionalStruct {
    var property = 123
    func method(){
        print("i am method")
    }
}

myOptinal = "heejin"

if myOptinal != nil {
    let text2: String = myOptinal!
    print(text2)
}else {
    print("error")
}

if let sateOptinal = myOptinal {
    let text3: String = sateOptinal
    print(text3)
}else{
    print("error")
}


myOptinal = nil
let newtext: String = myOptinal ?? "i am default value"
print(newtext)


var myOptionalStruct: MyOptionalStruct?
var myOptionalStruct2 = MyOptionalStruct()
myOptionalStruct = nil
//print(myOptional!.property) //error
print(myOptionalStruct?.property)

myOptionalStruct = MyOptionalStruct()
myOptionalStruct?.method()
myOptionalStruct?.property = 2
print(myOptionalStruct?.property)
