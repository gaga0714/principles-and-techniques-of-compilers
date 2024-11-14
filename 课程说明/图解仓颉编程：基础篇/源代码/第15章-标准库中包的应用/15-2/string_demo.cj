/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

from std import random.Random
from std import sort.SortExtension
from std import convert.Parsable

// 将传入的整数转换为字符串，再拆分为字符串数组，进行降序排列，返回字符串数组
func intToDescendingDigits(num: Int64) {
    let arr = num.toString().split("")
    arr.sortDescending()  // 对字符串数组降序排序
    return arr
}

// 将传入的字符串数组反转，并处理第1个字符，返回处理过的字符串数组
func reverseAndExchange(arr: Array<String>) {
    arr.reverse()  // 将字符串数组反转，使其按升序排列
    // 将第1个不为0的元素与第1个0对调，如果第1个元素不为0，不做任何操作
    if (arr[0] == "0") {
        for (i in 1..arr.size) {
            if (arr[i] != "0") {
                arr[0] = arr[i]
                arr[i] = "0"
                break
            }
        }
    }
    return arr
}

main() {
    let rnd = Random(6)
    let rndNum = rnd.nextInt64(900000000) + 100000000  // 生成一个随机的九位数
    println("原始的九位数：${rndNum}")

    var arr = intToDescendingDigits(rndNum)

    // 由9位数字组成的最大的九位数
    let max = Int64.parse(String.join(arr))
    println("最大的数：${max}")

    arr = reverseAndExchange(arr)

    // 由9位数字组成的最小的九位数
    let min = Int64.parse(String.join(arr))
    println("最小的数：${min}")
}
