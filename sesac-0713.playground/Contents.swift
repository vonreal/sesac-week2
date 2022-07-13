enum Gender: String {
    case man = "남성"
    case woman = "여성"
    case nothing = "아직 선택하지 않았습니다."
}

var gender: Gender = Gender.man

switch gender {
    case .man: print("남성입니다.")
    case .woman: print("여성입니다.")
    case .nothing: print("아직 선택하지 않았습니다.")
}

gender.rawValue

enum HTTPCode: Int {
    case OK = 101
    case NO_PAGE = 202
    case NOT_FOUND = 404
    case SERVER_ERRROR
    
    func showStatus() -> String {
        switch self {
        case .OK: return "정상입니다"
        case .NO_PAGE: return "페이지를 찾을 수 없음"
        case .NOT_FOUND: return "잘못된 연결"
        case .SERVER_ERRROR: return "긴급점검"
        }
    }
}

var state: HTTPCode = .SERVER_ERRROR

//switch state {
//    case .OK: print(HTTPCode.OK.rawValue)
//    case .NO_PAGE: print(HTTPCode.NO_PAGE.rawValue)
//    case .NOT_FOUND: print(HTTPCode.NOT_FOUND.rawValue)
//    case .SERVER_ERRROR: print(HTTPCode.SERVER_ERRROR.rawValue)
//}

let result = state.showStatus()
print(result)


class Monster {
    var clothes = "Orange"
    var speed = 5
    var power = 20
    var expoint = 500
    
    func attack() {
        print("공격!!!")
    }
}

var monster = Monster()
monster.clothes
monster.power
monster.attack()


class BossMonster: Monster {
    var levelLimit = 500
    
    func bossAttack() {
        print("스페셜 공격")
    }
    
    // 재정의
    override func attack() {
        super.attack()
        print("우주 스페셜 울트라 공격!")
    }
}

var finalBoss = BossMonster()
finalBoss.levelLimit
finalBoss.bossAttack()

finalBoss.attack()


var miniMonster = Monster()
var bossMonster = miniMonster

print(miniMonster.power)
bossMonster.power = 5000

print(miniMonster.power)
print(bossMonster.power)
