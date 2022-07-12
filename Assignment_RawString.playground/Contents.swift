// 이스케이프 문자를 String으로 사용하고 싶다면?
// 기존의 방법 - 1) \\ 두번 사용

var exText = "hello\\n"     // "hello\n"으로 출력
var exText2 = "hello\n"     // "hello"로 출력

print(exText, exText2)

// 이스케이프 뿐만 아니라 예약어로 사용되는 ""도 표현하고 싶으면 복잡해진다.
// 그래서 나온것이 RawString!

// RawString 사용 방법
// 문자열의 '"' 앞뒤에 '#'을 붙여주면 된다!
// '#'의 갯수는 상관이 없으나 꼭 통일시켜줘야 에러가 안난다고 한다!"

print("RawString 사용 ---")

exText = #"Say hello to my wife. \n "Hello.""#
print(exText)

exText = ###"Say hello to my wife. \n "Hello.""###
print(exText)

// 그렇지만 실제로 문자열 안에 이스케이프를 사용하고 싶을때는?
// 그때는 이스케이프 뒤에 #을 붙이면 된다!

exText = #"Say hello to my wife. \#n "Hello.""#
print(exText)
