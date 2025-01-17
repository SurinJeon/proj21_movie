-- 영화예매웹 DROP
DROP SCHEMA IF EXISTS proj21_movie;

-- 회원
DROP TABLE IF EXISTS proj21_movie.member RESTRICT;

-- 비회원
DROP TABLE IF EXISTS proj21_movie.no_member RESTRICT;

-- 관리자
DROP TABLE IF EXISTS proj21_movie.admin RESTRICT;

-- 영화
DROP TABLE IF EXISTS proj21_movie.movie RESTRICT;

-- 영화사진
DROP TABLE IF EXISTS proj21_movie.movie_pic RESTRICT;

-- 한줄평
DROP TABLE IF EXISTS proj21_movie.comment RESTRICT;

-- 극장
DROP TABLE IF EXISTS proj21_movie.theater RESTRICT;

-- 상영관
DROP TABLE IF EXISTS proj21_movie.cinema RESTRICT;

-- 상영정보
DROP TABLE IF EXISTS proj21_movie.showinfo RESTRICT;

-- 극장상영관정보
DROP TABLE IF EXISTS proj21_movie.theater_cinema RESTRICT;

-- 예매
DROP TABLE IF EXISTS proj21_movie.reservation RESTRICT;

-- 문의
DROP TABLE IF EXISTS proj21_movie.inquiry RESTRICT;

-- 쿠폰
DROP TABLE IF EXISTS proj21_movie.coupon RESTRICT;

-- 회원보유쿠폰
DROP TABLE IF EXISTS proj21_movie.member_coupon RESTRICT;

-- 이벤트
DROP TABLE IF EXISTS proj21_movie.event RESTRICT;

-- 공지
DROP TABLE IF EXISTS proj21_movie.notice RESTRICT;

-- 좌석
DROP TABLE IF EXISTS proj21_movie.seat RESTRICT;

-- 영화예매웹
CREATE SCHEMA proj21_movie;

-- 회원
CREATE TABLE proj21_movie.member (
	mem_no        INT          NOT NULL COMMENT '회원번호', -- 회원번호
	mem_email     VARCHAR(100) NOT NULL COMMENT '회원이메일', -- 회원이메일
	mem_passwd    CHAR(41)     NOT NULL COMMENT '비밀번호', -- 비밀번호
	mem_birthdate DATE         NOT NULL COMMENT '생년월일', -- 생년월일
	mem_name      VARCHAR(100) NOT NULL COMMENT '이름', -- 이름
	mem_phone     VARCHAR(13)  NOT NULL COMMENT '연락처', -- 연락처
	mem_point     INT          NULL     COMMENT '포인트', -- 포인트
	mem_grade     VARCHAR(10)  NULL     COMMENT '회원등급' -- 회원등급
)
COMMENT '회원';

-- 회원
ALTER TABLE proj21_movie.member
	ADD CONSTRAINT PK_member -- 회원 기본키
		PRIMARY KEY (
			mem_no -- 회원번호
		);

ALTER TABLE proj21_movie.member
	MODIFY COLUMN mem_no INT NOT NULL AUTO_INCREMENT COMMENT '회원번호';

-- 비회원
CREATE TABLE proj21_movie.no_member (
	nom_no        INT         NOT NULL COMMENT '비회원번호', -- 비회원번호
	nom_phone     VARCHAR(13) NOT NULL COMMENT '연락처', -- 연락처
	nom_passwd    CHAR(41)    NOT NULL COMMENT '비밀번호', -- 비밀번호
	nom_name      VARCHAR(10) NOT NULL COMMENT '이름', -- 이름
	nom_birthdate DATE        NOT NULL COMMENT '생년월일' -- 생년월일
)
COMMENT '비회원';

-- 비회원
ALTER TABLE proj21_movie.no_member
	ADD CONSTRAINT PK_no_member -- 비회원 기본키
		PRIMARY KEY (
			nom_no -- 비회원번호
		);

ALTER TABLE proj21_movie.no_member
	MODIFY COLUMN nom_no INT NOT NULL AUTO_INCREMENT COMMENT '비회원번호';

