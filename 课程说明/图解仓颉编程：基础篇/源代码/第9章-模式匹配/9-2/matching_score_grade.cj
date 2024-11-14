/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */
 
func matchScoreGrade(score: Int64) {
    if (score >= 0 && score <= 100) {
        let grade = match (score / 10) {
            case 0 | 1 | 2 | 3 | 4 | 5 => "不及格"  // 0 ~ 59之间为不及格
            case 6 | 7 => "及格"  // 60 ~ 79之间为及格
            case 8 => "良好"  // 80 ~ 89之间为良好
            case _ => "优秀"  // 90 ~ 100之间为优秀
        }
        println("您的分数等级为：${grade}")
    } else {
        println("无效分数")  // 小于0或大于100为无效分数
    }
}

main() {
    matchScoreGrade(79)
}
