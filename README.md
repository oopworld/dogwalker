# 😼dogwalker 
![loginlogo](https://github.com/oopworld/dogwalker/assets/137124485/195eda45-3642-4529-91a7-3af288597046)

프로젝트 기간 : 2023.06.12 ~ 2023.08.04
인원 : 5
<br/>
<br/>

# 🧗 프로젝트 소개
- 다른 회원의 강아지를 산책시키거나 산책을 맡을 수 있습니다.<br>
- 강아지 용품,간식,사료를 구매할 수 있습니다 .<br>
- 아임포트 api 카카오페이를 통해 산책을맡기는데사용되는 포인트를 충전 가능합니다.<br>
- 관리자페이지를 통해 상품 관리 가능합니다.<br>
- 커뮤니티를 통해 소통이 가능합니다.
<br/>
<br/>

# 😼 본인이 맡은 역할 소개

로그인,회원가입,마이페이지 회원수정,강아지 등록/수정,강아지산책 신청 기능 
MemberController,ProxyController,MatchingController 일부
회원 가입시 카카오 주소api , 지오코딩 api 활용하여 회원 주소 위도 경도 값 등록
header,footer 모듈화로 분리 
<br/>
<br/>

# 🛠️ 개발환경
- Server <br>
`Tomcat 9.0`

- DB<br>
`Oracle 11g`

- BackEnd(Language & Framework & Library)
  
Language : `Java 11` `JDK 1.8.0`

Framework : `Spring 4.3.3.RELEASE`

IDE : `STS-3.9.22.RELEASE`

Build Tools : `Maven 4.0.0`

ORM : `Mybatis 3.5.3`

Library : `jackson`, `네이버지도 api`,`카카오 주소 api`,`I'MPORT api`,`지오코딩 api`
<br/>
<br/>


# 📱 ERD
![DOGWALKERDB](https://github.com/oopworld/dogwalker/assets/137124485/348045ae-6ece-4389-a7ea-005cb493cb12)
<br/>
<br/>

# 🗂 디렉토리 구조
```
📦src/main
 ┣ 📂java/com/dogwalker
 ┃ ┣ 📂config
 ┃ ┣ 📂controller
 ┃ ┣ 📂dao
 ┃ ┣ 📂domain
 ┃ ┣ 📂service
 ┃ ┗ 📂util
 ┣ 📂resources
 ┃ ┣ 📂mappers
```
<br/>
<br/>

# ⭐️ 본인이 맡은 주요 기능
### ✔️ 산책하고 싶은 강아지 선택하기
![Honeycam_2023-12-05_22-47-31](https://github.com/oopworld/dogwalker/assets/137124485/2afad03d-2074-41ac-83ba-0dc4a32666fc)


<br/>


# 🖥️ 프로젝트 설명
#### 로그인/회원가입
- 회원가입시 카카오 주소 api 통해 회원 주소 입력
- 입력한 주소를 파라미터로 지오코딩 api요청하여 위도,경도값 회원 db에 저장 
- 로그인/회원가입 유효성 검사
#### 마이페이지
- 회원 정보 수정
- 회원 강아지 등록
- 회원 강아지 정보 수정/삭제
- 내 포인트 조회(포인트로 산책 맡기기가능)
- 포인트 충전
#### 헤더
- 로그인, 마이페이지 이동
- 로그인시 로그인버튼이 로그아웃으로 변경
#### 강아지산책
- 회원가입때 등록한 주소를 바탕으로 내 주소지 주변 지도에 있는 강아지 마커 표시
- 강아지를 선택해서 산책 신청가능
- 내 강아지가 산책 신청을 받으면 수락/거절 가능
- 산책 끝난후 평가,산책 비용 포인트로 정산
#### 게시판
- 페이지 당 게시물 조회 갯수 조정 기능
- 게시물 생성, 수정, 삭제
#### 상품 구매
- 강아지 용품(사료,장난감,간식) 구매 가능
- 상품,이미지,설명,가격,갯수설정 가능
- 장바구니 기능 (장바구니 DB에 상품코드와 갯수저장)
- 주문서에서 이름,전화번호,주소 입력후 주문하면 DB 주문 테이블에 저장 
- 카카오페이로 결제 가능
<br/>

