/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

class Rectangle <: Equatable<Rectangle> {
    var width: Int64
    var height: Int64

    init(width: Int64, height: Int64) {
        this.width = width
        this.height = height
    }

    func calcArea() {
        this.width * this.height
    }

    public operator func ==(rhs: Rectangle) {
        this.calcArea() == rhs.calcArea()
    }

    public operator func !=(rhs: Rectangle) {
        !(this == rhs)
    }
}

main() {
    let rect1 = Rectangle(6, 2)
    let rect2 = Rectangle(3, 4)
    let rect3 = Rectangle(5, 3)
    println(rect1 == rect2)  // 输出：true
    println(rect1 == rect3)  // 输出：false
    println(rect1 != rect3)  // 输出：true
}
