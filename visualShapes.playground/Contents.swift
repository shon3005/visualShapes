//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

class Shape: UIView {
    var color:UIColor
    
    init(color:UIColor) {
        self.color = color
        super.init(frame: CGRectNull)
        self.backgroundColor = color
    }
    
    func getArea() -> Double {
        return 0
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class Square: Shape {
    var width:Int
    
    init(width:Int, color:UIColor) {
        self.width = width
        super.init(color: color)
        self.frame.size = CGSize(width: width, height: width)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func getArea() -> Double {
        return(M_PI * Double(width * width))
    }
}

class Rectangle: Shape {
    var width: Int
    var height: Int
    
    init(width:Int, height:Int, color: UIColor) {
        self.width = width
        self.height = height
        super.init(color: color)
        self.frame.size = CGSize(width: width, height: height)
    }
    
    override func getArea() -> Double {
        return(Double(width * height))
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class Circle: Shape {
    var radius:Int
    
    init(radius:Int, color:UIColor) {
        self.radius = radius
        super.init(color: color)
        self.frame.size = CGSize(width: radius * 2, height: radius * 2)
        self.layer.cornerRadius = CGFloat(radius)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func getArea() -> Double {
        return(Double(radius * radius))
    }
}

class RoundedRectangle: Rectangle {
    
    var radius:Int
    
    init(radius:Int, width:Int, height:Int, color: UIColor) {
        self.radius = radius
        super.init(width: width, height: height, color: color)
        self.frame.size = CGSize(width: width, height: height)
        self.layer.cornerRadius = CGFloat(radius)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func getArea() -> Double {
        return(Double(width * height))
    }
}

var circle = Circle(radius: 50, color: UIColor.blueColor())
var square = Square(width: 100, color: UIColor.redColor())
var rectangle = Rectangle(width: 200, height: 100, color: UIColor.greenColor())
var roundedRectangle = RoundedRectangle(radius: 10, width: 200, height: 100, color: UIColor.purpleColor())

circle.center = CGPoint(x: 100, y: 100)
square.center = CGPoint(x: 200, y: 200)
rectangle.center = CGPoint(x: 300, y: 300)
roundedRectangle.center = CGPoint(x: 400, y: 400)

circle.getArea()
square.getArea()
rectangle.getArea()

let view = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 320))
XCPShowView("Shapes!", view)

view.addSubview(circle)
view.addSubview(square)
view.addSubview(rectangle)
view.addSubview(roundedRectangle)

