﻿CREATE SEQUENCE userinfo_SEQ --시퀀스이름 EX_SEQ
INCREMENT BY 1 --증감숫자 1
START WITH 1 --시작숫자 1
MINVALUE 1 --최소값 1
MAXVALUE 1000 --최대값 1000
NOCYCLE --순한하지않음
NOCACHE; --메모

CREATE SEQUENCE carinfo_SEQ --시퀀스이름 EX_SEQ
INCREMENT BY 1 --증감숫자 1
START WITH 1 --시작숫자 1
MINVALUE 1 --최소값 1
MAXVALUE 1000 --최대값 1000
NOCYCLE --순한하지않음
NOCACHE; --메모