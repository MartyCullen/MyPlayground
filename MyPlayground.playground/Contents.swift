import UIKit

// Resources

// Free Swift Fundamentals
// https://learnswiftwithbob.com

// Int/Adv Swift 4 course $50 for $40 w/ coupon
// https://www.udemy.com/learn-swift-with-bob/?couponCode=GITBOOK       // 20% discount

//Best resources for Advanced iOS Developer (Swift)
//https://medium.com/@PavloShadov/best-resources-for-advanced-ios-developer-swift-ade30374593d

//New Course: Advanced Swift 3
//https://www.raywenderlich.com/160730/new-course-advanced-swift-3

//Awesome-Swift-Playgrounds
//https://github.com/uraimo/Awesome-Swift-Playgrounds/tree/master/playgrounds

//Learning Path: Advanced Swift
//https://academy.realm.io/posts/learning-path-advanced-swift/

//10 Tips to become a better Swift Developer
//https://www.bobthedeveloper.io/blog/10-tips-to-become-a-better-swift-developer

//https://www.weheartswift.com

//Advanced Swift
//https://developer.apple.com/videos/play/wwdc2014/404/

//15 Tips to Become a Better Swift Developer
//https://savvyapps.com/blog/swift-tips-for-developers

//Five Swift Talks You Should Watch
//https://cocoacasts.com/five-swift-talks-you-should-watch/





//-----------------------------------------------------------------------------------------------------------------------------------------------------
// MISC stuff

//API availability pg168


//-----------------------------------------------------------------------------------------------------------------------------------------------------
// ARC stuff

// STRONG is the default
class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    // This must be WEAK or we will have a retain cycle because the objects reference each other
    weak var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}


//-----------------------------------------------------------------------------------------------------------------------------------------------------
// OPTIONALS stuff (pg56)
// A "nullable" variable
var optionalString: String? = nil 
//var nonOptionalString: String = nil
// Because it is OPTIONAL (specified by question mark) the nil is allowed
// The second line will not compile

var greeting: String
if let name = optionalString {
    greeting = "Hello, \(name)"
}
// if the optional value is NIL, conditional is FALSE, and conditional code is NOT run

let informationGreeting = "Hi \(optionalString ?? "Default String")"
// You can specify a default value for an optional variable  (Nil-Coalescing Operator)

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
let explicitlyTyped :Int? = convertedNumber  // Note the questionMark indicating that this is an optional

if convertedNumber != nil {
    // Note the BANG - this is forced unwrapping since we know it is NOT null
    print("We definitely have an integer: \(convertedNumber!)")
}

// This is optional binding and note that the BANG is not needed like it was above
// We are using a temp var to store the value if it is not nil
if let actualNumber = Int(possibleNumber) {
    print("\(possibleNumber) has an integer value of \(actualNumber)")
} else {
    print("\(possibleNumber) could not be converted to an integer")
}

// Optional Chaining
// Our person object has a name but not an Apartment (because it is an optional property)
let john = Person(name: "John")

// This would fail because we promised to have a value and it is nil
// let unit = john.apartment!.unit
// so we use Optional Chaining...
if let unit = john.apartment?.unit {
    print("John's apartment is unit \(unit)")
} else {
    print("Unable to retrieve the unit number.")
}


// Implicitly unwrapped optionals can be used to tell the compiler you PROMISE to have a value (like after initialization
// Country.capitalCity is not known when declared, but will be populated 3 lines later, se we add the BANG for the compiler
// Because it is implicitly unwrapped, we do not need to use the BANG when assigning it to a non-optional
class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name:capitalName, country:self)
    }
}

class City{
    let name: String
    unowned let country: Country
    init(name:String, country:Country){
        self.name = name
        self.country = country
    }
}

// Nil coalescing Operator
// If a is not nil, unwrap it and use it, otherwise use b
// (a??b)
// a != nil ? a! : b
let defaultColor = "red"
var userDefinedColor: String?
var colorToUse = userDefinedColor ?? defaultColor











//-----------------------------------------------------------------------------------------------------------------------------------------------------
// NUMBER stuff (pg44)
// Int, Int8, Int16, Int32, Int64, UInt8...
// Doube, Float
let binary = 0b100001
let octal = 0o21
let hex = 0x1f
typealias AudioSample = UInt16
let microphone = AudioSample.min

print("Max Int = \(Int.max)")

