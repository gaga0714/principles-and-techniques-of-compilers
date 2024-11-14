/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

main() {
    var a = 20
    var b = 10
    var temp: Int64  // 定义临时变量，需要与a和b的类型一致
    println("交换前：a = ${a}  b = ${b}")

    // 实现交换
    temp = a
    a = b
    b = temp
    println("交换后：a = ${a}  b = ${b}")
}
