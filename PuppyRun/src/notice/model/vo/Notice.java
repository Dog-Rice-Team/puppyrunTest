package notice.model.vo;

import java.sql.Date;

public class Notice {
	private int noticeNo; 
	private String noticeTitle;
	private int noticeContent;
	private String noticeView;
	private Date noticeDate;
	private String noticePhoto;
	
	public Notice() {}
	
	// getter/setter
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public int getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(int noticeContent) {
		this.noticeContent = noticeContent;
	}
	public String getNoticeView() {
		return noticeView;
	}
	public void setNoticeView(String noticeView) {
		this.noticeView = noticeView;
	}
	public Date getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}
	public String getNoticePhoto() {
		return noticePhoto;
	}
	public void setNoticePhoto(String noticePhoto) {
		this.noticePhoto = noticePhoto;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeView=" + noticeView + ", noticeDate=" + noticeDate + ", noticePhoto=" + noticePhoto + "]";
	}
}
