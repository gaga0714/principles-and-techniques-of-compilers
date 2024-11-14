/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

func factorial(n: Int64): Int64 {
    if (n == 0) {
        return 1  // 递归出口
    } else {
        factorial(n - 1) * n  // 递归调用
    }
}

main() {
    println(factorial(3))  // 输出：6
}
