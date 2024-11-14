/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

func fibonacci(n: Int64): Int64 {
    if (n == 1 || n == 2) {
        return 1  // 递归出口
    } else {
        fibonacci(n - 1) + fibonacci(n - 2)  // 递归调用
    }
}

main() {
    println("斐波那契数列的前5项")
    for (i in 1..=5) {
        println("第${i}项：${fibonacci(i)}")
    }
}
