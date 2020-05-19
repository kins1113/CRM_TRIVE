-- ȸ��
CREATE TABLE userinfo (
		no number PRIMARY KEY NOT NULL,     --��ȣ
		name VARCHAR(20) NOT NULL,          --�̸�
		tel VARCHAR(15) NOT NULL,           --��ȭ��ȣ
		birthday VARCHAR(15) NOT NULL,      --����
		gender number NULL,                 --����
		zipcode VARCHAR(15) NOT NULL,       --�����ȣ  
		address VARCHAR(100) NOT NULL,      --�ּ�
		addressdt VARCHAR(100) NULL,        --���ּ�
		memo CLOB NULL,                     --�޸�
		attentioncar VARCHAR(100) NULL,     --��������
		option1 VARCHAR(100) NULL,          --�ɼ�1
		option2 VARCHAR(100) NULL,          --�ɼ�2
		option3 VARCHAR(100) NULL,          --�ɼ�3
		option4 VARCHAR(100) NULL,          --�ɼ�4
		option5 VARCHAR(100) NULL           --�ɼ�5
);

-- �ڵ���
--drop table carinfo CASCADE CONSTRAINTS;
CREATE TABLE carinfo (
		no number PRIMARY KEY NOT NULL, --��ȣ
		name VARCHAR(100) NULL,         --�̸�
		maker VARCHAR(50) NULL,         --������
		model VARCHAR(100) NULL,        --�𵨸�
		generation VARCHAR(30) NULL,    --����
		carnumber VARCHAR(20) NULL,     --�ڵ�����ȣ
		price VARCHAR(30) NULL,              --����
		regdate VARCHAR(30) NULL,       --�����
		showck VARCHAR(30) NULL,             --���ÿ���
		photofd VARCHAR(30) NULL,       --��������
		fueltype VARCHAR(30) NULL,           --����
		displacement VARCHAR(30) NULL,  --��ⷮ
		getck VARCHAR(30) NULL,             --��������
		option1 VARCHAR(100) NULL,          --�ɼ�1
		option2 VARCHAR(100) NULL,          --�ɼ�2
		option3 VARCHAR(100) NULL,          --�ɼ�3
		option4 VARCHAR(100) NULL,          --�ɼ�4
		option5 VARCHAR(100) NULL           --�ɼ�5
);

-- ������
CREATE TABLE driverlicense (
		no number PRIMARY KEY NOT NULL,         --��ȣ
		kind VARCHAR(10) NOT NULL,              --����
		code VARCHAR(15) NOT NULL,              --������ �߰����ִ� �ڵ�
		issuedate VARCHAR(20) NOT NULL,         --�߱޳�¥
		expirateiondate VARCHAR(30) NOT NULL,   --��ȿ�Ⱓ
		userno number NOT NULL,                 --���� ��ȣ
		CONSTRAINT FK_userinfo_TO_driverlicense FOREIGN KEY(userno) REFERENCES userinfo(no)
);

-- ����
CREATE TABLE employ (
		no number PRIMARY KEY NOT NULL,         --��ȣ
		id VARCHAR(20) NOT NULL,                --���̵�
		password VARCHAR(30) NOT NULL,          --��й�ȣ
		name VARCHAR(20) NOT NULL,              --�̸�
		abiliryno number NOT NULL,              --���ѹ�ȣ
		CONSTRAINT FK_ability_TO_employ FOREIGN KEY(abiliryno) REFERENCES ability(no)
);

-- ����
CREATE TABLE subscribe (
		no number PRIMARY KEY NOT NULL,     --��ȣ
		startdate VARCHAR(20) NOT NULL,     --���۳�¥
		month number NOT NULL,              --��� ������
		userno number NOT NULL,             --���� ��ȣ
		carno number NOT NULL,              --�ڵ��� ��ȣ
		CONSTRAINT FK_carinfo_TO_subscribe FOREIGN KEY(carno) REFERENCES carinfo(no)
);

-- ���
CREATE TABLE cunsulting (
		no number PRIMARY KEY NOT NULL,     --��ȣ
		title VARCHAR(100) NULL,            --����
		contents CLOB NULL,                 --����
		userno number NULL,                 --���� ��ȣ
		emplno number NULL,                 --���� ��ȣ
		CONSTRAINT FK_userinfo_TO_cunsulting FOREIGN KEY(userno) REFERENCES userinfo(no),
		CONSTRAINT FK_employ_TO_cunsulting FOREIGN KEY(emplno) REFERENCES employ(no)
);

