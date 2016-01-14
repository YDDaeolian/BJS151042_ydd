//
//  main.swift
//  XMSwift002
//
//  Created by lanou3g on 16/1/13.
//  Copyright © 2016年 东东. All rights reserved.
//

import Foundation

print("Hello, World!")

// !!!:结构体
//在swift中 Int, Float, String, Array, Dict他们都是"值类型",包括结构体
//以上类型的实现,都是用结构体实现的

// 结构体定义
struct Student1
{
    var name:String
    var age:Int
    var gender:Bool
    //也能定义函数,当我们不定义函数的时候,系统默认生成构造函数
}

var stu1: Student1 = Student1(name: "强哥", age: 28, gender: true)//stu1 栈区
print(stu1.name)

//如果成员变量为可选类型,系统会额外生成一个构造方法,此方法将所有的成员变量设置为nil
struct Struent2
{
    var name:String?
    var age:Int?
    var gender:Bool?
}

var stu2:Struent2 = Struent2()
print(stu2)

var stu3:Struent2 = Struent2(name: "强哥", age: 28, gender: true)
// ! 告知编译器此时name一定有值
print(stu3.name!)

struct Student3 {
    var name:String?
    var age:Int?
    var gender:Bool?
    
    //定义方法 / 定义函数
    func study() -> Void
    {
        print("\(name)正在学习")
    }
    func play()
    {
        print("\(name)正在玩耍")
    }
    
    // 加上mutating 之后,该方法可以修改本结构体的成员变量
    mutating func changeName()
    {
        name = "张三"
    }
}

var stu4:Student3 = Student3(name: "强哥", age: 28, gender: true)
stu4.study()
stu4.play()
stu4.changeName()
print(stu4.name)

struct Student4 {
    var name:String?
    var age:Int?
    var gender:Bool?
    //重写构造方法
    //重写所有变量均为空的方法
    init()
    {
        self.name = "强哥"
        self.age = 28
        self.gender = true
    }
    init(name:String, age:Int, gender:Bool)
    {
        self.name = name
        self.age = age
        self.gender = gender
    }
}

var stu5:Student4 = Student4()
print(stu5)

var stu6:Student4 = Student4(name: "强哥", age: 28, gender: true)
print(stu6.name)

// !!!:类
class Person1 {
    var name:String?
    var age:Int?
    var gender:Bool?
    var height:Float?
    
    init(name:String, age:Int, gender:Bool, height:Float)
    {
        self.name = name
        self.age = age
        self.gender = gender
        self.height = height
    }
}

var person1:Person1 = Person1(name: "强哥", age: 28, gender: true, height: 175)
print(person1.name)

var s1:Student1 = Student1(name: "强哥", age: 28, gender: true)
var s2:Student1 = s1

s2.name = "张三"
print(s1.name)

var p1:Person1 = Person1(name: "强哥", age: 28, gender: true, height: 175)
var p2:Person1 = p1
p2.name = "张三"
print(p1.name)

var array:Array<Int> = [1,2,3]
func addElement(inout array:Array<Int>)
{
    array.append(4)
}
addElement(&array)
print(array)

// !!!:继承
class Father
{
    var name:String?
    var age:Int?
    var gender:Bool?
    
    init(name:String, age:Int, gender:Bool)
    {
        self.name = name
        self.age = age
        self.gender = gender
    }
    func earnMoney()
    {
        print("\(self.name)正在赚钱")
    }
}
class Child: Father {
    var mather:String
    init(name:String, age:Int, gender:Bool, mother:String)
    {
        self.mather = "强嫂"
        super.init(name: name, age: age, gender: gender)
    }
    override func earnMoney() {
        print("\(self.name!)不会赚钱")
    }
}

var child1:Child = Child(name: "hehe", age: 88, gender: true, mother: "kk")
child1.earnMoney()



