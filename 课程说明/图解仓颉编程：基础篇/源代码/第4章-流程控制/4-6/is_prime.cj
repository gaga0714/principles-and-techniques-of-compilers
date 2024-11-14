/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

main() {
    var n = 43  // 待判断的正整数
    var flag = true  // 标志，初始值为true

    for (i in 2..=(n / 2)) {
        if (n % i == 0) {
            flag = false
        }
    }

    if (flag) {
        println("${n}是素数")
    } else {
        println("${n}不是素数")
    }
}
