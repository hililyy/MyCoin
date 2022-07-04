# 🪙 My Coin (코인 정보 프로그램)
API적용 연습을 위한 코인 정보 프로그램 입니다.
<br></br>

# 👉🏻 적용기술
- MVVM 적용하기
- 기능들이 프로토콜에서 동작하도록 (추상화)
- API 호출하여 데이터 불러오기
- Clean Architecture를 이용해 코드 구성하기

![image](https://user-images.githubusercontent.com/76806444/177213423-09473ae2-6f5c-4b60-bae3-e1609d97af7b.png)


- Lottie 사용해보기
- ~~Collection View 사용해보기~~
<br></br>

# 👉🏻 적용사항
- 사용할 API → [https://api.coinpaprika.com/v1/coins](https://api.coinpaprika.com/v1/coins)

![image](https://user-images.githubusercontent.com/76806444/177213437-5192327a-9047-4527-8345-28ed3a2144ab.png)

이와 같은 정보를 가지고 있다.

- type이 “coin”인 데이터만 추출
- id와 type을 제외한 테이터를 표시
- rank의 순서대로 데이터 구성
- is_new, is_active를 이용해 뷰를 구성함
    - is_new 버튼 활성화 시 true인 데이터만 표시
    - is_active 버튼 활성화 시 true인 데이터만 표시
    - 만약 두 버튼 모두 활성화 시 rank번호에 따른 번호 순서로 나타냄
<br></br>

# 👉🏻 동작화면
## 1. 기본 동작
 ![앱 동작](https://user-images.githubusercontent.com/76806444/177213507-957749c4-1e13-4883-90bb-f626c4ff6c71.gif)

## 2. 신규코인 off 버튼 작동 화면
  ![tocken](https://user-images.githubusercontent.com/76806444/177213611-2e9a1a2e-2090-442c-81d7-4a422b6f2976.gif)
