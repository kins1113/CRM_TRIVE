-- 회원
CREATE TABLE userinfo (
		no number PRIMARY KEY NOT NULL,     --번호
		name VARCHAR(20) NOT NULL,          --이름
		tel VARCHAR(15) NOT NULL,           --전화번호
		birthday VARCHAR(15) NOT NULL,      --생일
		gender number NULL,                 --성별
		zipcode VARCHAR(15) NOT NULL,       --우편번호  
		address VARCHAR(100) NOT NULL,      --주소
		addressdt VARCHAR(100) NULL,        --상세주소
		memo CLOB NULL,                     --메모
		attentioncar VARCHAR(100) NULL,     --관심차종
		option1 VARCHAR(100) NULL,          --옵션1
		option2 VARCHAR(100) NULL,          --옵션2
		option3 VARCHAR(100) NULL,          --옵션3
		option4 VARCHAR(100) NULL,          --옵션4
		option5 VARCHAR(100) NULL           --옵션5
);

-- 자동차
--drop table carinfo CASCADE CONSTRAINTS;
CREATE TABLE carinfo (
		no number PRIMARY KEY NOT NULL, --번호
		name VARCHAR(100) NULL,         --이름
		maker VARCHAR(50) NULL,         --제조사
		model VARCHAR(100) NULL,        --모델명
		generation VARCHAR(30) NULL,    --세대
		carnumber VARCHAR(20) NULL,     --자동차번호
		price VARCHAR(30) NULL,              --가격
		regdate VARCHAR(30) NULL,       --등록일
		showck VARCHAR(30) NULL,             --전시여부
		photofd VARCHAR(30) NULL,       --사진폴더
		fueltype VARCHAR(30) NULL,           --연료
		displacement VARCHAR(30) NULL,  --배기량
		getck VARCHAR(30) NULL,             --보유여부
		option1 VARCHAR(100) NULL,          --옵션1
		option2 VARCHAR(100) NULL,          --옵션2
		option3 VARCHAR(100) NULL,          --옵션3
		option4 VARCHAR(100) NULL,          --옵션4
		option5 VARCHAR(100) NULL           --옵션5
);

-- 면허증
CREATE TABLE driverlicense (
		no number PRIMARY KEY NOT NULL,         --번호
		kind VARCHAR(10) NOT NULL,              --종류
		code VARCHAR(15) NOT NULL,              --오른쪽 중간에있는 코드
		issuedate VARCHAR(20) NOT NULL,         --발급날짜
		expirateiondate VARCHAR(30) NOT NULL,   --유효기간
		userno number NOT NULL,                 --유저 번호
		CONSTRAINT FK_userinfo_TO_driverlicense FOREIGN KEY(userno) REFERENCES userinfo(no)
);

-- 직원
CREATE TABLE employ (
		no number PRIMARY KEY NOT NULL,         --번호
		id VARCHAR(20) NOT NULL,                --아이디
		password VARCHAR(30) NOT NULL,          --비밀번호
		name VARCHAR(20) NOT NULL,              --이름
		abiliryno number NOT NULL,              --권한번호
		CONSTRAINT FK_ability_TO_employ FOREIGN KEY(abiliryno) REFERENCES ability(no)
);

-- 구독
CREATE TABLE subscribe (
		no number PRIMARY KEY NOT NULL,     --번호
		startdate VARCHAR(20) NOT NULL,     --시작날짜
		month number NOT NULL,              --계약 개월수
		userno number NOT NULL,             --유저 번호
		carno number NOT NULL,              --자동차 번호
		CONSTRAINT FK_carinfo_TO_subscribe FOREIGN KEY(carno) REFERENCES carinfo(no)
);

-- 상담
CREATE TABLE cunsulting (
		no number PRIMARY KEY NOT NULL,     --번호
		title VARCHAR(100) NULL,            --제목
		contents CLOB NULL,                 --내용
		userno number NULL,                 --유저 번호
		emplno number NULL,                 --직원 번호
		CONSTRAINT FK_userinfo_TO_cunsulting FOREIGN KEY(userno) REFERENCES userinfo(no),
		CONSTRAINT FK_employ_TO_cunsulting FOREIGN KEY(emplno) REFERENCES employ(no)
);

