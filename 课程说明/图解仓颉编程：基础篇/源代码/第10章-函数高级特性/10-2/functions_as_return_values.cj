/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

enum Operations {
    | Add
    | Sub
}

func add(a: Int64, b: Int64) {
    a + b
}

func sub(a: Int64, b: Int64) {
    a - b
}

func getOperation(operations: Operations): (Int64, Int64) -> Int64 {
    match (operations) {
        // 将函数作为返回值
        case Add => add
        case Sub => sub
    }
}

main() {
    println(getOperation(Add)(5, 3))  // 输出：8
    println(getOperation(Sub)(5, 3))  // 输出：2
}
