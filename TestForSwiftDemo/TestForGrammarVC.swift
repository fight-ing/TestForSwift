//
//  TestForGrammarVC.swift
//  TestForSwiftDemo
//
//  Created by fei on 14-10-21.
//  Copyright (c) 2014年 self. All rights reserved.
//

import UIKit

class TestForGrammarVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var arrTest = ["first","second","third","four"];
        for sub:String in arrTest {
            println("arr-index :\(sub)")
            if sub == "second" {
                println("判断字符串相等 \(sub) == second")
            }
        }
        
        var dicTest = ["1":"First","2":"second","3":"Third"]
        //遍历字典
        for sub in dicTest {
            println("dic-index :\(sub)")
            println("dic-key   :\(sub.0)")  //.0 key
            println("dic-value :\(sub.1)")
            if sub.0 == "1" {
                println("判断key值 :\(sub.0) == 1")
            }
        }
        //遍历字典
        for (key,value) in dicTest {
            println("dic-test :key-\(key) == value-\(value)")
        }
        
        //通过索引
        for i in 0...3 {
            println("...index --- \(i)")
        }
        for var i=0;i<3;i++ {
            println("index --- \(i)")
        }
        
        
        //函数调用 及 switch
        var result = self.isAsked("second")
        println("func-test  :\(result)")
        result = self.isAsked("third")
        println("func-test  :\(result)")
        
        result = self.isAsked("four")
        println("func-test  :\(result)")
        
        greet("Hohn", day: "hahhahah")
        
        var double1 = self.getGasPrices().0
        var doubleA = self.getGasPrices()
        println("func-test  :\(self.getGasPrices())")
        println("func-test  :\(doubleA)")
        
        println("func-test-sum :\(self.sumOf(12,123,1231))")
        
        
        println("func-test-fifteen :\(self.returnFifteen())")
        
        
        
        var increment = self.makeIncrementer() //返回一个函数
        
        println("func-test-increment:\(increment) result:\(increment(7))")
        
        
        //一个函数接收其他函数作为参数
        var numbersArr = [12,34,16,321]
        println("func-test-fucnIn \(self.hasAnyMatches(numbersArr, condition: lessThanTen))")
        
        //类
        var shape = Shape()
        shape.numbersi = 7
        var shapeDescription = shape.simpleDescription()
        println("class-test \(shapeDescription)")
        
        
        
        // Do any additional setup after loading the view.
    }
    
    //类
    class NamedShape {
        var numberOfSides:Int = 0
        var name:String
        init(name:String){
            self.name = name
        }
        func simpleDescription()->String {
            return "A shape with \(numberOfSides) sides."
        }
    }
    
    //对象和类
    class Shape {
        var numbersi=0
        func simpleDescription()->String {
            return "A shape with \(numbersi) sides."
        }
    }
    
    //函数实际是闭包的特殊情况，可以写一个闭包而无需名字，只需要放在大括号中即可，使用in到特定参数和主题的返回值。
    
    
    /*  一个函数可以接收其他函数作为参数,(只要提供函数名)
    */
    
    func hasAnyMatches(listArr:[Int], condition:Int->Bool) ->Bool {
        for item in listArr {
            if condition(item) {
                return true;
            }
        
        }
        return false;
    }
    func lessThanTen(number:Int) ->Bool {
        return number < 10
    }
    
    
    //函数是第一类型的，这意味着函数可以返回另外一个函数
    func makeIncrementer() -> (Int ->Int) {
        func addOne(number:Int) ->Int {
            return number+1
        }
        return addOne;
    }
    
    //函数可以嵌套，内嵌函数可以访问其定义所在函数的变量，可以使用内嵌函数来组织代码，避免过长和过于复杂
    func returnFifteen() -> Int {
        var y = 10;
        
        func add() {
            y += 5;
        }
        add();
        return y;
        
    }
    
    //函数接收可变参数个数
    func sumOf(numbers:Int...) ->Int {
        var sum = 0
        for number in numbers {
            sum += number
        }
        return sum
    }
    
    //使用元组返回多个值
    func getGasPrices() ->(Double,Double,Double){
        return (1.1,2.1,4.3)
    }
    
    
    func greet(name:String,day:String) ->String {
        return "Hello\(name),today is \(day)"
    }
    //swift中switch不用break，执行匹配情况后，程序从switch跳出，而不继续执行下一情况。
    func isAsked(item:String)->Bool {
        var value:Bool
        
        switch item {
        case "first":
            value = true
        case "second","third":
            value = true
        default:
                value=false
        }
        return value;
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
