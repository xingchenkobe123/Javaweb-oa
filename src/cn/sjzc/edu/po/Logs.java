package cn.sjzc.edu.po;

public class Logs {

	private int id;// �ձ����
	private String name;// ������
	private String something;// ���˽��ռƻ�|| ���ܼƻ�||���¼ƻ�||С����ռƻ�
	private String progress;// ������
	private String wait;// ������ҵ��
	private String step;// �������ռƻ�|| ���ܼƻ�||���¼ƻ�||С�����ռƻ�
	private String type;// ���� 1--�ձ�--��ְͨԱ,2--�ܱ�--С�鳤,3--�±�--�������� 4--С����־--С�鳤
	private String notes;// ��ע
	private String time;// ����ʱ��
	private String branch;// ��������
	private String group;//С��

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