-- 관리자
CREATE TABLE proj21_movie.admin (
	adm_no     INT          NOT NULL COMMENT '관리자번호', -- 관리자번호
	adm_id     VARCHAR(100) NOT NULL COMMENT '아이디', -- 아이디
	adm_passwd CHAR(41)     NOT NULL COMMENT '비번' -- 비번
)
COMMENT '관리자';

-- 관리자
ALTER TABLE proj21_movie.admin
	ADD CONSTRAINT PK_admin -- 관리자 기본키
		PRIMARY KEY (
			adm_no -- 관리자번호
		);

ALTER TABLE proj21_movie.admin
	MODIFY COLUMN adm_no INT NOT NULL AUTO_INCREMENT COMMENT '관리자번호';

-- 영화
CREATE TABLE proj21_movie.movie (
	mov_no       INT           NOT NULL COMMENT '영화번호', -- 영화번호
	mov_title    VARCHAR(100)  NOT NULL COMMENT '제목', -- 제목
	mov_grade    INT(2)        NOT NULL COMMENT '심의등급', -- 심의등급
	mov_genre    VARCHAR(50)   NOT NULL COMMENT '장르', -- 장르
	mov_runtime  INT           NOT NULL COMMENT '런타임', -- 런타임
	mov_director VARCHAR(50)   NOT NULL COMMENT '감독', -- 감독
	mov_actor    VARCHAR(100)  NOT NULL COMMENT '출연진', -- 출연진
	mov_detail   VARCHAR(1000) NOT NULL COMMENT '주요정보', -- 주요정보
	mov_teaser   VARCHAR(1000) NULL     COMMENT '예고편URL', -- 예고편URL
	mov_opendate DATE          NULL     COMMENT '개봉일', -- 개봉일
	mov_enddate  DATE          NULL     COMMENT '종료일', -- 종료일
	mov_avgstar  DOUBLE        NULL     COMMENT '평균 별점', -- 평균 별점
	mov_poster   BLOB          NULL     COMMENT '포스터' -- 포스터
)
COMMENT '영화';

-- 영화
ALTER TABLE proj21_movie.movie
	ADD CONSTRAINT PK_movie -- 영화 기본키
		PRIMARY KEY (
			mov_no -- 영화번호
		);

ALTER TABLE proj21_movie.movie
	MODIFY COLUMN mov_no INT NOT NULL AUTO_INCREMENT COMMENT '영화번호';

-- 영화사진
CREATE TABLE proj21_movie.movie_pic (
	mp_no  INT  NOT NULL COMMENT '번호', -- 번호
	mov_no INT  NOT NULL COMMENT '영화번호', -- 영화번호
	mp_pic BLOB NOT NULL COMMENT '사진' -- 사진
)
COMMENT '영화사진';

-- 영화사진
ALTER TABLE proj21_movie.movie_pic
	ADD CONSTRAINT PK_movie_pic -- 영화사진 기본키
		PRIMARY KEY (
			mp_no -- 번호
		);

ALTER TABLE proj21_movie.movie_pic
	MODIFY COLUMN mp_no INT NOT NULL AUTO_INCREMENT COMMENT '번호';

-- 한줄평
CREATE TABLE proj21_movie.comment (
	mov_no      INT          NOT NULL COMMENT '영화번호', -- 영화번호
	com_user    VARCHAR(50)  NOT NULL COMMENT '작성자', -- 작성자
	com_content VARCHAR(500) NOT NULL COMMENT '내용', -- 내용
	com_star    TINYINT      NOT NULL COMMENT '별점', -- 별점
	com_date    DATETIME     NOT NULL COMMENT '작성일' -- 작성일
)
COMMENT '한줄평';

-- 한줄평
ALTER TABLE proj21_movie.comment
	ADD CONSTRAINT PK_comment -- 한줄평 기본키
		PRIMARY KEY (
			mov_no -- 영화번호
		);

ALTER TABLE proj21_movie.comment
	MODIFY COLUMN mov_no INT NOT NULL AUTO_INCREMENT COMMENT '영화번호';

