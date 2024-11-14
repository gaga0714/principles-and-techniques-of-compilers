/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

// 找出start..=stop之内的所有素数，并按照8个一行输出
func findPrimes(start: Int64, stop: Int64) {
    // 嵌套函数，判断n是否是一个素数
    func isPrime(n: Int64) {
        for (i in 2..=(n / 2)) {
            if (n % i == 0) {
                return false
            }
        }
        true
    }

    var counter = 0  // 计数器
    for (i in start..=stop) {
        if (isPrime(i)) {
            counter++
            print("${i}  ")
            if (counter % 8 == 0) {
                print("\n")
            }
        }
    }
}

main() {
    findPrimes(10, 99)
}
