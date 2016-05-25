import BSON
import Foundation

let document: Document = [
    "_id": ~ObjectId(),
    "name": "Obbut",
    "some-stuff": [
                      "hoi": "je waddup",
                      "kaas": 24,
                      "friet": "het is patat, geen friet. gvd.",
                      "hond": 3424.32,
                      "appelsap": ["kaas", "friet", "saus"]
        ],
    "patat": "ja hoi",
    "soep": "kaas",
    "salade": "kaas",
    "harriebob": "salade"
]

var durations = [NSTimeInterval]()
var otherDocuments = [Document]()

for _ in 0..<10000 {
    let start = NSDate()
    
    var newDoc = Document()
    newDoc["henk"] = document["soep"]
    newDoc["harriebob"] = document["harriebob"]
    newDoc["stuff"] = document["nonexistentkey"]
    
    let end = NSDate()
    
    otherDocuments.append(newDoc)
    durations.append(end.timeIntervalSince(start))
}

print(otherDocuments)

durations.sort()

let mp: Double = 1000
let ds = "ms"

print("MIN: \(durations.first! * mp) \(ds)")
print("MAX: \(durations.last! * mp) \(ds)")

let average = durations.reduce(0, combine: +) / Double(durations.count)

print("AVERAGE: \(average * mp) \(ds)")