-- ����
CREATE TABLE estimate (
		no number PRIMARY KEY NOT NULL, --��ȣ
		maker VARCHAR(50) NULL,         --������
		model VARCHAR(100) NULL,        --�𵨸�
		generation VARCHAR(30) NULL,    --����
		pricemin number NULL,           --�ּ� ������
		pricemex number NULL,           --�ִ� ������
		color VARCHAR(15) NULL,         --����
		other CLOB NULL,                --��Ÿ �䱸����
		endck number NULL,              --�Ϸ� ����
		coment VARCHAR(500) NULL,       --�Ϸ� �޸�
		userno number NULL,             --���� ��ȣ
		emplno number NULL,             --���� ��ȣ
		CONSTRAINT FK_userinfo_TO_estimate FOREIGN KEY(userno) REFERENCES userinfo(no),
		CONSTRAINT FK_employ_TO_estimate FOREIGN KEY(emplno) REFERENCES employ(no)
);

-- �ɼ��̸�
drop table optioninfo CASCADE CONSTRAINTS;
CREATE TABLE optioninfo (
        no number primary key, -- ��ȣ
		userop1 VARCHAR(50) NULL,   --���� �ɼ�1
		userop2 VARCHAR(50) NULL,   --���� �ɼ�1
		userop3 VARCHAR(50) NULL,   --���� �ɼ�1
		userop4 VARCHAR(50) NULL,   --���� �ɼ�1
		userop5 VARCHAR(50) NULL,   --���� �ɼ�1
		carop1 VARCHAR(20) NULL,    --�ڵ��� �ɼ�1
		carop2 VARCHAR(20) NULL,    --�ڵ��� �ɼ�1
		carop3 VARCHAR(20) NULL,    --�ڵ��� �ɼ�1
		carop4 VARCHAR(20) NULL,    --�ڵ��� �ɼ�1
		carop5 VARCHAR(20) NULL    --�ڵ��� �ɼ�1
);


-- ������
CREATE TABLE board (
		no number PRIMARY KEY NOT NULL,     --��ȣ
		name VARCHAR(100) NOT NULL,         --�̸�
		info VARCHAR(200) NULL,             --����
		regno number NOT NULL,              --���� ������
		regdate VARCHAR(20) NULL,           --���� ������
		editno number NULL,                 --���� ������
		editdate VARCHAR(20) NULL,          --���� ������
		useck number NULL,                  --��� ����
		comentck number NULL,               --��� ��� ����
		uploadck number NULL,               --���� ���ε� ��� ����
		kategorieno number NULL,            --ī�װ� ��ȣ
		CONSTRAINT FK_kategorie_TO_board FOREIGN KEY(kategorieno) REFERENCES kategorie(no),
		CONSTRAINT FK_employ_TO_board FOREIGN KEY(regno) REFERENCES employ(no),
		CONSTRAINT FK_employ_TO_board2 FOREIGN KEY(editno) REFERENCES employ(no)
);

-- ���ñ�
CREATE TABLE post (
		no number PRIMARY KEY NOT NULL,     --��ȣ
		title VARCHAR(100) NULL,            --����
		contents CLOB NULL,                 --����
		regdate VARCHAR(20) NULL,           --�����
		viewcount number NULL,              --��ȸ��
		delck number NULL,                  --��������
		emplno number NULL,                 --�ۼ� ���� ��ȣ
		boardno number NULL,                --�Խ��� ��ȣ
		CONSTRAINT FK_employ_TO_post FOREIGN KEY(emplno) REFERENCES employ(no),
		CONSTRAINT FK_board_TO_post FOREIGN KEY(boardno) REFERENCES board(no)

);

-- �Խ��� ����
CREATE TABLE kategorie (
		no number PRIMARY KEY NOT NULL,     --��ȣ
		name VARCHAR(30) NOT NULL,          --�̸�   
		info VARCHAR(200) NULL,             --����
		useck number NULL                  --��뿩��
);

-- ����
CREATE TABLE ability (
		no number PRIMARY KEY NOT NULL,     --��ȣ
		name VARCHAR(20) NOT NULL,          --�̸�
		info VARCHAR(200) NULL              --����
);

