import UIKit

//1. 강의 이름, 강사 이름, 학생 수를 가지는 Struct 만들기(Lecture)
//2. 강의 Array와 강사 이름을 받아서, 해당 강사의 강의 이름을 출력하는 함수 생성
//3. 강의 3개 만들고 강사 이름으로 강의 찾기

struct lectureInfo {
    let lectureTitle: String
    let teacherName: String
    let numberOfStudent: Int
}

func printLectureInfo (lecture: lectureInfo, teacher: String) -> Void {
    if lecture.teacherName == teacher{
        print(lecture.lectureTitle)
    } else {
    
    }
}

let lecture1 = lectureInfo(lectureTitle: "Sience", teacherName: "Kim", numberOfStudent: 30)
let lecture2 = lectureInfo(lectureTitle: "Math", teacherName: "Yoon", numberOfStudent: 35)
let lecture3 = lectureInfo(lectureTitle: "Korean", teacherName: "Lee", numberOfStudent: 20)

printLectureInfo(lecture: lecture1, teacher: "Yoon")

//강의 참고 코드 struct는 위 참고

func printLectureName(name: String, lectures: [lectureInfo]){
    for lectureInfo in lectures{
        if name == lectureInfo.teacherName{
            print(lectureInfo.lectureTitle)
        }
    }
    
}

printLectureName(name: "Yoon", lectures: [lecture1, lecture2, lecture3])
