/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

enum Measurements {
    | Area
    | Perimeter
}

// 获取计算墙面信息的操作
func getWallOperation(measurements: Measurements) {
    // 嵌套函数，计算墙的面积
    func calcArea(width: Int64, height: Int64) {
        width * height
    }

    // 嵌套函数，计算墙的周长
    func calcPerimeter(width: Int64, height: Int64) {
        2 * (width + height)
    }

    match (measurements) {
        // 将嵌套函数作为返回值
        case Area => calcArea
        case Perimeter => calcPerimeter
    }
}

main() {
    var operation = getWallOperation(Area)  // 获取嵌套函数calcArea
    println(operation(2, 3))  // 调用calcArea(2, 3)，输出：6
    
    operation = getWallOperation(Perimeter)  // 获取嵌套函数calcPerimeter
    println(operation(2, 3))  // 调用calcPerimeter(2, 3)，输出：10
}
