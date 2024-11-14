/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

// 欧几里得算法求最大公约数
func gcd(m: Int64, n: Int64): Int64 {
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
    var result = gcd(54, 72)  // 第1次调用
    println("54和72的最大公约数为：${result}")
    result = gcd(68, 164)  // 第2次调用
    println("68和164的最大公约数为：${result}")
}
