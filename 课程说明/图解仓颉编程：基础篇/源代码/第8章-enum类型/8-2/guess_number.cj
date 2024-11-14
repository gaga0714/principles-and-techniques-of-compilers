/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */
 
from std import console.Console
from std import convert.Parsable

func getUserInput(): ?Int64 {
    print("\n请输入一个 0 ~ 9 内的数字：")
    let optInput = Console.stdIn.readln()
    if (optInput.isNone()) {
        return None
    }

    let numStr = optInput.getOrThrow()
    let optNum = Int64.tryParse(numStr)
    if (optNum.isNone()) {
        return None
    }

    let num = optNum.getOrThrow()
    if (num >= 0 && num <= 9) {
        num
    } else {
        None
    }
}

func guessNumber(targetNum: Int64, times: Int64) {
    var counter = 0  // 计数器，表示已经猜数字的次数，最多只能猜times次
    while (counter < times) {
        let optInput = getUserInput()  // 获取用户输入，类型为?Int64
        if (optInput.isSome()) {
            let num = optInput.getOrThrow()  // 解构OptInput，存入num

            if (num == targetNum) {
                // 猜中之后输出提示信息并结束函数调用
                println("恭喜您，猜对了！")
                return
            } else if (num > targetNum) {
                println("比目标数字大！")
            } else {
                println("比目标数字小！")
            }

            counter++  // 计数器加1
        } else {
            println("无效的输入")
        }
    }
    println("\n对不起，次数已用尽，祝您下次好运！")
}

main() {
    guessNumber(6, 3)  // 目标数字为6，总共可以猜3次
}
