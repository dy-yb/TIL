import UIKit

//1. 성, 이름을 받아서 fullname 출력 함수
//2. 1번에서 만든 함수의 파라미터 이름 제거 후 fullname 출력 함수
//3. 성, 이름을 받아서 fullname return 함수

// 1

func printFullName1(lastName last: String, firstName first: String){
    print("\(last) \(first)")
}

printFullName1(lastName: "윤", firstName: "다예")

// 1번 다른 방법

func anotherPrintFullName1(lastName: String, firstName: String){
    print("\(lastName) \(firstName)")
}

printFullName1(lastName: "윤", firstName: "다예")


//2
func printFullName2(_ lastName: String, _ firstName: String){
    
    print("\(lastName) \(firstName)")
}

printFullName2("윤", "쫑")

//3
func printFullName3(_ last: String, _ first:String)-> String{
    let fullName = last + " " + first
    return fullName
}

let whatIsYourName = printFullName3("Daye", "Yoon")
print(whatIsYourName)



//1. 최애 음식이름을 담는 변수 작성 (String?)
//2. 옵셔널 바인딩을 이용해 값 확인
//3. 닉네임 받아서 출력하는 함수 만들기 조건 입력 파라미터는 String?

var foodName: String? = "떡볶이"
print(foodName!)

var nickName: String?
func printNickName(_ nick: String?){
    if nick == nil{
        print("No Nickname.")
    } else {
        print(nick!)
    }
}

//다른방법 1,2

func printNickName1(nick: String?){
    if let nickName = nick {
        print(nickName)
    } else {
        print("no nickname")
    }
}


func printNickName2(name: String?){
    guard let nickName = name else {
        print("nickname needed")
        return
    }
    print(nickName)
}


printNickName("jjong")
printNickName("")


// 1. 이름, 직업, 도시에 대해 본인의 딕셔너리 생성
// 2. 도시를 부산으로 업데이트
// 3. 딕셔너리를 받아 이름과 도시 프린트하는 함수 생성

var dicMyInfo: [String:String] = ["Name":"Daye", "Occupation":"Technology Officer", "City": "Gyeonggi"]

dicMyInfo["City"]="Busan"

func printNameAndCity (dic: [String:String]){
    for (key, value) in dic{
        if key == "Occupation" {
        } else {
        print("\(key): \(value)")
    
        }
    }
}

printNameAndCity(dic: dicMyInfo)

//다른 방법

func printNameAndCity2(dic: [String:String]){
    if let name = dic["name"], let city = dic["city"]{
        print(name, city)
    } else {
        print("Couldn't find info")
    }
}


