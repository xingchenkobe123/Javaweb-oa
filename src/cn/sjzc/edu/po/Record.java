package cn.sjzc.edu.po;

public class Record {

	private int id;// 考勤报表编号
	private String name;// 打卡人员姓名
	private String branch;// 所在部门
	private String start;// 上班打卡时间
	private String over;// 下班打卡时间
	private String type;// 打卡类型，上班打卡和外勤打卡

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getOver() {
		return over;
	}

	public void setOver(String over) {
		this.over = over;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
