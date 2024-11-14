/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

let START_NUM = 86

main() {
    searchPrime(START_NUM)  // 输出：比86大的最小素数为89
}

// 查找比86大的最小素数，找到之后输出该数
func searchPrime(num: Int64) {  // 形参num的作用域限于函数searchPrime的函数体
    var counter = num  // 局部变量counter的作用域自声明处开始到函数体结束处结束
    while (true) {
        counter++

        if (isPrime(counter)) {
            println("比86大的最小素数为${counter}")
            return
        }
    }
}

// 判断n是否为素数，若是则返回true，否则返回false
func isPrime(n: Int64) {  // 形参n的作用域限于函数isPrime的函数体
    if (n < 2) {
        return false
    }

    for (i in 2..=(n / 2)) {  // 循环变量i的作用域限于for-in表达式的循环体
        if (n % i == 0) {
            return false
        }
    }
    true
}
