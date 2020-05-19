select * from userinfo;

insert into userinfo (NO, NAME, TEL, BIRTHDAY, GENDER,ZIPCODE, ADDRESS, ADDRESSDT, MEMO, ATTENTIONCAR)
values(userinfo_SEQ.nextval,'김옥환','010-1234-5774','19921102',1,'12345','서울시 삼전동','123-31번지','메모','k5');

commit;