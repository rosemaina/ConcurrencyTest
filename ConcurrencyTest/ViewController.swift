//
//  ViewController.swift
//  ConcurrencyTest
//
//  Created by Rose Maina on 24/06/2019.
//  Copyright © 2019 rose maina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var primeNumberButton: UIButton!
    var isTapped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func calculatePrimeNumbers(_ sender: Any) {
        let queue = OperationQueue()
        
        // -This method line 24 tends to create a lot of classes. Not advisable for small operations
        //      let operation = CalculatePrimeOperation()
        //      queue.addOperation(operation)
        
        enablePrimeButton(false)
        queue.addOperation {
            for number in 0 ... 100_000 {
                let isPrimeNumber = self.isPrime(number: number)
                print("\(number) is prime: \(isPrimeNumber)")
            }
            OperationQueue.main.addOperation({
                self.enablePrimeButton(true)
            })
        }
    }
    
    func enablePrimeButton(_ isEnabled: Bool){
        primeNumberButton.isEnabled = isEnabled
        
        if isEnabled {
            primeNumberButton.setTitle("Calculate Prime Numbers", for: .normal)
        } else {
            primeNumberButton.setTitle("Calculating...", for: .normal)
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
