import Dispatch

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

// クラス
// 通常の処理と同じくvar/letでメンバ変数を定義、funcでメンバ関数を定義する
// コンストラクタは省略可
class Shape {
  var numberOfSides = 0
  func simpleDescription() -> String {
    return "A shape with \(numberOfSides) sides."
  }
}

// インスタンス生成はclassName()
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()
print(shapeDescription)

// コンストラクタはinit(arg)
// クラス内でのインスタンス参照はself
// オーバーライドする場合は`override`でマーク必須
class NamedShape {
  var numberOfSides: Int = 0
  var name: String

  init(name: String) {
    self.name = name
  }

  func simpleDescription() -> String {
    return "A shape with \(numberOfSides) sides."
  }
}

// 継承クラス
// className: subClassName
class Square: NamedShape {
  var sideLength: Double

  init(sideLength: Double, name: String) {
    self.sideLength = sideLength
    super.init(name: name)
    numberOfSides = 4
  }

  func area() -> Double {
    return sideLength * sideLength
  }

  override func simpleDescription() -> String {
    return "A square with sides of length \(sideLength)."
  }
}
let test = Square(sideLength: 5.2, name: "my test square")
print(test.area())
print(test.simpleDescription())

// メンバ変数のゲッターとセッター
// var varName: varType { get {} set {} }
// セッター内での新しい値の引数名を明示しない場合はデフォルトで newValue となる
class EquilateralTriangle: NamedShape {
  var sideLength: Double = 0.0

  init(sideLength: Double, name: String) {
    self.sideLength = sideLength
    super.init(name: name)
    numberOfSides = 3
  }

  var perimeter: Double {
    get {
      return 3.0 * sideLength
    }
    set {
      sideLength = newValue / 3.0
    }
  }

  override func simpleDescription() -> String {
    return "An equilateral triangle with sides of length \(sideLength)."
  }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
// Prints "9.3"
triangle.perimeter = 9.9
print(triangle.sideLength)
// Prints "3.3000000000000003"

// セッター・ゲッターで値に関係なく単にメンバ変数の変更前・変更後に処理を差し込みたいだけの場合専用の書き方がある
// willSet / didSet
class TriangleAndSquare {
  var triangle: EquilateralTriangle {
    willSet {
      square.sideLength = newValue.sideLength
    }
  }
  var square: Square {
    willSet {
      triangle.sideLength = newValue.sideLength
    }
  }
  init(size: Double, name: String) {
    square = Square(sideLength: size, name: name)
    triangle = EquilateralTriangle(sideLength: size, name: name)
  }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
// Prints "10.0"
print(triangleAndSquare.triangle.sideLength)
// Prints "10.0"
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)
// Prints "50.0"

// オプショナル型のオブジェクトのメンバ変数へのアクセスは変数名に?を付けることでnilだった場合に無視できる
var optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
print(optionalSquare?.sideLength ?? 0)
optionalSquare = nil
print(optionalSquare?.sideLength ?? 0)

// 列挙
// enum enumName: enumType {case ...}
// デフォルトでは0から割り当てる
// 関数も定義できる
// 型が明らかな場合、列挙型名は省略可
enum Rank: Int {
  case ace = 1
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
print(Rank.jack.rawValue)

// 列挙型のコンストラクタは対応する値がない場合nilを返す
if let convertedRank = Rank(rawValue: 99) {
  print("found Rank: \(convertedRank.simpleDescription())")
} else {
  print("not found Rank")
}

// 列挙型の場合、switchにおいてすべての値をキャッチしていればdefaultは必要ない
enum Suit {
  case spades, hearts, diamonds, clubs

  func simpleDescription() -> String {
    switch self {
    case .spades:
      return "spades"
    case .hearts:
      return "hearts"
    case .diamonds:
      return "diamonds"
    case .clubs:
      return "clubs"
    }
  }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()

// 列挙型の値に引数を持たせることができ、switchのケースで引数に名前をつけて取り出すことができる
// 状態に関連する値を紐づけて使うことができる
enum ServerResponse {
  case result(String, String)
  case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")

switch success {
case let .result(sunrise, sunset):
  print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
  print("Failure...  \(message)")
}
// Prints "Sunrise is at 6:00 am and sunset is at 8:09 pm."

// 構造体（Structure）
// ほとんどクラスと同じだが、クラスは参照渡しなのに対して構造体は値渡し
struct Card {
  var rank: Rank
  var suit: Suit
  func simpleDescription() -> String {
    return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
  }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()
print(threeOfSpadesDescription)

// 非同期処理（Concurrency）
// 返り値の型の前にasyncを付ける
// func fnName(callArgName argName: argType) async -> returnType {}
func fetchUserID(from server: String) async -> Int {
  if server == "primary" {
    return 97
  }
  return 501
}

// 非同期処理を待つ（同期実行）の場合はawaitを付ける
func fetchUsername(from server: String) async -> String {
  let userID = await fetchUserID(from: server)
  if userID == 501 {
    return "John Appleseed"
  }
  return "Guest"
}

// 変数にasyncを付けておいて、使うときにawaitを付けることでその変数が利用可能になってから処理できる
func connectUser(to server: String) async {
  async let userID = fetchUserID(from: server)
  async let username = fetchUsername(from: server)
  let greeting = await "Hello \(username), user ID \(userID)"
  print(greeting)
}

// 同期実行ブロック内で非同期処理を呼び出す場合はTask{}を使う
Task {
  await connectUser(to: "primary")
}

// Taskのグループを作って複数の非同期処理を待つ
let userIDs = await withTaskGroup(of: Int.self) { group in
  for server in ["primary", "secondary", "development"] {
    group.addTask {
      return await fetchUserID(from: server)
    }
  }

  // groupに追加したTaskがすべて完了してから

  var results: [Int] = []
  for await result in group {
    results.append(result)
  }
  return results
}
print(userIDs)

// アクター（actor）
// クラスとほぼ同じだが、複数スレッドで同時に実行した際に一つのスレッドのみがメンバ変数にアクセスできる
// 競合防止をロック・セマフォ・Mutex、ディスパッチキュー(DispatchQueue)を使わなくてもシンプルに実装できる
// https://blog.personal-factory.com/2022/01/16/explanation-of-actor-since-swift5_5/
class ScoreDQ {
  private let serialQueue = DispatchQueue(label: "serial-dispatch-queue")
  var logs: [Int] = []
  private(set) var highScore: Int = 0

