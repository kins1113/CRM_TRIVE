package com.crm.ct.userinfo.model;

public class UserinfoVO {
	private int no ;   //번호
	private String name ;	//이름
	private String tel ;   //전화번호
	private String birthday ;   //생일
	private int gender ;   //성별
	private String zipcode ;   //우편번호  
	private String address ;   //주소
	private String addressdt ;   //상세주소
	private String memo ;   //메모
	private String attentioncar ;   //관심차종
	private String option1 ;   //옵션1
	private String option2 ;   //옵션2
	private String option3 ;   //옵션3
	private String option4 ;   //옵션4
	private String option5 ;   //옵션5
	
	public UserinfoVO() {
		super();
	}
	public UserinfoVO(int no, String name, String tel, String birthday, int gender, String zipcode, String address,
			String addressdt, String memo, String attentioncar, String option1, String option2, String option3,
			String option4, String option5) {
		super();
		this.no = no;
		this.name = name;
		this.tel = tel;
		this.birthday = birthday;
		this.gender = gender;
		this.zipcode = zipcode;
		this.address = address;
		this.addressdt = addressdt;
		this.memo = memo;
		this.attentioncar = attentioncar;
		this.option1 = option1;
		this.option2 = option2;
		this.option3 = option3;
		this.option4 = option4;
		this.option5 = option5;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddressdt() {
		return addressdt;
	}
	public void setAddressdt(String addressdt) {
		this.addressdt = addressdt;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getAttentioncar() {
		return attentioncar;
	}
	public void setAttentioncar(String attentioncar) {
		this.attentioncar = attentioncar;
	}
	public String getOption1() {
		return option1;
	}
	public void setOption1(String option1) {
		this.option1 = option1;
	}
	public String getOption2() {
		return option2;
	}
	public void setOption2(String option2) {
		this.option2 = option2;
	}
	public String getOption3() {
		return option3;
	}
	public void setOption3(String option3) {
		this.option3 = option3;
	}
	public String getOption4() {
		return option4;
	}
	public void setOption4(String option4) {
		this.option4 = option4;
	}
	public String getOption5() {
		return option5;
	}
	public void setOption5(String option5) {
		this.option5 = option5;
	}
	@Override
	public String toString() {
		return "UserinfoVO [no=" + no + ", name=" + name + ", tel=" + tel + ", birthday=" + birthday + ", gender="
				+ gender + ", zipcode=" + zipcode + ", address=" + address + ", addressdt=" + addressdt + ", memo="
				+ memo + ", attentioncar=" + attentioncar + ", option1=" + option1 + ", option2=" + option2
				+ ", option3=" + option3 + ", option4=" + option4 + ", option5=" + option5 + "]";
	}
}
