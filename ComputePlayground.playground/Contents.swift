import UIKit

var width: Float = 3.4
var height: Float = 2.1

var bucketsOfPaint: Int {
    get {
        let area = width * height
        let areaCoverdPerBucket: Float = 1.5
        let numberOfBucket = area / areaCoverdPerBucket
        let roundedBuckets = ceilf(numberOfBucket)
        return Int(roundedBuckets)
    }
    set {
        let areaCamCover = Double(newValue) * 1.5
        print("\(areaCamCover) + covered")
    }
}

bucketsOfPaint = 4
print(bucketsOfPaint)