// Ints (and doubles, etc) are actually structs
var iOne = 7
var iTwo = iOne // Creates a new COPY of the Int object
iTwo = 100
print(iOne)    // Still 7 in the original


//-----------------------------------------------------------------------------------------------------------------------------------------------------
// STRING stuff
let const = "My Constant"
var str = "Hello, playground \(const)"
let str2 = String(format:"/user/%@", const)
print("My constant is = \(const) and my string is \(str2)")

var emptyString = ""  // or String() works just as well for empty string
if emptyString.isEmpty { // NOTE the .isEmpty method
    print("EmptyString")
}
emptyString += "Some text" // Easy concatenation
let count = emptyString.count // NOTE no longer need the "characters" before count

let this = "word"
let that = "word"
if this == that {
    print("same")
}

// Strings are actually structs
var sOne = "Bob"
var sTwo = sOne // Creates a new COPY of the string object
sTwo = "Tony"
print(sOne)    // Still Bob in the original


//-----------------------------------------------------------------------------------------------------------------------------------------------------
// TUPLES stuff (pg 54)
// Create
let http404Error = (404, "Not Found") // without element names
let http200Status = (statusCode:200, description: "OK")
// Access
print(http404Error.0)
print(http200Status.description)

func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")


//-----------------------------------------------------------------------------------------------------------------------------------------------------
// FONT stuff
let font : UIFont = UIFont ( name : "HelveticaNeue" , size : 18.0 )!

var pointSize : CGFloat = font.pointSize
var ascender : CGFloat = font.ascender
var descender : CGFloat = font.descender
var leading : CGFloat = font.leading
var capHeight : CGFloat = font.capHeight
var xHeight : CGFloat = font.xHeight
var lineHeight : CGFloat = font.lineHeight

var diff : CGFloat = font.ascender - font.capHeight
var ratio : CGFloat = diff / font.pointSize

let i : NSInteger = 7 / 60

print(ascender)

func printFonts() {
    let fontFamilyNames = UIFont.familyNames
    for familyName in fontFamilyNames {
        print("------------------------------")
        print("Font Family Name = \(familyName)")
        let names = UIFont.fontNames(forFamilyName: familyName)
        print("Font Names = \(names)")
    }
}

// Commented out to speed up playground
//printFonts()



//-----------------------------------------------------------------------------------------------------------------------------------------------------
// DATE stuff
var date1 : NSDate = NSDate()
var interval : TimeInterval = date1.timeIntervalSince1970

NSIntegerMax

let dateLastNite : NSDate = NSDate(timeIntervalSince1970: 1430190884.0)
let dateMorning : NSDate = NSDate(timeIntervalSince1970: 1430195000.0)
let dateMid : NSDate = NSDate(timeIntervalSince1970: 1430240000.0)
let dateEvening : NSDate = NSDate(timeIntervalSince1970: 1430279900.0)
let dateTomorrow : NSDate = NSDate(timeIntervalSince1970: 1430280100.0)

var curCal : Calendar = Calendar.current
var tz = curCal.timeZone.abbreviation

var dayOfYearPast : NSInteger = curCal.ordinality(of: Calendar.Component.day, in: Calendar.Component.year, for: dateLastNite as Date)!
var dayOfYearAM   : NSInteger = curCal.ordinality(of: Calendar.Component.day, in: Calendar.Component.year, for: dateMorning as Date)!
var dayOfYearPM   : NSInteger = curCal.ordinality(of: Calendar.Component.day, in: Calendar.Component.year, for: dateEvening as Date)!

var dayOfEraPast : NSInteger = curCal.ordinality(of: Calendar.Component.day, in: Calendar.Component.era, for: dateLastNite as Date)!
var dayOfEraAM   : NSInteger = curCal.ordinality(of: Calendar.Component.day, in: Calendar.Component.era, for: dateMorning as Date)!
var dayOfEraPM   : NSInteger = curCal.ordinality(of: Calendar.Component.day, in: Calendar.Component.era, for: dateEvening as Date)!

var formatter : DateFormatter = DateFormatter()
formatter.dateFormat = "g"
var lastNiteString = formatter.string(from: dateLastNite as Date)
var AMString = formatter.string(from: dateMorning as Date)
var PMString = formatter.string(from: dateEvening as Date)



//-----------------------------------------------------------------------------------------------------------------------------------------------------
// ARRAY stuff (pg110)
var array = ["one", "two", "three"]
array[1] = "toast"
print(array)