-- 견적
CREATE TABLE estimate (
		no number PRIMARY KEY NOT NULL, --번호
		maker VARCHAR(50) NULL,         --제조사
		model VARCHAR(100) NULL,        --모델명
		generation VARCHAR(30) NULL,    --세대
		pricemin number NULL,           --최소 구독료
		pricemex number NULL,           --최대 구독료
		color VARCHAR(15) NULL,         --색상
		other CLOB NULL,                --기타 요구사항
		endck number NULL,              --완료 여부
		coment VARCHAR(500) NULL,       --완료 메모
		userno number NULL,             --유저 번호
		emplno number NULL,             --직원 번호
		CONSTRAINT FK_userinfo_TO_estimate FOREIGN KEY(userno) REFERENCES userinfo(no),
		CONSTRAINT FK_employ_TO_estimate FOREIGN KEY(emplno) REFERENCES employ(no)
);

-- 옵션이름
drop table optioninfo CASCADE CONSTRAINTS;
CREATE TABLE optioninfo (
        no number primary key, -- 번호
		userop1 VARCHAR(50) NULL,   --유저 옵션1
		userop2 VARCHAR(50) NULL,   --유저 옵션1
		userop3 VARCHAR(50) NULL,   --유저 옵션1
		userop4 VARCHAR(50) NULL,   --유저 옵션1
		userop5 VARCHAR(50) NULL,   --유저 옵션1
		carop1 VARCHAR(20) NULL,    --자동차 옵션1
		carop2 VARCHAR(20) NULL,    --자동차 옵션1
		carop3 VARCHAR(20) NULL,    --자동차 옵션1
		carop4 VARCHAR(20) NULL,    --자동차 옵션1
		carop5 VARCHAR(20) NULL    --자동차 옵션1
);


-- 개시판
CREATE TABLE board (
		no number PRIMARY KEY NOT NULL,     --번호
		name VARCHAR(100) NOT NULL,         --이름
		info VARCHAR(200) NULL,             --정보
		regno number NOT NULL,              --최초 생성자
		regdate VARCHAR(20) NULL,           --최초 생성일
		editno number NULL,                 --최종 수정자
		editdate VARCHAR(20) NULL,          --최종 수정일
		useck number NULL,                  --사용 여부
		comentck number NULL,               --댓글 사용 여부
		uploadck number NULL,               --파일 업로드 사용 여부
		kategorieno number NULL,            --카테고리 번호
		CONSTRAINT FK_kategorie_TO_board FOREIGN KEY(kategorieno) REFERENCES kategorie(no),
		CONSTRAINT FK_employ_TO_board FOREIGN KEY(regno) REFERENCES employ(no),
		CONSTRAINT FK_employ_TO_board2 FOREIGN KEY(editno) REFERENCES employ(no)
);

-- 개시글
CREATE TABLE post (
		no number PRIMARY KEY NOT NULL,     --번호
		title VARCHAR(100) NULL,            --제목
		contents CLOB NULL,                 --내용
		regdate VARCHAR(20) NULL,           --등록일
		viewcount number NULL,              --조회수
		delck number NULL,                  --삭제여부
		emplno number NULL,                 --작성 직원 번호
		boardno number NULL,                --게시판 번호
		CONSTRAINT FK_employ_TO_post FOREIGN KEY(emplno) REFERENCES employ(no),
		CONSTRAINT FK_board_TO_post FOREIGN KEY(boardno) REFERENCES board(no)

);

-- 게시판 종류
CREATE TABLE kategorie (
		no number PRIMARY KEY NOT NULL,     --번호
		name VARCHAR(30) NOT NULL,          --이름   
		info VARCHAR(200) NULL,             --정보
		useck number NULL                  --사용여부
);

-- 권한
CREATE TABLE ability (
		no number PRIMARY KEY NOT NULL,     --번호
		name VARCHAR(20) NOT NULL,          --이름
		info VARCHAR(200) NULL              --정보
);

