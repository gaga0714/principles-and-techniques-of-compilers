/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

class Rectangle {
    private var width: Int64   // 表示矩形的宽度
    private var height: Int64  // 表示矩形的高度

    init(width: Int64, height: Int64) {
        this.width = width
        this.height = height
    }

    mut prop propWidth: Int64 {
        get() {
            width
        }

        set(width) {
            this.width = width
        }
    }

    mut prop propHeight: Int64 {
        get() {
            height
        }

        set(height) {
            this.height = height
        }
    }

    func calcPerimeter() {
        2 * (width + height)
    }
}

extend Rectangle {
    func calcArea() {
        this.propWidth * this.propHeight  // this可以省略
    }
}

extend Rectangle {
    func printRectInfo() {
        println("宽度=${propWidth} 高度=${propHeight}")
        println("周长=${calcPerimeter()}")  // 调用Rectangle的非private成员函数
        println("面积=${calcArea()}")       // 调用Rectangle的扩展中的非private成员函数
    }
}

main() {
    let rect = Rectangle(30, 20)
    rect.printRectInfo()
}
