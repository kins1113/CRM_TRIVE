select NO, NAME, MAKER, MODEL, GENERATION, CARNUMBER, PRICE, REGDATE, PHOTOFD, DISPLACEMENT,
					DECODE(FUELTYPE, '0', '����', '1','�ֹ���','2','��� �ֹ���','3','���̺긮��','4','����' ) "FUELTYPE" ,
					DECODE(SHOWCK, '0','���','1','�����') "SHOWCK",
					DECODE(GETCK, '0','����','1', '�̺���') "GETCK" 
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
set carop1='����';

delete from optioninfo where no=1;

commit;

SELECT * FROM COLS WHERE COLUMN_NAME like 'CAROP%';

SELECT * FROM COLS WHERE TABLE_NAME = 'CARINFO'; 

update COLS
set data_default = '��ȣ'
where table_name='CARINFO' and column_name='no';
