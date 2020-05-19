package com.crm.ct.carinfo.model;

public class CarinfoVO {
	private int no;		//번호
	private String name;		//이름
	private String maker;		//제조사
	private String model;		//모델명
	private String generation;		//세대
	private String carnumber;		//자동차번호
	private int price;		//가격
	private String regdate;		//등록일
	private int showck;		//전시여부
	private String photofd;		//사진폴더
	private int fueltype;		//연료
	private String displacement;		//배기량
	private int getck;		//보유여부
	private String option1;		//옵션1
	private String option2;		//옵션2
	private String option3;		//옵션3
	private String option4;		//옵션4
	private String option5;		//옵션5
	
	public CarinfoVO() {
		super();
	}
	public CarinfoVO(int no, String name, String maker, String model, String generation, String carnumber, int price,
			String regdate, int showck, String photofd, int fueltype, String displacement, int getck, String option1,
			String option2, String option3, String option4, String option5) {
		super();
		this.no = no;
		this.name = name;
		this.maker = maker;
		this.model = model;
		this.generation = generation;
		this.carnumber = carnumber;
		this.price = price;
		this.regdate = regdate;
		this.showck = showck;
		this.photofd = photofd;
		this.fueltype = fueltype;
		this.displacement = displacement;
		this.getck = getck;
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
	public String getMaker() {
		return maker;
	}
	public void setMaker(String maker) {
		this.maker = maker;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getGeneration() {
		return generation;
	}
	public void setGeneration(String generation) {
		this.generation = generation;
	}
	public String getCarnumber() {
		return carnumber;
	}
	public void setCarnumber(String carnumber) {
		this.carnumber = carnumber;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getShowck() {
		return showck;
	}
	public void setShowck(int showck) {
		this.showck = showck;
	}
	public String getPhotofd() {
		return photofd;
	}
	public void setPhotofd(String photofd) {
		this.photofd = photofd;
	}
	public int getFueltype() {
		return fueltype;
	}
	public void setFueltype(int fueltype) {
		this.fueltype = fueltype;
	}
	public String getDisplacement() {
		return displacement;
	}
	public void setDisplacement(String displacement) {
		this.displacement = displacement;
	}
	public int getGetck() {
		return getck;
	}
	public void setGetck(int getck) {
		this.getck = getck;
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
		return "CarinfoVO [no=" + no + ", name=" + name + ", maker=" + maker + ", model=" + model + ", generation="
				+ generation + ", carnumber=" + carnumber + ", price=" + price + ", regdate=" + regdate + ", showck="
				+ showck + ", photofd=" + photofd + ", fueltype=" + fueltype + ", displacement=" + displacement
				+ ", getck=" + getck + ", option1=" + option1 + ", option2=" + option2 + ", option3=" + option3
				+ ", option4=" + option4 + ", option5=" + option5 + ", getNo()=" + getNo() + ", getName()=" + getName()
				+ ", getMaker()=" + getMaker() + ", getModel()=" + getModel() + ", getGeneration()=" + getGeneration()
				+ ", getCarnumber()=" + getCarnumber() + ", getPrice()=" + getPrice() + ", getRegdate()=" + getRegdate()
				+ ", getShowck()=" + getShowck() + ", getPhotofd()=" + getPhotofd() + ", getFueltype()=" + getFueltype()
				+ ", getDisplacement()=" + getDisplacement() + ", getGetck()=" + getGetck() + ", getOption1()="
				+ getOption1() + ", getOption2()=" + getOption2() + ", getOption3()=" + getOption3() + ", getOption4()="
				+ getOption4() + ", getOption5()=" + getOption5() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
}
