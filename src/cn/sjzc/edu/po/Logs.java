package cn.sjzc.edu.po;

public class Logs {

	private int id;// 日报编号
	private String name;// 发送人
	private String something;// 个人今日计划|| 本周计划||本月计划||小组今日计划
	private String progress;// 完成情况
	private String wait;// 待处理业务
	private String step;// 个人明日计划|| 下周计划||下月计划||小组明日计划
	private String type;// 类型 1--日报--普通职员,2--周报--小组长,3--月报--部门主管 4--小组日志--小组长
	private String notes;// 备注
	private String time;// 发布时间
	private String branch;// 所属部门
	private String group;//小组

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

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

	public String getSomething() {
		return something;
	}

	public void setSomething(String something) {
		this.something = something;
	}

	public String getProgress() {
		return progress;
	}

	public void setProgress(String progress) {
		this.progress = progress;
	}

	public String getWait() {
		return wait;
	}

	public void setWait(String wait) {
		this.wait = wait;
	}

	public String getStep() {
		return step;
	}

	public void setStep(String step) {
		this.step = step;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

}
