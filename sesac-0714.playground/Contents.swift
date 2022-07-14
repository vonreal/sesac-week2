class Monster {
    var name = "초보몬스터"
    var level = 1
}

let easyMonster = Monster()

var hardMonster = easyMonster // class는 heap에 인스턴스를 생성하여 이를 참조하는 형식(주소를 가짐)이기 때문에, 동일한 주소를 가지게 된다.

print(easyMonster.name)
print(hardMonster.name)

hardMonster.name = "보스몬스터"

print(easyMonster.name)
print(hardMonster.name)

/*
 메모리는 코드, 데이터, 힙, 스택으로 나뉘어져있다.
 1. 코드: 실제 작성한 코드가 문자 그대로 올라가져 있는 부분.
 2. 데이터: 전역변수 등이 올라가는 부분.
 3. 힙: 클래스를 생성할때 인스턴스가 올라가는 부분.
 4. 스택: 인스턴스를 참조하는 값, 혹은 지역변수들, 함수, 그리고 구조체의 값이 올라가는 부분.
 */

// 클래스에서 타입만 명시할 경우 에러가 발생한다. 초기화를 해달라는!
// 옵셔널로 타입 명시 시 nil을 가지게 되기 때문에 나중에 초기화를 할 수 있다. (일단 에러는 뜨지 않음)

class ExClass {
    var name: String?
    // var level: Int // [에러발생]
    var level: Int?
    
    init(jack: String, jackjack: Int) {
        name = jack
        level = jackjack
    }
}

let easy = ExClass(jack: "쉬운 몬스터", jackjack: 1)
easy.name
easy.level

// 구조체는 멤버와이즈가 제공되기 때문에 init을 만들지 않아도 에러가 발생하지 않는다.

struct ExStruct {
    var name: String
    var level: Int
}
