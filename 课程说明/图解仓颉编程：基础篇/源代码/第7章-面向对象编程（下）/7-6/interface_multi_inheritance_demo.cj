/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

from std import format.*

interface AreaCalculable {
    func calcArea(): Float64
}

interface PerimeterCalculable {
    func calcPerimeter(): Float64
}

interface ShapeCalculable <: AreaCalculable & PerimeterCalculable {
    static func getTypeName(): String
}

class Circle <: ShapeCalculable {
    var radius: Float64

    init(radius: Float64) {
        this.radius = radius
    }

    public static func getTypeName() {
        "Circle"
    }

    public func calcArea() {
        3.14 * radius * radius
    }

    public func calcPerimeter() {
        2.0 * 3.14 * radius
    }
}

main() {
    let circle = Circle(3.0)
    println("类型名称：${Circle.getTypeName()}")
    println("面积：${circle.calcArea().format(".2")}")
    println("周长：${circle.calcPerimeter().format(".2")}")
}
