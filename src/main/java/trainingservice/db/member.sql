


insert into member(id,pass,name,age,phone,email)
values('admin','admin','관리자',25,'010-2222-5555','shin@gmail.com')

// 테이블 탐색

select * from patients;
select * from Doctor;
select * from answer;
select * from patientpoint;


drop table patients;
drop table Doctor;
drop table patientpoint;


// 환자 테이블 생성
create table patients(
 pat_id int(4) primary key auto_increment, 
 pat_name char(20) not null,
 pat_age int(4) not null,
 pat_gender int(1) not null,
 pat_phone char(40),
 pat_address char(80),
 doc_id char not null
 )
//여기까지가 환자 테이블 만들기

//최근 푼 문제  회차, 문제 번호 컬럼
alter table patients add pat_round int(4) not null;
alter table patients add pat_num int(4) not null;

delete from Doctor where doc_phone is null;

update patients 
set pat_round =1, pat_num =0
where pat_id =75;
alter table [테이블명] add [컬럼명] [타입] [옵션]; 

출처: https://mcpaint.tistory.com/194 [MC빼인트와 함께]
// 환자 테이블 수정
// 시퀀스 시작 번호 1000부터 지정
 ALTER TABLE patients AUTO_INCREMENT = 1000;
 // 외래키 삭제
 ALTER TABLE patients drop foreign key doc_fk;
 
 // 컬럼 타입 변경
 ALTER TABLE patients MODIFY doc_id char(40);
 
 
 
 // 환자테이블 테스트
 insert into patients(pat_name,pat_age,pat_gender,pat_phone,pat_address,doc_id)
values('111','2222','1',25,'010-2222-5555','s')

insert into patients(pat_name,pat_age,pat_gender,pat_phone,pat_address,doc_id)
values('222','3333','1',25,'010-2222-5555','s')

insert into patients(pat_name,pat_age,pat_gender,pat_phone,pat_address,doc_id)
values('333','4444','0',25,'010-2222-5555','s')

insert into patients(pat_name,pat_age,pat_gender,pat_phone,pat_address,doc_id)
values('moran','47','0',25,'010-2222-5555','iwf');
insert into patients(pat_name,pat_age,pat_gender,pat_phone,pat_address,doc_id)
values('kaka','66','1','010-2222-5555','광주','iwf');
insert into patients(pat_name,pat_age,pat_gender,pat_phone,pat_address,doc_id)
values('black','90','0','010-2323-9000','광주','iwf');
insert into patients(pat_name,pat_age,pat_gender,pat_phone,pat_address,doc_id)
values('bck','81','0','010-2323-8000','광주','iwf');

// 작업치료사 테이블 테스트
 insert into Doctor(doc_id,doc_name,doc_phone,doc_organization,doc_email)
values('s',"shin",'010-2222-5555','a','iwf@gmail')
 insert into Doctor(doc_id, doc_pass,doc_name,doc_phone,doc_organization,doc_email)
values('iwfff7','12345', "신호주",'010-2222-5555','aat','iwf@gmail')
 



// 작업 치료사 테이블 생성
create table Doctor(
 doc_id char(40) primary key,
 doc_pass char(40) not null,
 doc_name char(20) not null,
 doc_phone char(40),
 doc_organization char(40) not null,
 doc_email char(40)

)
select * from Doctor

// 환자 테이블의 doc_id에 외래키 추가
ALTER TABLE patients ADD CONSTRAINT doc_fk FOREIGN KEY (doc_id) REFERENCES Doctor (doc_id)
// 여기까지가 치료사 테이블 많들때 필수

// 치료사 테이블에 컬럼 추가
alter table patient add doc_pass char(40) not null; 
alter table Doctor add doc_pass char(40) not null; 
alter table Doctor add doc_pass char(40) not null; 

// 비밀번호 삽입
UPDATE Doctor SET doc_pass = '12345' WHERE doc_id = 's';

// 치료사 doc_pass 컬럼순서 이동
ALTER TABLE Doctor MODIFY doc_pass char(40) AFTER doc_id



// 환자 테이블 유니크키 삭제
alter table patients drop constraint unique key;
//환자 테이블 삭제
DROP table patients