var emptyArray = [String]()
var anotherArray = [String]()             // Alternate syntax for creating an array
var oneMoreArray: Array<String> = Array() // Array is a struct, so this works too
emptyArray = []                           // Clearing out an array

// Arrays are actually structs
var aOne = ["Bob"]
var aTwo = aOne // Creates a new COPY of the array object
aTwo.append("Tony")
print(aOne)    // Still just Bob in the original


//-----------------------------------------------------------------------------------------------------------------------------------------------------
// DICTIONARY stuff
var occupations = [
"Bill": "Captain",
"Tony": "Ensign"]

var emptyDictionary = [String: Float]()
emptyDictionary = [:]

// Dictionaries are actually structs
var dOne = ["Bob":"Builder"]
var dTwo = dOne        // Creates a new COPY of the dictionary object
dTwo["Joe"] = "Farmer" // Add Joe to the copy
print(dOne)            // Still just Bob in the original


//-----------------------------------------------------------------------------------------------------------------------------------------------------
// SET stuff
// Arrays are actually structs too

var setOne: Set = [1, 2, 4, 7, 9, 2, 2, 2, 2]  // Note that swift cant figure out that this is not an array so you must give it the type SET (But element type IS INFERRED)
print(setOne)                                  // Duplicates are not permitted in a set (so the number 2 only appears ONCE)
var setTwo: Set<String> = ["Marley", "Newhart", "Hope"]
var setThree = Set<String>()
var setFour = Set([1.5, 5.0, 0.111])

setTwo.insert("Saget")
setTwo.contains("Hope") // true
setTwo.remove("Saget")

let arrayOfNumbers = [1, 4, 6, 77, 1, 1, 1]
let setOfNumbers = Set(arrayOfNumbers)  // Conversion array -> set
let sortedArray = setOfNumbers.sorted() // Conversion set -> array

var oddNumberSet: Set = [1, 3, 5, 7, 9]
let evenNumberSet: Set = [0, 2, 4, 6, 7, 9]

oddNumberSet.union(evenNumberSet)                // union is an adjective          NonMutating
oddNumberSet.symmetricDifference(evenNumberSet)  // ...difference is an adjective  NonMutating
oddNumberSet.intersection(evenNumberSet)         // intersection is an adjective   NonMutating
oddNumberSet.subtract(evenNumberSet)             // SUBTRACT IS A VERB             MUTATING

//*** Swift naming guide - - use verbs for mutating methods and adjectives/nouns otherwise
// https://swift.org/documentation/api-design-guidelines/       // Name Mutating/nonmutating method pairs
//     Mutating           Nonmutating
//     Verb               Verb with -ing or -ed
//     x.sort()           z = x.sorted()
//     x.append(y)        z = x.appending(y)
//
//     NonMutating        Mutating
//     Noun               prefix with form-
//     x = y.union(z)     y.formUnion(z)
//     j = c.successor    c.formSuccessor(&i)

//-----------------------------------------------------------------------------------------------------------------------------------------------------
// FLOW CONTROL stuff (pg167)
// Guard is a way to clean up preconditions instead of nested IF conditions
func getUnit() -> String {
    let joe = Person(name: "Joe")
    guard let apt = joe.apartment else {
        return "Not Found"
    }
    
    return apt.unit
}

//=== is identical to
//!== is not identical

// We can init multiple variables and incorporate an evaluation using a where clause
if let firstNumber = Int("4"), let secondNumber = Int("42") , firstNumber < secondNumber {
    print("\(firstNumber) < \(secondNumber)")
}

// Use defer to define work that needs to be done HOWEVER you exit the method
func simpleDefer() {
    defer {
        print("This happens at end")
    }
    print("This happens First")
}
simpleDefer()

// Here is a more useful example http://nshipster.com/guard-and-defer/
// The DEALLOC must be done for ALL EXIT conditions, now you only have to write it ONCE
// And it is written IMMEDIATELY FOLLOWING the alloc, so you do not have to search for it
func allocMemory(){
    let dataSize = 64
    let destData = UnsafeMutablePointer<UInt8>.allocate(capacity: dataSize)
    defer {
        destData.deallocate(capacity: dataSize)
    }
    
    if false {
        return
    }
    
    return
}

//-----------------------------------------------------------------------------------------------------------------------------------------------------
// SWITCH stuff (pg7/146)
let veg = "red pepper"
switch veg {
case "celery":
    print("Ewww")
case "cuke":
    print("ughhh")
case let x where x.hasSuffix("pepper"):
    print("spicy")
default:
    print("other")
}
// NO BREAK REQUIRED
//No implicit fall through but can use explicit fallthrough


