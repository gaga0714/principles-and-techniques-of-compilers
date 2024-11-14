/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

package e_commerce

// WaterPump类继承了Goods类
class WaterPump <: Goods  & PointsCalculable {
    private var expressFee = 15  // 运费，默认为15元
    private var batteryPluggable: BatteryPluggable

    init(price: Float64, discount: Int64, batteryPluggable: BatteryPluggable) {
        super(price, discount)  // 通过super调用父类的构造函数对price和discount完成初始化
        this.batteryPluggable = batteryPluggable
    }

    // 通过属性propExpressFee实现对expressFee的读写
    mut prop propExpressFee: Int64 {
        get() {
            expressFee
        }

        set(expressFee) {
            if (expressFee >= 0) {
                this.expressFee = expressFee
            }
        }
    }

    mut prop propBatteryPluggable: BatteryPluggable {
        get() {
            batteryPluggable
        }

        set(batteryPluggable) {
            this.batteryPluggable = batteryPluggable
        }
    }

    // 实现了父类的抽象函数
    protected func calcPayAmount() {
        // 应付金额加上了运费
        propPrice * (Float64(propDiscount) / 100.0) + Float64(expressFee)
    }

    func readBatteryData() {
        batteryPluggable.readData()
    }

    public func calcPoints() {
        Int64(calcPayAmount() * 0.8)
    }
}