-- 극장
CREATE TABLE proj21_movie.theater (
	tht_no      INT           NOT NULL COMMENT '극장번호', -- 극장번호
	tht_name    VARCHAR(50)   NOT NULL COMMENT '극장명', -- 극장명
	tht_address VARCHAR(100)  NOT NULL COMMENT '주소', -- 주소
	tht_lat     DOUBLE        NOT NULL COMMENT '위도', -- 위도
	tht_long    DOUBLE        NOT NULL COMMENT '경도', -- 경도
	tht_subs    VARCHAR(100)  NULL     COMMENT '부대시설', -- 부대시설
	tht_detail  VARCHAR(1000) NULL     COMMENT '극장설명' -- 극장설명
)
COMMENT '극장';

-- 극장
ALTER TABLE proj21_movie.theater
	ADD CONSTRAINT PK_theater -- 극장 기본키
		PRIMARY KEY (
			tht_no -- 극장번호
		);

ALTER TABLE proj21_movie.theater
	MODIFY COLUMN tht_no INT NOT NULL AUTO_INCREMENT COMMENT '극장번호';

-- 상영관
CREATE TABLE proj21_movie.cinema (
	cin_no         INT         NOT NULL COMMENT '상영관번호', -- 상영관번호
	cin_row        INT         NOT NULL COMMENT '행', -- 행
	cin_col        INT         NOT NULL COMMENT '열', -- 열
	cin_seat       INT         NOT NULL COMMENT '좌석수', -- 좌석수
	cin_type       VARCHAR(10) NOT NULL COMMENT '상영관타입', -- 상영관타입
	cin_adultprice INT         NULL     COMMENT '어른요금', -- 어른요금
	cin_teenprice  INT         NULL     COMMENT '청소년요금', -- 청소년요금
	cin_prefprice  INT         NULL     COMMENT '우대요금' -- 우대요금
)
COMMENT '상영관';

-- 상영관
ALTER TABLE proj21_movie.cinema
	ADD CONSTRAINT PK_cinema -- 상영관 기본키
		PRIMARY KEY (
			cin_no -- 상영관번호
		);

ALTER TABLE proj21_movie.cinema
	MODIFY COLUMN cin_no INT NOT NULL AUTO_INCREMENT COMMENT '상영관번호';

-- 상영정보
CREATE TABLE proj21_movie.showinfo (
	shw_no        INT  NOT NULL COMMENT '상영정보번호', -- 상영정보번호
	tht_no        INT  NOT NULL COMMENT '극장번호', -- 극장번호
	cin_no        INT  NOT NULL COMMENT '상영관번호', -- 상영관번호
	mov_no        INT  NOT NULL COMMENT '영화번호', -- 영화번호
	shw_date      DATE NOT NULL COMMENT '상영일', -- 상영일
	shw_starttime TIME NOT NULL COMMENT '시작시간', -- 시작시간
	shw_endtime   TIME NOT NULL COMMENT '종료시간' -- 종료시간
)
COMMENT '상영정보';

-- 상영정보
ALTER TABLE proj21_movie.showinfo
	ADD CONSTRAINT PK_showinfo -- 상영정보 기본키
		PRIMARY KEY (
			shw_no -- 상영정보번호
		);

ALTER TABLE proj21_movie.showinfo
	MODIFY COLUMN shw_no INT NOT NULL AUTO_INCREMENT COMMENT '상영정보번호';

-- 극장상영관정보
CREATE TABLE proj21_movie.theater_cinema (
	tht_no INT NOT NULL COMMENT '극장번호', -- 극장번호
	cin_no INT NOT NULL COMMENT '상영관번호' -- 상영관번호
)
COMMENT '극장상영관정보';

-- 극장상영관정보
ALTER TABLE proj21_movie.theater_cinema
	ADD CONSTRAINT PK_theater_cinema -- 극장상영관정보 기본키
		PRIMARY KEY (
			tht_no, -- 극장번호
			cin_no  -- 상영관번호
		);

