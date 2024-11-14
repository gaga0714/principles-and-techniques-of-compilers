/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

package e_commerce

// EBicycle类继承了Goods类
class EBicycle <: Goods & PointsCalculable {
    private var expressFee = 50  // 运费，默认为50元
    private var serviceFee = 80  // 安装服务费，默认为80元
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

    // 通过属性propServiceFee实现对serviceFee的读写
    mut prop propServiceFee: Int64 {
        get() {
            serviceFee
        }

        set(serviceFee) {
            if (serviceFee >= 0) {
                this.serviceFee = serviceFee
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
        // 应付金额加上了运费和安装服务费
        propPrice * (Float64(propDiscount) / 100.0) + Float64(expressFee + serviceFee)
    }

    func readBatteryData() {
        batteryPluggable.readData()
    }

    public func calcPoints() {
        let payAmount = calcPayAmount()

        if (payAmount <= 3000.0) {
            Int64(payAmount * 0.8)
        } else {
            Int64(payAmount * 1.2)
        }
    }
}
