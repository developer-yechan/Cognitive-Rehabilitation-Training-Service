# 인지 재활 훈련 서비스 리팩토링 프로젝트

## 목차
[소개](#소개)

[데이터베이스 모델링](#데이터베이스-모델링)

[주요 기능](#주요-기능)

[리팩토링 중점 사항](#리팩토링-중점-사항)

[기술 스택](#기술-스택)

## 소개


![patientGif](https://github.com/developer-yechan/Cognitive-Rehabilitation-Training-Service/assets/99064214/45352cf4-90fa-42c0-9197-6771359de456)

- 본 프로젝트는 21년 3~4월에 진행했던 CNN 문자 인식 기반 인지 재활 훈련 서비스 구현 팀 프로젝트를 
  Spring Boot 및 JPA를 활용하여 리팩토링한 개인 프로젝트입니다.  
  기존 코드는 전체 리팩토링이 완료되면 삭제할 예정입니다.
  
## 데이터베이스 모델링

### 클래스 다이어그램
![인지재활-클래스다이어그램](https://github.com/developer-yechan/Cognitive-Rehabilitation-Training-Service/assets/99064214/370fa03c-80fa-49be-834f-78b734ec222f)
### ERD
![dbdiagram](https://github.com/developer-yechan/Cognitive-Rehabilitation-Training-Service/assets/99064214/6e02ec4e-f4cd-4e4a-b6cf-ce765de70f98)


## 주요 기능

### 작업치료사
  - 환자 관리
    - 환자 CRUD 및 검색 기능
### 환자
  - 훈련 기능 
    - 문제에 대한 환자의 답을 CNN 기반 문자 인식 flask 서버로 보내면 서버는 그 답에 대한 예측 label 값 반환
    - 주어진 문제를 다 풀면 영역별 맞은 개수와 총점이 계산된 후 결과 페이지 렌더링  

### 공통기능
  -  세선 방식 로그인
     - 환자
        - 별도의 회원가입 없고 작업치료사가 환자 등록해야 이용 가능
       - 회원 고유 번호와 얼굴 인식을 통해 로그인  
     - 작업치료사
       - 회원가입 후 로그인 
  - 영역 별, 날짜 별 환자의 훈련 통계 기능
    
## 리팩토링 중점 사항

### 1. MVC패턴
   - 기존의 jsp에 산재해있던 비즈니스 로직 컨트롤러-서비스-레포지토리로 확실히 분리 

### 2. DAO로직 JPA로 구현
   - 기존의 jsp에 산재해있던 비즈니스 로직 컨트롤러-서비스-레포지토리로 확실히 분리 

### 3. 불필요한 코드와 로직 수정 및 제거


## 기술 스택
### Java, Spring, Spring Boot, JPA , H2 Database
