/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

enum Geometry {
    | Circle | Rectangle | Cuboid
    | Circle(Int64) | Rectangle(Int64, Int64) | Cuboid(Int64, Int64, Int64)
}

enum Geometry2 {
    | Rectangle2 | Cuboid  // 避免不同enum类型的构造器同名
}

// 该全局函数的名称与Geometry类型的2个名为Circle的构造器同名
func Circle() {
    println("避免enum构造器与顶层声明同名！")
}

main() {
    // 全局函数Circle与构造器Circle同名，不能省略enum类型名
    var geometry = Geometry.Circle

    // 构造器名称不会引起歧义，可以省略enum类型名
    geometry = Rectangle
    geometry = Rectangle(4, 6)

    // Geometry和Geometry2的构造器Cuboid同名，不能省略enum类型名
    geometry = Geometry.Cuboid(3, 6, 8)
}
