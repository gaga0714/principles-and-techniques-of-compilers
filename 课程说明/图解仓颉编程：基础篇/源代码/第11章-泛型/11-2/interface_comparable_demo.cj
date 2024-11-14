/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

class Rectangle <: Comparable<Rectangle> {
    var width: Int64
    var height: Int64

    init(width: Int64, height: Int64) {
        this.width = width
        this.height = height
    }

    func calcArea(): Int64 {
        this.width * this.height
    }

    public operator func ==(rhs: Rectangle) {
        this.calcArea() == rhs.calcArea()
    }

    public operator func !=(rhs: Rectangle) {
        !(this == rhs)
    }

    public operator func <(rhs: Rectangle) {
        this.calcArea() < rhs.calcArea()
    }

    public operator func >(rhs: Rectangle) {
        this.calcArea() > rhs.calcArea()
    }

    public operator func <=(rhs: Rectangle) {
        !(this > rhs)
    }

    public operator func >=(rhs: Rectangle) {
        !(this < rhs)
    }

    public func compare(rhs: Rectangle) {
        if (this > rhs) {
            GT
        } else if (this < rhs) {
            LT
        } else {
            EQ
        }
    }
}

main() {
    let rect1 = Rectangle(6, 2)
    let rect2 = Rectangle(3, 4)
    let rect3 = Rectangle(5, 3)

    println(rect1 > rect3)   // 输出：false
    println(rect1 <= rect3)  // 输出：true

    match(rect2.compare(rect3)) {
        case GT => println("大于")
        case LT => println("小于")
        case EQ => println("等于")
    }  // 输出：小于
}
