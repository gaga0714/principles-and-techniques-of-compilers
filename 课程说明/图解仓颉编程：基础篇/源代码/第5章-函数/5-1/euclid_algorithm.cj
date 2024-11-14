/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

func gcd(m: Int64, n: Int64): Int64 {
    // m和n是不可变变量，因此需要重新定义2个可变变量
    var a = m
    var b = n
    var r = 0

    do {
        r = a % b
        a = b
        b = r
    } while (r != 0)
    return a
}

main() {
    println(gcd(54, 72))  // 输出：18
}