-- ���
CREATE TABLE commentinfo (
		no number PRIMARY KEY NOT NULL,     --��ȣ
		regdate VARCHAR(20) NULL,           --�����
		arrayno number NULL,                --���� ��ȣ
		stepno number NULL,                 --�ܰ� ��ȣ
		delck number NULL,                  --���� ����
		groupno number NULL,                --�׷� ��ȣ
		postno number NULL,                 --�Խñ� ��ȣ
		CONSTRAINT FK_post_TO_comment FOREIGN KEY(postno) REFERENCES post(no)
);

-- ���ε�����
CREATE TABLE uploadinfo (
		no number PRIMARY KEY NOT NULL,     --��ȣ
		filename VARCHAR(50) NULL,          --���ϸ�
		downcount number NULL,              --�ٿ�ε� ��
		filesize number NULL,               --���� ������
		originalfilename VARCHAR(50) NULL,  --���� ���ϸ�
		regdate VARCHAR(30) NULL,           --�����
		postno number NULL,                 --���ñ� ��ȣ
		CONSTRAINT FK_post_TO_uploadinfo FOREIGN KEY(postno) REFERENCES post(no)
);

-- ���
CREATE TABLE accident (
		no number PRIMARY KEY NOT NULL, --��ȣ
		title VARCHAR(200) NULL,        --����
		occurdate VARCHAR(20) NULL,     --��¥
		coment CLOB NULL,               --����
		photofd VARCHAR(50) NULL,       --���� ����
		regdate VARCHAR(20) NULL,       --������
		regno number NULL,              --���� ����
		enddate VARCHAR(20) NULL,       --�Ϸ� ��
		emplno number NULL,             --�Ϸ� ����
		endck number NULL,              --�Ϸ� ����
		ssbno number NULL,              --���� ��ȣ
		CONSTRAINT FK_subscribe_TO_accident FOREIGN KEY(ssbno) REFERENCES subscribe(no),
		CONSTRAINT FK_employ_TO_accident FOREIGN KEY(regno) REFERENCES employ(no),
		CONSTRAINT FK_employ_TO_accident2 FOREIGN KEY(emplno) REFERENCES employ(no)
);

-- ����
CREATE TABLE payment (
		no number PRIMARY KEY NOT NULL, --��ȣ
		way number NULL,                --��������
		progress number NULL,           --�������
		firstdate VARCHAR(20) NOT NULL, --���� ������
		enddate VARCHAR(20) NULL,       --������
		price number NULL,              --�ݾ�
		paymentck number NULL,          --���� Ȯ��
		ssbno number NOT NULL,          --���� ��ȣ
		userno number NOT NULL,         --���� ��ȣ
		emplno number NULL,             --���� ��ȣ
		CONSTRAINT FK_subscribe_TO_payment FOREIGN KEY(ssbno) REFERENCES subscribe(no),
		CONSTRAINT FK_userinfo_TO_payment FOREIGN KEY(userno) REFERENCES userinfo(no),
		CONSTRAINT FK_employ_TO_payment FOREIGN KEY(emplno) REFERENCES employ(no)
);

-- ���ѻ�����
CREATE TABLE abilitydt (
		no number PRIMARY KEY NOT NULL,  --��ȣ
		car number NULL,                 --�ڵ��� ����
		userab number NULL,                --���� ����
		subscribtion number NULL,        --���� ����
		payment number NULL,             --���� ����
		cunsulting number NULL,          --��� ����
		employ number NULL,              --���� ����
		accident number NULL,            --��� ����
		abilityno number NULL,           --���� ��ȣ
		CONSTRAINT FK_ability_TO_abilitydt FOREIGN KEY(abilityno) REFERENCES employ(no)
);

-- �����Ǳ���
CREATE TABLE abilityboard (
		no number PRIMARY KEY NOT NULL, --��ȣ
		ability number NULL,            --����
		boardno number NULL,            --�Խ��� ��ȣ
		abilityno number NULL,          --���� ��ȣ
		CONSTRAINT FK_ability_TO_abilityboard FOREIGN KEY(abilityno) REFERENCES employ(no),
		CONSTRAINT FK_ability_TO_board FOREIGN KEY(boardno) REFERENCES board(no)
);