-- 예매
CREATE TABLE proj21_movie.reservation (
	res_no       INT      NOT NULL COMMENT '예매번호', -- 예매번호
	shw_no       INT      NOT NULL COMMENT '상영정보번호', -- 상영정보번호
	mem_no       INT      NULL     COMMENT '회원번호', -- 회원번호
	nom_no       INT      NULL     COMMENT '비회원번호', -- 비회원번호
	res_price    INT      NOT NULL COMMENT '결제금액', -- 결제금액
	res_usepoint INT      NULL     COMMENT '사용포인트', -- 사용포인트
	res_date     DATETIME NOT NULL COMMENT '예매일', -- 예매일
	res_adult    INT      NULL     COMMENT '인원(어른)', -- 인원(어른)
	res_teen     INT      NULL     COMMENT '인원(청소년)', -- 인원(청소년)
	res_pref     INT      NULL     COMMENT '인원(우대)' -- 인원(우대)
)
COMMENT '예매';

-- 예매
ALTER TABLE proj21_movie.reservation
	ADD CONSTRAINT PK_reservation -- 예매 기본키
		PRIMARY KEY (
			res_no -- 예매번호
		);

ALTER TABLE proj21_movie.reservation
	MODIFY COLUMN res_no INT NOT NULL AUTO_INCREMENT COMMENT '예매번호';

-- 문의
CREATE TABLE proj21_movie.inquiry (
	inq_no      INT           NOT NULL COMMENT '문의번호', -- 문의번호
	inq_title   VARCHAR(100)  NOT NULL COMMENT '문의제목', -- 문의제목
	inq_user    VARCHAR(50)   NOT NULL COMMENT '작성자', -- 작성자
	inq_detail  VARCHAR(1000) NOT NULL COMMENT '문의내용', -- 문의내용
	inq_date    DATETIME      NOT NULL COMMENT '문의일', -- 문의일
	inq_file    BLOB          NULL     COMMENT '첨부파일', -- 첨부파일
	inq_answer  VARCHAR(1000) NULL     COMMENT '답변내용', -- 답변내용
	inq_ansdate DATETIME      NULL     COMMENT '답변일', -- 답변일
	inq_status  TINYINT       NULL     COMMENT '답변상태' -- 답변상태
)
COMMENT '문의';

-- 문의
ALTER TABLE proj21_movie.inquiry
	ADD CONSTRAINT PK_inquiry -- 문의 기본키
		PRIMARY KEY (
			inq_no -- 문의번호
		);

ALTER TABLE proj21_movie.inquiry
	MODIFY COLUMN inq_no INT NOT NULL AUTO_INCREMENT COMMENT '문의번호';

-- 쿠폰
CREATE TABLE proj21_movie.coupon (
	cou_no     INT           NOT NULL COMMENT '쿠폰번호', -- 쿠폰번호
	cou_name   VARCHAR(100)  NOT NULL COMMENT '쿠폰이름', -- 쿠폰이름
	cou_detail VARCHAR(1000) NOT NULL COMMENT '쿠폰내용', -- 쿠폰내용
	cou_dc     DOUBLE        NOT NULL COMMENT '할인율', -- 할인율
	cou_expire INT           NOT NULL COMMENT '유효기간' -- 유효기간
)
COMMENT '쿠폰';

-- 쿠폰
ALTER TABLE proj21_movie.coupon
	ADD CONSTRAINT PK_coupon -- 쿠폰 기본키
		PRIMARY KEY (
			cou_no -- 쿠폰번호
		);

ALTER TABLE proj21_movie.coupon
	MODIFY COLUMN cou_no INT NOT NULL AUTO_INCREMENT COMMENT '쿠폰번호';

-- 회원보유쿠폰
CREATE TABLE proj21_movie.member_coupon (
	mc_no      INT      NOT NULL COMMENT '번호', -- 번호
	mem_no     INT      NOT NULL COMMENT '회원번호', -- 회원번호
	cou_no     INT      NOT NULL COMMENT '쿠폰번호', -- 쿠폰번호
	mc_getdate DATETIME NOT NULL COMMENT '쿠폰획득일', -- 쿠폰획득일
	mc_expdate DATETIME NOT NULL COMMENT '쿠폰만료일' -- 쿠폰만료일
)
COMMENT '회원보유쿠폰';

