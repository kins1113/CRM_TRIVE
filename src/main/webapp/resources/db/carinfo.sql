select * from userinfo;
select * from carinfo;

insert into carinfo (NO, NAME, MAKER, MODEL, GENERATION, CARNUMBER, PRICE, REGDATE, SHOWCK, PHOTOFD, FUELTYPE, DISPLACEMENT, GETCK)
values (carinfo_seq.nextval, 'k5', '����', '', '1����', '32��3123', 1000000, '2020-04-21', 0, '������', 1, '��ⷮ', 0);


insert into carinfo (NO, NAME, MAKER, MODEL, GENERATION, CARNUMBER, PRICE, REGDATE, SHOWCK, PHOTOFD, FUELTYPE, DISPLACEMENT, GETCK)
values (0, '�̸�', '������', '��', '����', '����ȣ', '����', '������', '��¿���', '������', '����Ÿ��', '��ⷮ', '��������');

commit;

select NO, NAME, MAKER, MODEL, GENERATION, CARNUMBER, PRICE, REGDATE, PHOTOFD, DISPLACEMENT, 
  DECODE(FUELTYPE, '0', '����', '1','�ֹ���','2','��� �ֹ���','3','���̺긮��','4','����' ) "FUELTYPE" ,
  DECODE(SHOWCK, '0','���','1','�����') "SHOWCK",
  DECODE(GETCK, '0','����','1', '�̺���') "GETCK"
  from carinfo ;
update carinfo
set showck=1
where no=5;