// 정답 테이블 삭제
DROP table answer
delete from answer;
// 정답 테이블 만들기
select * from answer
create table answer(
ans_id int(8) primary key auto_increment,
ans_correct char(40) not null,
ans_num int(8) not null,
ans_round int(4) not null,
ans_content char(200) not null,
ans_image char(200) not null,
ans_sound char(200) not null,
ans_category char(50) not null,
ans_label char(8) not null
);
//여기까지가  정답 테이블 만들기

alter table answer modify ans_id char(40) not null;

//
alter table patients add pat_round int(4) not null;

// 정답 테이블에 데이터 넣기
insert into problem(id,answer, answer_label, number,round,content,image_path,sound_path,category)
values(1,'병원','6',1,1,'다음 단어와 연관이 있는 장소를 적어 주세요.','q1.png','q1.mp3','문제해결');
insert into problem(id,answer, answer_label, number,round,content,image_path,sound_path,category)
values(2,'학교','1',2,1,'다음 단어와 연관이 있는 장소를 적어 주세요.','q2.png','q2.mp3','문제해결');
insert into problem(id,answer, answer_label, number,round,content,image_path,sound_path,category)
values(3,'월','7',3,1,'다음 빈 칸에 알맞는 요일을 적어 주세요.','q3.png','q3.mp3','지남력');
insert into problem(id,answer, answer_label, number,round,content,image_path,sound_path,category)
values(4,'화','1',4,1,'다음 빈 칸에 알맞는 요일을 적어 주세요.','q4.png','q4.mp3','지남력');
insert into problem(id,answer, answer_label, number,round,content,image_path,sound_path,category)
values(5,'4','4',5,1,'다음 물음표에 들어갈 숫자를 적어 주세요.','q5.png','q5.mp3','계산력');
insert into problem(id,answer, answer_label, number,round,content,image_path,sound_path,category)
values(6,'8','2',6,1,'다음 물음표에 들어갈 숫자를 적어 주세요.','q6.png','q5.mp3','계산력');
insert into problem(id,answer, answer_label, number,round,content,image_path,sound_path,category)
values(7,'5','3',7,1,'나무 위에 사과가 몇 개인가요?','q7.png','q7.mp3','집중력');
insert into problem(id,answer, answer_label, number,round,content,image_path,sound_path,category)
values(8,'2','1',8,1,'다음 숫자중 가장 작은 숫자를 찾아 적어 주세요.','q8.png','q8.mp3','집중력');
insert into problem(id,answer, answer_label, number,round,content,image_path,sound_path,category)
values(9,'미국','0',9,1,'아시아가 아닌 나라를 찾아 적어 주세요.','q9.png','q9.mp3','기억력');
insert into problem(id,answer, answer_label, number,round,content,image_path,sound_path,category)
values(10,'독도','1',10,1,'우리나라 동쪽 끝 두개의 섬으로 이루어져 있는 이 섬의 이름은 무엇인가요?','q10.png','q10.mp3','기억력');




insert into patients(pat_name,pat_age,pat_gender,pat_phone,pat_address,doc_id)
values('moran','47','0',25,'010-2222-5555','iwf');




// 환자 점수 테이블
drop table patientpoint
create table patientpoint(
pp_id int primary key auto_increment,
pp_date date not null,
totalpoint int not null,
zinam int not null,
 giuk int not null,
gesan int not null,
zipjoon int not null,
moonje int not null,
pat_id int not null
);
// 여기까지가 환자 정수 테이블 만들기


select * from patientpoint

select * from patientpoint
order by pp_date desc;

insert into patientpoint(pp_date,totalpoint,zinam,giuk,gesan,zipjoon,moonje,pat_id)
values('2021-04-07',10, 2, 2, 2, 2, 2, 116);
insert into patientpoint(pp_date,totalpoint,zinam,giuk,gesan,zipjoon,moonje,pat_id)
values('2021-04-08',8, 2, 2, 0, 2, 2, 116);