//-----------------------------------------------------------------------------------------------------------------------------------------------------
// LOOP stuff (pg7)
var n=2
//while n < 100 {
//}

//repeat {
//} while n < 2

//for i in 0...5 {
//}

//for i in 0..<4 {
//}



//-----------------------------------------------------------------------------------------------------------------------------------------------------
// FUNCTION stuff (pg11)
func greet(_ person:String, on day:String) -> String {
    return "Hello \(person), today is \(day)."
}
// NOTE: underscore indicating NO label, and ON indicating label different from "day"
// Format: func yourFunction(externalParameterName localParameterName :Type, ....)
greet("John", on:"Wednesday")


// Can take multiple input params and return multiple values
func callStats(numbers: Int...) -> (min: Int, max: Int, sum: Int) {
    return (1, 2, 3)
}

// Can pass a function as a parameter
func greetAll(people: [String], process: (String, String) -> String){
    
}

//Argument labels for Params Pg179
//Variadic params pg181
//Params are CONSTANTS BY DEFAULT pg182


//-----------------------------------------------------------------------------------------------------------------------------------------------------
// CLOSURE stuff (pg16/191)
var numbers = [20, 19, 7, 12]
let mappedNumbers = numbers.map({
    (number: Int) -> Int in
    let result = 3*number
    return result
})
print(mappedNumbers)

let sortedNumbers2 = numbers.sorted{ $0 > $1 }
print(sortedNumbers2)


//If you are a jackass and want the least number of characters in your code you can take a statement that makes sense and make it harder to read as shown
// Define the method signature of our closure
var combine: (String, String) -> String

// Define the closure in a simple clear way
combine = {
    a, b -> String in
    return a + b
}
combine("Hello", "World")

// Then you can put the heading and body on one line and remove the RETURN key word
combine = {
    a,b -> String in a + b
}
combine("This ", "That")

// Why not remove the result type and put the whole thing on one line
combine = { a,b in a + b }
combine("Some ", "More")

// Why even have variable names
combine = { $0 + $1 }
combine("Absolutely ", "Ridiculous")

// I have seen 2 examples where they removed everything, but I can not get these to work...
//combine =  + }
//combine("Absolutely ", "Ridiculous")


// ANother demonstration of Jackassery
let animals = ["fish", "cat", "chicken", "dog"]
var sortedAnimals = animals.sorted { (one: String, two: String) -> Bool in
    return one < two
}
sortedAnimals = animals.sorted { (one, two) -> Bool in return one < two }
sortedAnimals = animals.sorted { (one, two) in return one < two }
sortedAnimals = animals.sorted { return $0 < $1 }
sortedAnimals = animals.sorted { $0 < $1 }
sortedAnimals = animals.sorted() // This only works for srings because of func <(lhs: String, rhs: String) -> Bool


// If a closure is passed as an argument to a function and it is invoked after the function returns, the closure is escaping.
// This is true for most of the cases where I pass a closure into a method (and have an asynchronous event handler
// Swift 3 changed to make non-escaping default, so we must declare ours as escaping
// We expect that completion handler to be executed after completion of the function
import HealthKit

class HealthKitManager: NSObject {
    
    private let healthStore = HKHealthStore()
    
    func requestAuthorization(completion: @escaping (Bool, Error?) -> Void) {
        var shareTypes = Set<HKSampleType>()
        var readTypes = Set<HKSampleType>()
        
        // Add Workout Type
        shareTypes.insert(HKSampleType.workoutType())
        readTypes.insert(HKSampleType.workoutType())
        
        // Request Authorization (This might take a while...)
        healthStore.requestAuthorization(toShare: shareTypes, read: readTypes, completion: completion)
    }
}
// Because non-escaping is default, optimizations can be done and you dont need a weak copy of self


//-----------------------------------------------------------------------------------------------------------------------------------------------------
// CLASS stuff (pg17)
//*** Structs pass by value and classes pass by reference

class Shape {
    var numberOfSides = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    deinit{
        // instead of dealloc
    }
    func simpleDescription(color:String) -> String {
        return "A \(color) shape with \(numberOfSides) sides"
    }
}

var shape = Shape(name:"Septagon")
shape.numberOfSides = 7
print(shape.simpleDescription(color: "Blue"))

