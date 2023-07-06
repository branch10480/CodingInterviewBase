public func readLineString(message: String? = nil) -> String {
  printBeforeInput(message: message)
  return readLine()!
}

public func readLineInt(message: String? = nil) -> Int {
  return Int(readLineString(message: message))!
}

public func readLineAndGetInts(separatedBy separator: Character, message: String? = nil) -> [Int] {
  return readLineString(message: message).split(separator: separator).map { Int(String($0))! }
}

public func readLineAndGetTwoInts(separatedBy separator: Character, message: String? = nil) -> (Int, Int) {
  let ints = readLineAndGetInts(separatedBy: separator, message: message)
  return (ints[0], ints[1])
}

fileprivate func printBeforeInput(message: String? = nil) {
  if let message = message {
    print(message)
  }
  print("", terminator: ": ")
}
