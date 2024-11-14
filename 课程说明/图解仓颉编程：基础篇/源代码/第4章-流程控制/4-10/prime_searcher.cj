/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

main() {
    var n = 86
    var isPrime: Bool  // 标志，表示是否是素数

    while (true) {
        n++

        // 判断n是不是素数
        isPrime = true  // 每次判断前需要将isPrime置为true
        for (i in 2..=(n / 2)) {
            if (n % i == 0) {
                isPrime = false
                break  // 退出的是内层的for-in表达式
            }
        }

        // 如果找到了则输出该素数并退出while表达式
        if (isPrime) {
            println("比86大的最小素数是：${n}")
            break  // 退出的是外层的while表达式
        }
    }
}