class Square: Shape {
    override func simpleDescription(color:String) -> String {
        return "A \(color) shape with FOUR sides"
    }
}
var square = Square(name:"Septagon")
print(square.simpleDescription(color: "Red"))

// Lazy Proerties pg237
class DataImporter{
    /*
     DataImporter is a class to import data from an external file.
     The class is assumed to take a non-trivial amount of time to initialize.
     */
    var fileName = "data.txt"
    // the DataImporter class would provide data importing functionality here
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
    // the DataManager class would provide data management functionality here
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// the DataImporter instance for the importer property has not yet been created
print(manager.importer.fileName)
// The DataImporter instance for the importer property has now been created




// Computed Properties pg240
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        //        set(newCenter) {
        //            origin.x = newCenter.x - (size.width / 2)
        //            origin.y = newCenter.y - (size.height / 2)
        //        }
        set {                                                      // Note this shorthand change
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
        // If setter is not present, it is a READ ONLY computed property
        
    }
}
var square2 = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square2.center
square2.center = Point(x: 15.0, y: 15.0)
print("square2.origin is now at (\(square2.origin.x), \(square2.origin.y))")
// Prints "square2.origin is now at (10.0, 10.0)

// Property Observers
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
// About to set totalSteps to 200
// Added 200 steps
stepCounter.totalSteps = 360
// About to set totalSteps to 360
// Added 160 steps
stepCounter.totalSteps = 896
// About to set totalSteps to 896
// Added 536 steps”



// isKindOfClass is now just "is"
if (stepCounter is StepCounter){
    print("YUP")
}

// --------------CASTING -----------------
// A UILabel IS A UIView so this is UPCASTING and always works
let label = UILabel() as UIView

// Upcast as common type to add disparate types into a colllection
var name = "Bob" as Any
var number = 20 as Any
var anyArray = [name, number]

// downcast using as? (or as! NOT RECOMMENDED) and return an optional
if let element = anyArray[1] as? String {
    print(element)
}

// ACCESS CONTROL pg476





//-----------------------------------------------------------------------------------------------------------------------------------------------------
// ENUM stuff (pg23/210)

enum Rank: Int {
    case ace = 1  // set the initial value to ONE instead of the default of ZERO
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

let ace = Rank.ace
let aceRawVAlue = ace.rawValue // use rawValue to access the underlying value of the enum
let ten = Rank(rawValue: 10)  // Create an enum using it's raw value

enum Suit: Int {
    case spades, hearts, diamonds, clubs
    
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .clubs:
            return "clubs"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        }
    }
    
    func color() -> String{
        switch self {
        case .spades:
            return "black"
        case .clubs:
            return "black"
        case .hearts:
            return "red"
        case .diamonds:
            return "red"
        }
    }
}


let hearts = Suit.hearts
let heartsDesc = hearts.simpleDescription()
let heartsColor = hearts.color()



//-----------------------------------------------------------------------------------------------------------------------------------------------------
// STRUCT stuff (pg23/210)
//*** Structs pass by value and classes pass by reference
//*** Array and Dictionary are STRUCTS and pass by VALUE, so a COPY is passed
//*** Structs are 10k to 1M times faster than classes!
class HumanClass {
    var name: String
    init(name: String) {    // THIS CODE IS NEEDED IN THE CLASS (Would not be required for a struct)
        self.name = name
    }
}



// Swift will automatically create an init for you
struct HumanStruct {
    var name: String
//    init(name: String) {    // THIS CODE IS NOT NEEDED IN THE STRUCT (Would be required for a class)
//        self.name = name
//    }
}

let humanClassObjectOne = HumanClass(name: "Bob")
let humanClassObjectTwo = humanClassObjectOne  // The two variables now point to the same shared memory space
humanClassObjectTwo.name = "Bobby"             // We are allowed to mutate a property on an immutable object
print(humanClassObjectOne.name) // Now ALSO Bobby

let humanStructObjectOne = HumanStruct(name: "Bob")
let humanStructObjectTwo = humanStructObjectOne   // TWO is now a COPY of ONE
// humanStructObjectTwo.name = "Bobby"            // Cant do this like we could with a class, it is IMMUTABLE becuase the STRUCT is
var humanStructObjectThree = humanStructObjectOne // THREE is also a COPY of ONE
humanStructObjectThree.name = "Bobby"
print(humanStructObjectOne.name)                  // Original is unmodified (still Bob)



struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
         return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    
    func fullDeck() -> [Card] {
        var result = [Card]()
        for rankNum in 1..<14  {
            for suitNum in 0..<4  {
                let cardRank = Rank(rawValue: rankNum)
                let cardSuit = Suit(rawValue: suitNum)
                
                let card = Card(rank: cardRank!, suit: cardSuit!) // need to unwrap the values here
                result.append(card)
            }
        }
        return result
    }
}

let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDesc = threeOfSpades.simpleDescription()
var fullDeck = threeOfSpades.fullDeck()


// Most WTF use of an Enum I have ever seen - - how is this an ENUM????????
enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of Cheese")

switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset)")
case let .failure(message):
    print("Failure... \(message)")
}



//-----------------------------------------------------------------------------------------------------------------------------------------------------
// PROTOCOL stuff (pg28)
// Classes, Enums and Structs can adopt protocols
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = " A simple class"
    var anotherProperty: Int = 08970
    func adjust() {
        simpleDescription += "  Now adjusted"
    }
}
var a = SimpleClass()
a.adjust()
let aDesc = a.simpleDescription

struct SimpleStruct: ExampleProtocol {
    var simpleDescription: String = " A simple structure"
    var something: Double = 0.8970
    mutating func adjust() {
        simpleDescription += "  (adjusted)"
    }
}
var b = SimpleStruct()
b.adjust()
let bDesc = b.simpleDescription



//-----------------------------------------------------------------------------------------------------------------------------------------------------
// EXTENSION stuff (pg28)

extension Int: ExampleProtocol {
    // We cant do "cuteName" because you can not add properties that require storage of new information (no stored properties)
    // You can only work with the info that is already there
    //var cuteName: String = "Integers are a way to store numbers without a decimal"
    
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)

// SAMPLE DELEGATE
// @objc protocol SelectEmailViewControllerDelegate{
//     func selectEmailViewController(_ selectEmailViewController:SelectEmailViewController, selected emailAddress:String)
// }
//
// class SelectEmailViewController: HalfSheetViewController, UITableViewDelegate, UITableViewDataSource {
//
// @IBOutlet var delegate:SelectEmailViewControllerDelegate?



//-----------------------------------------------------------------------------------------------------------------------------------------------------
// ERROR HANDLING stuff (pg31/63)
enum PrinterError: Error {
    case outOfPaper, noToner, onFire
}

func send(job: Int, toPrinter printerName:String) throws -> String {
    if ( printerName == "Never has toner") {
        throw PrinterError.noToner
    }
    return "Job Sent"
}

do {
    let printerResponse = try send(job:1040, toPrinter: "Never has toner")  // The TRY is where the error can occur
    print(printerResponse)
} catch PrinterError.onFire {
    print("Get the extinguisher")
} catch let printerError as PrinterError{
    print("Printer Error: \(printerError)")
} catch { // any remaining error types
    print(error)
}

// Instead of using the do...try...catch you can return as an optional and get a nil on error
let optionalResponse = try? send(job:1040, toPrinter: "Never has toner")

// Instead of using the do...try...catch you can return as an optional and CRASH on error
//let crashResponse = try! send(job:1040, toPrinter: "Never has toner")



//-----------------------------------------------------------------------------------------------------------------------------------------------------
// GENERICS stuff (pg34/452)
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
makeArray(repeating: "knock", numberOfTimes:4)  // Implicitly defined
makeArray(repeating: 7, numberOfTimes:2)
//var intArray = makeArray<Int>(repeating: 2, numberOfTimes:3)  // Cannot Explicitly define type on a FUNCTION
// But you CAN on a STRUCT

struct GenericFam<T> {
    var members: [T] = []
    
    mutating func push(member: T) {
        members.append(member)
    }
}

//: Generic Initialization
// T Implicitly Defined
let myHappyFamily = GenericFam(members: [1, 2, 3, 4, 5])

// T Explicitly Defined
var genericFamily = GenericFam<Int>()
genericFamily.push(member: 10)
print(genericFamily)

//: Generic Extension
extension GenericFam {
    var firstElement: T? {
        if members.isEmpty {
            return nil
        } else {
            return members[0]
        }
    }
}

myHappyFamily.firstElement
let mySadFamily = GenericFam(members: [])
mySadFamily.firstElement

//: Type Constraint

class LOL {}
class BabyLol: LOL {}
let example = LOL()

