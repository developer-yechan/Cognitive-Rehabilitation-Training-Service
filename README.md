# 인지 재활 훈련 서비스 리팩토링 프로젝트

## 목차
[소개](#소개)

[데이터베이스 모델링](#데이터베이스-모델링)

[주요 기능](#주요-기능)

[리팩토링 중점 사항](#리팩토링-중점-사항)

[기술 스택](#기술-스택)

[회고](#회고)

## 소개

  <div align="center">
  <img src="./src/main/webapp/resources/images/patientGif.gif" width="90%">
  </div>

- 본 프로젝트는 21년 3~4월에 진행했던 CNN 문자 인식 기반 인지 재활 훈련 서비스 구현 팀 프로젝트를 
  Spring Boot 및 JPA를 활용하여 리팩토링한 개인 프로젝트입니다.

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
   - 기존에 controller-dao-jsp 구조로 구현되어 있는 비즈니스 로직을 controller-service-repository로 구조로 구현하여 jsp에 있던 비즈니스 로직 제거

### 2. 기존에 MyBatis로 구현된 DB 접근 로직을 JPA로 전환
   - 개발 생산성 및 유지보수성 증대   

### 3. 기존 로직 개선 및 불필요한 코드제거 
   - 고유번호, 이름, 성별을 모두 입력해야 환자를 검색할 수 있는 로직을 QueryDSL을 활용하여 1~2개만 입력해도 검색할 수 있도록 개선
   - 작업치료사 회원가입 및 로그인, 환자 등록 수정 시 검증 로직 적용
   - 2개로 나눠져있던 작업치료사 메인페이지 렌더링 컨트롤러(로그인 / 환자 등록,수정)를 하나로 합쳐 불필요한 코드를 제거

## 기술 스택
### Java, Spring, Spring Boot, JPA, MySQL

## 회고
https://bit.ly/3N05V6S
