package jdbc;

public class FeedDTO {
	private String id, content, ts, images;

	public String getId() {
		return id;
	}

	public String getContent() {
		return content;
	}

	public String getTs() {
		return ts;
	}
	
	public String getImages() {
		return images;
	}

	public FeedDTO(String id, String content, String ts) {
		super();
		this.id = id;
		this.content = content;
		this.ts = ts;
		
	}

	public FeedDTO(String id, String content, String ts, String images) {
		this(id,content,ts);
		this.images = images;
	}


	
}