func addLOLClassOnly<T: LOL>(array: [T]) { }
addLOLClassOnly(array: [example, example])
addLOLClassOnly(array: [BabyLol(), BabyLol()])

// Using type constraints for CLASSES seems like someone being clever and makes the code HARDER to read than this:
func addLOLClassOnly2(array: [LOL]) {}
addLOLClassOnly2(array: [example, example])
addLOLClassOnly2(array: [BabyLol(), BabyLol()])

// However using a type constraint to maintain compatibility with a PROTOCOL makes sense
// This function does not work because of the == not able to deal with any object
//func findIndex<T>(of valueToFind: T, in array:[T]) -> Int? {
//    for (index, value) in array.enumerated() {
//        if value == valueToFind {
//            return index
//        }
//    }
//    return nil
//}
// But if we provide a protocol (Equatable) it knows how to handle the == now
func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}


//-----------------------------------------------------------------------------------------------------------------------------------------------------
// SUBSCRIPT stuff
// Only use this shortcut if it is obvious what the subscript will return for the class - can be improperly used and make code LESS readable

struct WeekDays {
    var days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    
    subscript(index: Int) -> String {
        return days[index]
    }
}

let myDays = WeekDays()
myDays.days[3] // Normal Access
myDays[3]      // Subscript Access

// You can change the behavior of accessing dictionary elements
struct HealthInfo {
    var info = ["Height": 183, "Body Fat": 12.5, "Weight": 76]
    
    subscript(key: String) -> Double {
        if let newInfo = info[key] {   // Would be even better as a guard statement or ??
            return newInfo
        } else {
            return 0
        }
    }
}

let data = HealthInfo()
data.info["Height"]   // Without using the subscript we need to dig into the object (and it will be an optional
data["Weight"]        // Using the subscript is simpler and always returns a Double
data["NotInTheArray"] // Change what is returned for elements not in dictionary


//-----------------------------------------------------------------------------------------------------------------------------------------------------
// SINGLETON stuff
// There are two thread safety cases to consider, during initialization of the singleton instance and during reads and writes to the instance.

// Note: OUTSIDE the class = GLOBALLY available (playground does not like this so commented out)
//private let _sharedManager = PhotoManager()
//
//class PhotoManager {
//    class var sharedManager: PhotoManager {
//        return _sharedManager
//    }
//}


//-----------------------------------------------------------------------------------------------------------------------------------------------------
// MULTITHREADED / GCD stuff

// 3 types of Queue:
// Main - The main thread is serial and obviously one ONE
// Global - Concurrent ques shared by the whole system
// Custom - Developer created and can be Serial or Concurrent (These end up being handled in one of the global queues)

// 4 levels of QoS
// User-interactive - Small high-priority tasks that should be on MAIN thread
// User-initiated - UI initiated high-priority tasks - high priority global queue
// Utility - long running asynch ops - progress indicator appropriate - low priority global queue
// Background - prefetching - user unaware - background priority global queue

// Can be Asynch or Synch

// LET variables are immutable constants and thread safe
// VAR variables are mutable and not safe unless designed to be so
// Mutable collections are not safe

// Use dispatch barriers to prevent thread read/write conflicts
// Be VERY careful using sync on the MAIN queue or a custom serial queue
// sync is good for he waiting for a task to complete in the global queue


//-----------------------------------------------------------------------------------------------------------------------------------------------------
// TARGET ACTION stuff

//let selector = #selector(UserProfileViewController.editCreditCardButtonPressed(_:))
//cardView.editButton.addTarget(self, action: selector, for: .touchUpInside)



//-----------------------------------------------------------------------------------------------------------------------------------------------------
// SEGUE stuff

// self.performSegue(withIdentifier: UserProfileSegueIdentifier.CreatePasscode.rawValue, sender: sender)

//override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    if let realSegueString = segue.identifier{
//        if let userProfileSegueIdentifuer = UserProfileSegueIdentifier(rawValue:realSegueString){
//            switch userProfileSegueIdentifuer {
//            case .EditUserProfile:
//                let editUserProfileContainerViewController = segue.destination as! ModifyUserProfileContainerViewController
//                editUserProfileContainerViewController.currentUser = self.currentUser
//            case .ChangeEmail:
//                let changeEmailViewController = segue.destination as! ChangeEmailViewController
//                changeEmailViewController.currentUser = self.currentUser
//            case .ChangePassword:
//                let changePasswordViewController = segue.destination as! ChangePasswordViewController
//                changePasswordViewController.currentUser = self.currentUser
//            case .CreatePasscode:
//                let createPasscodeViewController = segue.destination as! CreatePasscodeViewController
//                createPasscodeViewController.currentUser = self.currentUser
//            case .RemovePasscode:
//                let removePasscodeViewController = segue.destination as! RemovePasscodeViewController
//                removePasscodeViewController.currentUser = self.currentUser
//            case .AddCreditCard:
//                let addCreditCardViewController = segue.destination as! AddCreditCardViewController
//                addCreditCardViewController.delegate = self
//            }
//        }
//    }
//}


