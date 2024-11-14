/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

// 包外不可见的类型C
class C {}

// 包外不可见的顶层函数
func fn1(c: C) {}
func fn2() {}

// 在public顶层变量的初始化表达式中可以使用包外不可见的类型C
public let v1 = fn1(C())

// 在public顶层变量的初始化表达式中可以使用包外不可见的顶层函数fn2
public let v2 = fn2
