select NO, NAME, MAKER, MODEL, GENERATION, CARNUMBER, PRICE, REGDATE, PHOTOFD, DISPLACEMENT,
					DECODE(FUELTYPE, '0', '경유', '1','휘발유','2','고급 휘발유','3','하이브리드','4','전기' ) "FUELTYPE" ,
					DECODE(SHOWCK, '0','출력','1','미출력') "SHOWCK",
					DECODE(GETCK, '0','보유','1', '미보유') "GETCK" 
					from carinfo dsc;
					
					
select * from optioninfo 
where 
;
select LISTAGG(COLUMN_NAME, ',') WITHIN GROUP (ORDER BY COLUMN_NAME) AS team  from
(
select 1 "no", COLUMN_NAME from COLS where TABLE_NAME='OPTIONINFO' and COLUMN_NAME like 'CAROP%'
);


insert into optioninfo
values(1,'','','','','','','','','','');

update optioninfo
set carop1='딜러';

delete from optioninfo where no=1;

commit;

SELECT * FROM COLS WHERE COLUMN_NAME like 'CAROP%';

SELECT * FROM COLS WHERE TABLE_NAME = 'CARINFO'; 

update COLS
set data_default = '번호'
where table_name='CARINFO' and column_name='no';