-- 댓글
CREATE TABLE commentinfo (
		no number PRIMARY KEY NOT NULL,     --번호
		regdate VARCHAR(20) NULL,           --등록일
		arrayno number NULL,                --정렬 번호
		stepno number NULL,                 --단계 번호
		delck number NULL,                  --삭제 여부
		groupno number NULL,                --그룹 번호
		postno number NULL,                 --게시글 번호
		CONSTRAINT FK_post_TO_comment FOREIGN KEY(postno) REFERENCES post(no)
);

-- 업로드파일
CREATE TABLE uploadinfo (
		no number PRIMARY KEY NOT NULL,     --번호
		filename VARCHAR(50) NULL,          --파일명
		downcount number NULL,              --다운로드 수
		filesize number NULL,               --파일 사이즈
		originalfilename VARCHAR(50) NULL,  --원래 파일명
		regdate VARCHAR(30) NULL,           --등록일
		postno number NULL,                 --개시글 번호
		CONSTRAINT FK_post_TO_uploadinfo FOREIGN KEY(postno) REFERENCES post(no)
);

-- 사고
CREATE TABLE accident (
		no number PRIMARY KEY NOT NULL, --번호
		title VARCHAR(200) NULL,        --제목
		occurdate VARCHAR(20) NULL,     --날짜
		coment CLOB NULL,               --내용
		photofd VARCHAR(50) NULL,       --사진 폴더
		regdate VARCHAR(20) NULL,       --접수일
		regno number NULL,              --접수 직원
		enddate VARCHAR(20) NULL,       --완료 일
		emplno number NULL,             --완료 직원
		endck number NULL,              --완료 여부
		ssbno number NULL,              --구독 번호
		CONSTRAINT FK_subscribe_TO_accident FOREIGN KEY(ssbno) REFERENCES subscribe(no),
		CONSTRAINT FK_employ_TO_accident FOREIGN KEY(regno) REFERENCES employ(no),
		CONSTRAINT FK_employ_TO_accident2 FOREIGN KEY(emplno) REFERENCES employ(no)
);

-- 결제
CREATE TABLE payment (
		no number PRIMARY KEY NOT NULL, --번호
		way number NULL,                --결제수단
		progress number NULL,           --진행사항
		firstdate VARCHAR(20) NOT NULL, --최초 결제일
		enddate VARCHAR(20) NULL,       --종료일
		price number NULL,              --금액
		paymentck number NULL,          --결제 확인
		ssbno number NOT NULL,          --구독 번호
		userno number NOT NULL,         --유저 번호
		emplno number NULL,             --직원 번호
		CONSTRAINT FK_subscribe_TO_payment FOREIGN KEY(ssbno) REFERENCES subscribe(no),
		CONSTRAINT FK_userinfo_TO_payment FOREIGN KEY(userno) REFERENCES userinfo(no),
		CONSTRAINT FK_employ_TO_payment FOREIGN KEY(emplno) REFERENCES employ(no)
);

-- 권한상세정보
CREATE TABLE abilitydt (
		no number PRIMARY KEY NOT NULL,  --번호
		car number NULL,                 --자동차 권한
		userab number NULL,                --유저 권한
		subscribtion number NULL,        --구독 권한
		payment number NULL,             --결제 권한
		cunsulting number NULL,          --상담 권한
		employ number NULL,              --직원 권한
		accident number NULL,            --사고 권한
		abilityno number NULL,           --권한 번호
		CONSTRAINT FK_ability_TO_abilitydt FOREIGN KEY(abilityno) REFERENCES employ(no)
);

-- 개시판권한
CREATE TABLE abilityboard (
		no number PRIMARY KEY NOT NULL, --번호
		ability number NULL,            --권한
		boardno number NULL,            --게시판 번호
		abilityno number NULL,          --권한 번호
		CONSTRAINT FK_ability_TO_abilityboard FOREIGN KEY(abilityno) REFERENCES employ(no),
		CONSTRAINT FK_ability_TO_board FOREIGN KEY(boardno) REFERENCES board(no)
);

