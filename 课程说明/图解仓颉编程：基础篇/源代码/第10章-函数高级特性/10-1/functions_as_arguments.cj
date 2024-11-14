/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

func add(a: Int64, b: Int64) {
    a + b
}

func sub(a: Int64, b: Int64) {
    a - b
}

// 函数printOpResult的类型为(Int64, Int64, (Int64, Int64) -> Int64) -> Unit
func printOpResult(a: Int64, b: Int64, operation: (Int64, Int64) -> Int64) {
    println(operation(a, b))
}

main() {
    printOpResult(5, 3, add)  // 输出：8
    printOpResult(5, 3, sub)  // 输出：2
}