-- 회원보유쿠폰
ALTER TABLE proj21_movie.member_coupon
	ADD CONSTRAINT PK_member_coupon -- 회원보유쿠폰 기본키
		PRIMARY KEY (
			mc_no -- 번호
		);

ALTER TABLE proj21_movie.member_coupon
	MODIFY COLUMN mc_no INT NOT NULL AUTO_INCREMENT COMMENT '번호';

-- 이벤트
CREATE TABLE proj21_movie.event (
	ev_no        INT           NOT NULL COMMENT '이벤트번호', -- 이벤트번호
	ev_passwd    CHAR(41)      NOT NULL COMMENT '비밀번호', -- 비밀번호
	ev_title     VARCHAR(100)  NOT NULL COMMENT '이벤트제목', -- 이벤트제목
	ev_detail    VARCHAR(1000) NOT NULL COMMENT '이벤트내용', -- 이벤트내용
	ev_startdate DATE          NULL     COMMENT '시작일', -- 시작일
	ev_enddate   DATE          NULL     COMMENT '종료일', -- 종료일
	ev_date      DATETIME      NOT NULL COMMENT '등록일', -- 등록일
	ev_file      BLOB          NULL     COMMENT '파일' -- 파일
)
COMMENT '이벤트';

-- 이벤트
ALTER TABLE proj21_movie.event
	ADD CONSTRAINT PK_event -- 이벤트 기본키
		PRIMARY KEY (
			ev_no -- 이벤트번호
		);

ALTER TABLE proj21_movie.event
	MODIFY COLUMN ev_no INT NOT NULL AUTO_INCREMENT COMMENT '이벤트번호';

-- 공지
CREATE TABLE proj21_movie.notice (
	not_no     INT           NOT NULL COMMENT '공지번호', -- 공지번호
	not_passwd CHAR(41)      NOT NULL COMMENT '비밀번호', -- 비밀번호
	not_title  VARCHAR(100)  NOT NULL COMMENT '공지제목', -- 공지제목
	not_detail VARCHAR(1000) NOT NULL COMMENT '공지내용', -- 공지내용
	not_date   DATETIME      NOT NULL COMMENT '등록일', -- 등록일
	not_file   BLOB          NULL     COMMENT '파일' -- 파일
)
COMMENT '공지';

-- 공지
ALTER TABLE proj21_movie.notice
	ADD CONSTRAINT PK_notice -- 공지 기본키
		PRIMARY KEY (
			not_no -- 공지번호
		);

ALTER TABLE proj21_movie.notice
	MODIFY COLUMN not_no INT NOT NULL AUTO_INCREMENT COMMENT '공지번호';

-- 좌석
CREATE TABLE proj21_movie.seat (
	seat_no    INT NOT NULL COMMENT '좌석예약번호', -- 좌석예약번호
	res_no     INT NOT NULL COMMENT '예매번호', -- 예매번호
	shw_no     INT NOT NULL COMMENT '상영정보번호', -- 상영정보번호
	seat_rowno INT NOT NULL COMMENT '행번호', -- 행번호
	seat_colno INT NOT NULL COMMENT '열번호' -- 열번호
)
COMMENT '좌석';

-- 좌석
ALTER TABLE proj21_movie.seat
	ADD CONSTRAINT PK_seat -- 좌석 기본키
		PRIMARY KEY (
			seat_no, -- 좌석예약번호
			res_no   -- 예매번호
		);

ALTER TABLE proj21_movie.seat
	MODIFY COLUMN seat_no INT NOT NULL AUTO_INCREMENT COMMENT '좌석예약번호';

-- 영화사진
ALTER TABLE proj21_movie.movie_pic
	ADD CONSTRAINT FK_movie_TO_movie_pic -- 영화 -> 영화사진
		FOREIGN KEY (
			mov_no -- 영화번호
		)
		REFERENCES proj21_movie.movie ( -- 영화
			mov_no -- 영화번호
		)
		ON DELETE CASCADE;

-- 한줄평
ALTER TABLE proj21_movie.comment
	ADD CONSTRAINT FK_movie_TO_comment -- 영화 -> 한줄평
		FOREIGN KEY (
			mov_no -- 영화번호
		)
		REFERENCES proj21_movie.movie ( -- 영화
			mov_no -- 영화번호
		)
		ON DELETE CASCADE;

