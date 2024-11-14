/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

// 包外不可见的类型C
class C {}

// 包外不可见的顶层函数fn
func fn() {}

public func testFunc1() {
    // 在public顶层函数的函数体中，可以使用包外不可见的类型C
    let c: C = C()
}

public func testFunc2() {
    // 在public顶层函数的函数体中，可以使用包外不可见的顶层函数fn
    fn()
}