  func update(with score: Int, completion: @escaping ((Int) -> Void)) {
    serialQueue.async { [weak self] in
      guard let self = self else { return }
      self.logs.append(score)
      if score > self.highScore {
        self.highScore = score
      }
      completion(self.highScore)
    }
  }
}
actor Score {
  var logs: [Int] = []
  private(set) var highScore: Int = 0

  // updateによるscore, highScoreへのアクセスは同時に実行しても1スレッドのみ
  func update(with score: Int) {
    logs.append(score)
    if score > highScore {
      highScore = score
    }
  }
}

// ---
// awaitで処理が一時中断されることに注意
// つまりactorが保証するのはメンバ変数への同時アクセスによるデータ競合防止のみ
// （メソッド自体の同時実行制御ではない）
actor ImageDownloader {
  private var cached: [String: String] = [:]

  func image(from url: String) async -> String {
    // キャシュがあればそれを使う
    if cached.keys.contains(url) {
      return cached[url]!
    }
    // ダウンロード
    let image = await downloadImage(from: url)  // ① ③・④共にここまで実行されて中断される
    // キャッシュに保存
    cached[url] = image  // ②
    /*
    if !cached.keys.contains(url) { // 追加
        cached[url] = image
    }
    */
    return cached[url]!
  }

  func downloadImage(from url: String) async -> String {
    try? await Task.sleep(nanoseconds: 2 * 1_000_000_000)  // 2秒待つ
    switch url {
    case "monster":
      // サーバー側でリソースが変わったことを表すため、ランダムで返す
      return Bool.random() ? "👾" : "🎃"
    default:
      return ""
    }
  }
}
let imageDownloader = ImageDownloader()
Task.detached {
  let image = await imageDownloader.image(from: "monster")  // ③
  print(image)  // ③'
}
Task.detached {
  let image = await imageDownloader.image(from: "monster")  // ④
  print(image)  // ④'
}

// プロトコル（インターフェース）
protocol ExampleProtocol {
  var simpleDescription: String { get }
  mutating func adjust()
}

// 実装は継承と同じ
class SimpleClass: ExampleProtocol {
  var simpleDescription: String = "A very simple class."
  var anotherProperty: Int = 69105
  func adjust() {
    simpleDescription += "  Now 100% adjusted."
  }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

// 構造体の場合は自身の値を変える際にmutatingを付けて明示
// 構造体全体が変わるためってことかな
struct SimpleStructure: ExampleProtocol {
  var simpleDescription: String = "A simple structure"
  mutating func adjust() {
    simpleDescription += " (adjusted)"
  }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

// エクステンション（extension）
// 既存の型への機能拡張
extension Int: ExampleProtocol {
  var simpleDescription: String {
    return "The number \(self)"
  }
  mutating func adjust() {
    self += 42
  }
}
print(7.simpleDescription)

// ある変数が特定のプロトコルに適合する型であればなんでもよいものとして定義できる
// any protocolType
let protocolValue: any ExampleProtocol = a
print(protocolValue.simpleDescription)

// エラーハンドリング
// エラー型はErrorプロトコルを継承して作成
enum PrinterError: Error {
  case outOfPaper
  case noToner
  case onFire
}

// スロー（throws, throw）
func send(job: Int, toPrinter printerName: String) throws -> String {
  if printerName == "Never Has Toner" {
    throw PrinterError.noToner
  }
  return "Job sent"
}

// 補足（do-catch）
do {
  let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
  print(printerResponse)
} catch {  // 任意のエラー
  print(error)
}

// エラーを指定して補足
do {
  let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
  print(printerResponse)
} catch PrinterError.onFire {
  print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
  print("Printer error: \(printerError).")
} catch {
  print(error)
}

// 値取得時に例外発生であればnilにする（Optionalにする）
let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")

// defer（finallyの代わり）
// 関数が返り値を返す前に例外発生関係なく必ず実行する処理を記述
var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
  fridgeIsOpen = true
  defer {
    fridgeIsOpen = false
  }

  let result = fridgeContent.contains(food)
  return result
}
if fridgeContains("banana") {
  print("Found a banana")
}
print(fridgeIsOpen)
// Prints "false"

// ジェネリクス（型引数）
// <T>で定義
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
  var result: [Item] = []
  for _ in 0..<numberOfTimes {
    result.append(item)
  }
  return result
}
print(makeArray(repeating: "knock", numberOfTimes: 4))

// whereで型引数の型に条件をつけられる
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
where T.Element: Equatable, T.Element == U.Element {
  for lhsItem in lhs {
    for rhsItem in rhs {
      if lhsItem == rhsItem {
        return true
      }
    }
  }
  return false
}
print(anyCommonElements([1, 2, 3], [3]))

// 2025/03/02 11:20
