/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

main() {
    var tup: (String, String, Int64) = ("Beijing", "China", 2022)
    println("city: ${tup[0]}\tcountry: ${tup[1]}\tyear: ${tup[2]}")

    tup = ("Beijing", "China", 2008)  // 对tup重新赋值
    println("city: ${tup[0]}\tcountry: ${tup[1]}\tyear: ${tup[2]}")
}
