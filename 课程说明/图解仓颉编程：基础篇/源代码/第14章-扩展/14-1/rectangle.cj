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