//-----------------------------------------------------------------------------------------------------------------------------------------------------
// Notes
/*
 ScrollView Tricks:
 
  To get scrollview to respect width of device (It wants to squish it to the left):
  Place UIView on ScrollView pinned to UIScrollView
  Pin equal width from child UIView to PARENT UIVIEW of scrollview
 
  To prevent the keyboard from hiding bottom fields:
  conform to protocol KeyboardHandler
  Add:
 
     // Bind ScrollView Here
     @IBOutlet var scrollView: UIScrollView!
     
     override func viewDidLoad() {
         super.viewDidLoad()
        // Register
        self.registerForKeyboardEvents()
    }
         
    deinit {
        // DeRegister
        self.deregisterForKeyboardEvents()
     }

 
NavBar tricks:
 
 To get status bar tinted same color as nav bar:
 Conform to protocol UIBarPositioningDelegate
 Add:
     // MARK: - UINavigationBarDelegate methods -
     func position(for: UIBarPositioning) -> UIBarPosition {
         // Believe it or not, this allows the status bar to be tinted in the same color as the navBar
         // As long as the navBar delegate is set to the VC (in this case, set in IB)
         // and the VC conforms to UIBarPositioningDelegate
         return UIBarPosition.topAttached
     }

 To get just a chevron (no text) as back button on nav stack on a StoryBoard:
 Locate nav item on the PREVIOUS VC and set "Back Button" property to a single SPACE char
 
 To set the back color:
 Locate the NavBar on the NavController at the beginning of the nav stack
 Set "Bar Tint" for background
 Set "Tint" for image and text color
 
TableView Tricks:
 
 To get the separator flush to left side:
 self.tableView.separatorInset = UIEdgeInsets.zero

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 //            NSString* body = [[NSString alloc] initWithData:request.HTTPBody encoding:NSUTF8StringEncoding];
 //            NSString* formattedRequest = [NSString stringWithFormat:@"%@ %@\n{%@}", request.HTTPMethod, request.URL, body];
 //
 //            NSLog(@"Request: %@\rRequest Headers: %@\rSession Headers: %@", formattedRequest, [request allHTTPHeaderFields], [self.session.configuration HTTPAdditionalHeaders]);
 
 
 
 
 
 print("MARTY:\(api.request)")
 if let realBody = api.request.httpBody {
 print("MARTY:\(String(data:realBody , encoding: String.Encoding.utf8))")
 }

 
 
 
 
 
 
 
 
 
 
 
 
 
 static func tokenFor(card:CardInfo, _ completion: @escaping (Void) -> Void, failure:((APIError<StripeError>) -> Void)? = nil){
 if let realNumber = card.number, let realMonth = card.exp_month, let realYear = card.exp_year, let realCVC = card.cvc, let realName = card.name {
 
 let api:APIObject<StripeToken, StripeError> = APIObject({(StripeToken) in
 }, {(error) in
 })
 }
 else {
 if let realFailure = failure{
 realFailure(.Unexpected)
 }
 }
 
 
 
 
 
 [self setupPost];
 self.resultClass = [TCDataStripeToken class];
 
 self.endPoint = @"/v1/tokens";
 
 self[@"card[number]"] = creditCard.number;
 self[@"card[exp_month]"] = [creditCard.exp_month stringValue];
 self[@"card[exp_year]"] = [creditCard.exp_year stringValue];
 self[@"card[cvc]"] = [creditCard.cvc stringValue];
 
 if (creditCard.cardName.length > 0){
 self[@"card[name]"] = creditCard.cardName;
 }
 
 [self submit];
 
 }

 */


/* AREAS FOR IMPROVEMENT
 
 Multithreaded
 Closure
 CoreData
 Animations
 Error Handling
 WTF Enums
 Struct vs Class  (Value vs Ref)
 Strong vs Weak
 maps
 generics
 
 */



