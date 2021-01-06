package cn.sjzc.edu.po;

public class Admin {

	private int id;// 管理员编号
	private String account;// 管理员账号
	private String pwd;// 管理员密码
	private String pic;// 管理员头像

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

}
