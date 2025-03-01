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
