import Foundation


func gcd(_ x: Int, _ y: Int) {
    print("Calculating GCD of \(x) and \(y)")
    let result = euclid(x: max(x,y), y: min(x,y))
    print("GCD of \(x) and \(y) is \(result.0) and took \(result.1) iterations\n")
}

func euclid(x: Int, y: Int, i: Int = 0, s: Int? = nil) -> (Int, Int) {
    print("s\(i) = \(x+y)" + (s != nil ? String(format: " < %.3f", 2/3*(Double(s!))) : ""))
    return y == 0 ? (x, i+1) : y == 1 ? (1, i+1) : euclid(x: y, y: x % y, i: i+1, s: x+y)
}

func extendedEuclid(_ x: Int, _ y: Int) -> (g: Int, a: Int, b: Int) {
    if y == 0 {
        return (g: x, a: 1, b: 0);
    }
    else {
        let prime = extendedEuclid(y, x%y)
        let g = prime.g
        let a = prime.b
        let b = prime.a - x/y * prime.b
        return (g: g, a: a, b: b)
    }
}

func eGCD(_ x: Int, _ y: Int) {
    let res = extendedEuclid(max(x,y), min(x,y));
    print("GCD of \(x) and \(y) is \(res.g)\n(\(res.a)) * \(max(x,y)) + (\(res.b)) * \(min(x,y)) = \(res.g)")
}

eGCD(307, 52)

//gcd(33, 88)
//gcd(109, 75)
//gcd(610, 377)
//gcd(1705, 2596)
//gcd(400, 600)
//gcd(611, 196418)
//gcd(196418, 317811)
