// https://docs.swift.org/swift-book/documentation/the-swift-programming-language/guidedtour/
print("Hello, world!")

// 変数
var myVariableInt = 20
myVariableInt = 50
let myConstantInt = 42

let myVariableDoubleImp = 70.0
let myVariableDoubleExp: Double = 70

let label = "The width is "
let width = 94
let widthLabel = label + String(width)
print(widthLabel)

// テンプレート文字列への変数埋め込みは \()
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."
print(appleSummary)
print(fruitSummary)

// 複数行の最初のインデント部分は自動的に消される
let quotation = """
  Even though there's whitespace to the left,
  the actual lines aren't indented.
      Except for this line.
  Double quotes (") can appear without being escaped.

  I still have \(apples + oranges) pieces of fruit.
  """
print(quotation)

// 配列・辞書
var fruits = ["strawberries", "limes", "tangerines"]
fruits[1] = "grapes"
print(fruits)

fruits.append("blueberries")
print(fruits)

var occupations = [
  "Malcolm": "Captain",
  "Kaylee": "Mechanic",
]
occupations["Jayne"] = "Public Relations"
print(occupations)

fruits = []
occupations = [:]
// 新規空配列作る際は型を明示
let emptyArray: [String] = []
let emptyDictionary: [String: Float] = [:]

// 制御
// for-in: for var in arr {}
// if-else: if cond {} else {}
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
  if score > 50 {
    teamScore += 3
  } else {
    teamScore += 1
  }
}
print(teamScore)

// ifの結果を代入
let scoreDecoration =
  if teamScore > 10 {
    "🎉"
  } else {
    ""
  }
print("Score:", teamScore, scoreDecoration)

// Optional型からの値取得試行
// OptionalType: Type?: nil or Type
// if let var = optionalVar {}
var optionalName: String? = nil
var greeting = "Hello!"
if let name = optionalName {
  greeting = "Hello, \(name)"
}
print(greeting)

// Optional型値のデフォルト値
// optionalVar ?? defaultVar
let nickname: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickname ?? fullName)"
print(informalGreeting)

// 単にlet optioanlVar {}でもOptional型の値取得試行ができる
// Optionalについてはアンラップのためにletが2回使える
if let nickname {
  print("Hey, \(nickname)")
}

// switch-case-default
// case a, bのように複数キャッチできる
// var where cond で条件も指定できる
// breakは不要
let vegetable = "red pepper"
switch vegetable {
case "celery":
  print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
  print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
  print("Is it a spicy \(x)?")
default:
  print("Everything tastes good in soup.")
}

// for-inで辞書のkey, valueをそれぞれ取り出し
// 使わないのは_で
let interestingNumbers = [
  "Prime": [2, 3, 5, 7, 11, 13],
  "Fibonacci": [1, 1, 2, 3, 5, 8],
  "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (k, numbers) in interestingNumbers {
  for number in numbers {
    print("\(k) - \(number)")
    if number > largest {
      largest = number
    }
  }
}
print(largest)

// while cond {}
var n = 2
while n < 100 {
  n *= 2
}
print(n)

// repeat {} while cond (do-while)
var m = 2
repeat {
  m *= 2
} while m < 100
print(m)

// range
// (startNum)..<(finishNum+1)
print([Int](0..<4))

// 関数
// func fnName(arg: argType) -> returnType
func greet(person: String, day: String) -> String {
  return "Hello \(person), today is \(day)."
}
print(greet(person: "Bob", day: "Tuesday"))

// 引数の名前を省略させるには引数の名前の前に_
func greet(_ person: String, on day: String) -> String {
  return "Hello \(person), today is \(day)."
}
print(greet("John", on: "Wednesday"))

// タプルを使えば複数の値を返せる
// タプルの各値に名前をつけられる
// 名前かインデックスを指定して値を取得
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
  var min = scores[0]
  var max = scores[0]
  var sum = 0

  for score in scores {
    if score > max {
      max = score
    } else if score < min {
      min = score
    }
    sum += score
  }

  return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)  // .min, .max, .sum
// Prints "120"
print(statistics.2)  //.0, .1, .2
// Prints "120"

// 関数内で関数を定義できる
func returnFifteen() -> Int {
  var y = 10
  func add() {
    y += 5
  }
  add()
  return y
}
print(returnFifteen())

// 関数はプリミティブ型であるため、変数として扱うことができる
// 関数を返す関数を作れる
func makeIncrementer() -> ((Int) -> Int) {
  func addOne(number: Int) -> Int {
    return 1 + number
  }
  return addOne
}
var increment = makeIncrementer()
print(increment(7))

// 関数を引数とする関数を作れる
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
  for item in list {
    if condition(item) {
      return true
    }
  }
  return false
}
func lessThanTen(number: Int) -> Bool {
  return number < 10
}
var numbers = [20, 19, 7, 12]
print(hasAnyMatches(list: numbers, condition: lessThanTen))

// 関数はクロージャ（{}で定義される、処理や変数を閉じ込めたコードブロック）の特別な場合
// 下記のように無名のクロージャを作り、`in`の前に引数と返り値の型を定義することができる
// 無名関数
print(numbers)
print(
  numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
  }))

// 1行で済む場合は下記のように単に処理のみ書けば良い
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)

// `in`による引数の記載を書略する場合、$nでインデックスnの引数を使うことができる
let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)