-- 상영정보
ALTER TABLE proj21_movie.showinfo
	ADD CONSTRAINT FK_movie_TO_showinfo -- 영화 -> 상영정보
		FOREIGN KEY (
			mov_no -- 영화번호
		)
		REFERENCES proj21_movie.movie ( -- 영화
			mov_no -- 영화번호
		);

-- 상영정보
ALTER TABLE proj21_movie.showinfo
	ADD CONSTRAINT FK_theater_cinema_TO_showinfo -- 극장상영관정보 -> 상영정보
		FOREIGN KEY (
			tht_no, -- 극장번호
			cin_no  -- 상영관번호
		)
		REFERENCES proj21_movie.theater_cinema ( -- 극장상영관정보
			tht_no, -- 극장번호
			cin_no  -- 상영관번호
		);

-- 극장상영관정보
ALTER TABLE proj21_movie.theater_cinema
	ADD CONSTRAINT FK_cinema_TO_theater_cinema -- 상영관 -> 극장상영관정보
		FOREIGN KEY (
			cin_no -- 상영관번호
		)
		REFERENCES proj21_movie.cinema ( -- 상영관
			cin_no -- 상영관번호
		);

-- 극장상영관정보
ALTER TABLE proj21_movie.theater_cinema
	ADD CONSTRAINT FK_theater_TO_theater_cinema -- 극장 -> 극장상영관정보
		FOREIGN KEY (
			tht_no -- 극장번호
		)
		REFERENCES proj21_movie.theater ( -- 극장
			tht_no -- 극장번호
		);

-- 예매
ALTER TABLE proj21_movie.reservation
	ADD CONSTRAINT FK_showinfo_TO_reservation -- 상영정보 -> 예매
		FOREIGN KEY (
			shw_no -- 상영정보번호
		)
		REFERENCES proj21_movie.showinfo ( -- 상영정보
			shw_no -- 상영정보번호
		);

-- 예매
ALTER TABLE proj21_movie.reservation
	ADD CONSTRAINT FK_member_TO_reservation -- 회원 -> 예매
		FOREIGN KEY (
			mem_no -- 회원번호
		)
		REFERENCES proj21_movie.member ( -- 회원
			mem_no -- 회원번호
		);

-- 예매
ALTER TABLE proj21_movie.reservation
	ADD CONSTRAINT FK_no_member_TO_reservation -- 비회원 -> 예매
		FOREIGN KEY (
			nom_no -- 비회원번호
		)
		REFERENCES proj21_movie.no_member ( -- 비회원
			nom_no -- 비회원번호
		);

-- 회원보유쿠폰
ALTER TABLE proj21_movie.member_coupon
	ADD CONSTRAINT FK_member_TO_member_coupon -- 회원 -> 회원보유쿠폰
		FOREIGN KEY (
			mem_no -- 회원번호
		)
		REFERENCES proj21_movie.member ( -- 회원
			mem_no -- 회원번호
		)
		ON DELETE CASCADE;

-- 회원보유쿠폰
ALTER TABLE proj21_movie.member_coupon
	ADD CONSTRAINT FK_coupon_TO_member_coupon -- 쿠폰 -> 회원보유쿠폰
		FOREIGN KEY (
			cou_no -- 쿠폰번호
		)
		REFERENCES proj21_movie.coupon ( -- 쿠폰
			cou_no -- 쿠폰번호
		);

-- 좌석
ALTER TABLE proj21_movie.seat
	ADD CONSTRAINT FK_showinfo_TO_seat -- 상영정보 -> 좌석
		FOREIGN KEY (
			shw_no -- 상영정보번호
		)
		REFERENCES proj21_movie.showinfo ( -- 상영정보
			shw_no -- 상영정보번호
		);

-- 좌석
ALTER TABLE proj21_movie.seat
	ADD CONSTRAINT FK_reservation_TO_seat -- 예매 -> 좌석
		FOREIGN KEY (
			res_no -- 예매번호
		)
		REFERENCES proj21_movie.reservation ( -- 예매
			res_no -- 예매번호
		);