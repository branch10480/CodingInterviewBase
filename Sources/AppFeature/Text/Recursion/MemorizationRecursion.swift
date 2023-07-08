import Common

/*
 フィボナッチ数列の n番目の数字を求める fib(n) を考える
 */

public func doMemorizationRecursion() {
    let max: Int = 10
    print("フィボナッチ数列を出力する(\(max)個)")
    var elements: [Int] = []
    for i in 0..<max {
        elements.append(fib(i))
    }
    print(elements.map(\.description).joined(separator: ", "))
}

private var memo: [Int: Int] = [0: 0, 1: 1]

private func fib(_ n: Int) -> Int {
    if let cache = memo[n] {
        return cache
    }
    return fib(n-1) + fib(n-2)
}
