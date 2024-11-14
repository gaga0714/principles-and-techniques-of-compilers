/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

// 表示布尔值的包装器
struct BoolWrapper {
    private let value: Bool

    init(value: Bool) {
        this.value = value
    }

    prop propValue: Bool {
        get() {
            value
        }
    }

    // 对操作符“!”进行重载
    operator func !(): BoolWrapper {
        BoolWrapper(!value)
    }
}

main() {
    let wrapper1 = BoolWrapper(true)
    let wrapper2 = !wrapper1
    println("wrapper1:\n\tvalue: ${wrapper1.propValue}")
    println("wrapper2:\n\tvalue: ${wrapper2.propValue}")
}
