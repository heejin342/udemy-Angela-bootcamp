protocol AdvancedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport?
    
    func assessSituation() {
        print("무슨일이야?")
    }
    
    func medicalEmergency() {
        delegate?.performCPR()
    }
}

struct Paramedic: AdvancedLifeSupport {

    init(hander: EmergencyCallHandler) {
        hander.delegate = self
    }
    
    func performCPR() {
        print("CPR!!")
    }
}

class Doctor: AdvancedLifeSupport {
 
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("doctor CPR...")
    }
    
    func useStetScope(){
        print("Listening heart")
    }
}

class Surgeon: Doctor {
    override func performCPR() {
        super.performCPR()
        print("Sings..")
    }
    
    func useElectricDrill(){
        print("Whirrrrrrr")
    }
}

let emil = EmergencyCallHandler()
let pete = Paramedic(hander: emil)
let angela = Surgeon(handler: emil)

emil.assessSituation()
emil.medicalEmergency()
