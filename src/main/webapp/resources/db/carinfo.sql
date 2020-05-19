select * from userinfo;
select * from carinfo;

insert into carinfo (NO, NAME, MAKER, MODEL, GENERATION, CARNUMBER, PRICE, REGDATE, SHOWCK, PHOTOFD, FUELTYPE, DISPLACEMENT, GETCK)
values (carinfo_seq.nextval, 'k5', '현대', '', '1세대', '32나3123', 1000000, '2020-04-21', 0, '폴더명', 1, '배기량', 0);


insert into carinfo (NO, NAME, MAKER, MODEL, GENERATION, CARNUMBER, PRICE, REGDATE, SHOWCK, PHOTOFD, FUELTYPE, DISPLACEMENT, GETCK)
values (0, '이름', '제조사', '모델', '세대', '차번호', '가격', '구매일', '출력여부', '폴더명', '연료타입', '배기량', '보유여부');

commit;

select NO, NAME, MAKER, MODEL, GENERATION, CARNUMBER, PRICE, REGDATE, PHOTOFD, DISPLACEMENT, 
  DECODE(FUELTYPE, '0', '경유', '1','휘발유','2','고급 휘발유','3','하이브리드','4','전기' ) "FUELTYPE" ,
  DECODE(SHOWCK, '0','출력','1','미출력') "SHOWCK",
  DECODE(GETCK, '0','보유','1', '미보유') "GETCK"
  from carinfo ;
update carinfo
set showck=1
where no=5;