// 환자 점수 테이블에 점수 넣기
insert into patientpoint(pp_date,pp_totalpoint,pointA,pointB,pointC,pointF,pat_id)
values(NOW(),80, 77, 66, 77, 88, 3)
insert into patientpoint(pp_date,pp_totalpoint,pointA,pointB,pointC,pointF,pat_id)
values(NOW(),65, 33, 44, 55, 60, 4)
insert into patientpoint(pp_date,pp_totalpoint,pointA,pointB,pointC,pointF,pat_id)
values(NOW(),46, 71, 55, 33, 22, 5)
insert into patientpoint(pp_date,pp_totalpoint,pointA,pointB,pointC,pointF,pat_id)
values(NOW(),46, 71, 55, 33, 22, 5)
insert into patientpoint(pp_date,pp_totalpoint,pointA,pointB,pointC,pointF,pat_id)
values('2021-03-29',90, 71, 55, 33, 22, 3)

insert into patientpoint(pp_date,pp_totalpoint,pointA,pointB,pointC,pointF,pat_id)
values('2021-03-29',90, 71, 55, 33, 22, 15)
insert into patientpoint(pp_date,pp_totalpoint,pointA,pointB,pointC,pointF,pat_id)
values(NOW(),90, 66, 100, 100, 100, 16)
insert into patientpoint(pp_date,pp_totalpoint,pointA,pointB,pointC,pointF,pat_id)
values(NOW(),100, 66, 70, 60, 50, 17)
insert into patientpoint(pp_date,pp_totalpoint,pointA,pointB,pointC,pointF,pat_id)
values(NOW(),66, 66, 100, 100, 100, 18)

DELETE from patients where pat_id='15'

ALTER TABLE patientpoint ADD CONSTRAINT pat_id_fk FOREIGN KEY (pat_id) 
REFERENCES patients(pat_id)



// 환자정보 페이지에 쓸 sql문
SELECT 
    p.*,
    (SELECT pp_date FROM patientpoint WHERE pat_id=p.pat_id ORDER BY pp_date DESC LIMIT 1) AS pp_date,
    (SELECT pp_totalpoint FROM patientpoint WHERE pat_id=p.pat_id ORDER BY pp_date DESC LIMIT 1) AS pp_totalpoint
FROM patients AS p
where doc_id='iwf'


// 환자 이름 검색할 경우
SELECT 
    p.*,
    (SELECT pp_date FROM patientpoint WHERE pat_id=p.pat_id ORDER BY pp_date DESC LIMIT 1) AS pp_date,
    (SELECT pp_totalpoint FROM patientpoint WHERE pat_id=p.pat_id ORDER BY pp_date DESC LIMIT 1) AS pp_totalpoint
FROM patients AS p
where pat_name='111'

 
	SELECT p.*,
    (SELECT pp_date FROM patientpoint WHERE pat_id=p.pat_id ORDER BY pp_date DESC LIMIT 1) AS pp_date,
    (SELECT totalpoint FROM patientpoint WHERE pat_id=p.pat_id ORDER BY pp_date DESC LIMIT 1) AS totalpoint
	FROM patients AS p
	where doc_id='iwf' AND (select doc_pass FROM Doctor where doc_pass ='12345' LIMIT 1)='12345'

	// 환자 고유번호, 이름, 성별로 검색할 경우	

SELECT p.*,
    (SELECT pp_date FROM patientpoint WHERE pat_id=p.pat_id ORDER BY pp_date DESC LIMIT 1) AS pp_date,
    (SELECT pp_totalpoint FROM patientpoint WHERE pat_id=p.pat_id ORDER BY pp_date DESC LIMIT 1) AS pp_totalpoint
	FROM patients AS p
	where pat_id=72 and pat_gender=1 and pat_name='kaka'

select * from answer

// 점수들을 오름차순으로 가져오기
select pp_date, pp_totalpoint,pointA,pointB,pointC,pointF from patientpoint
where pat_id='3'
order by pp_date DESC

select * from patientpoint
where pat_id= '90'
	order by pp_date DESC limit 0,7


select pat_name, pat_age, pat_gender from patients
	where pat_id= 75

ALTER TABLE 테이블이름

ADD [CONSTRAINT 제약조건이름]

FOREIGN KEY (필드이름)

REFERENCES 테이블이름 (필드이름)



