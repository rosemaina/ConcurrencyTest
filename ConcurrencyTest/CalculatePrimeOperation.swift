//
//  CalculatePrimeOperation.swift
//  ConcurrencyTest
//
//  Created by Rose Maina on 24/06/2019.
//  Copyright © 2019 rose maina. All rights reserved.
//

import Foundation

// You create a class because it gives you access to more methods.
class CalculatePrimeOperation:Operation {
    
    override func main() {
        for number in 0 ... 100_000_000 {
            let isPrimeNumber = isPrime(number: number)
            print("\(number) is prime: \(isPrimeNumber)")
        }
    }
    
    func isPrime(number: Int) -> Bool {
        if number <= 1 {
            return false
        }
        if number <= 3 {
            return true
        }
        var i = 2
        while i * i <= number {
            if number % i == 0 {
                return false
            }
            i = i + 2
        }
        return true
    }
}
