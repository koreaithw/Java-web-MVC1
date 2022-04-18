package jdbc;

public class InformDTO {
	private String iid;
	private String ititle;
	private String icontent;
	private String iuser;
	private String idate;
	public String getIid() {
		return iid;
	}
	public String getItitle() {
		return ititle;
	}
	public String getIcontent() {
		return icontent;
	}
	public String getIuser() {
		return iuser;
	}
	public String getIdate() {
		return idate;
	}
	public InformDTO(String iid, String ititle, String icontent, String iuser, String idate) {
		super();
		this.iid = iid;
		this.ititle = ititle;
		this.icontent = icontent;
		this.iuser = iuser;
		this.idate = idate;
	}
	
}
