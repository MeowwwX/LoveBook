package action;

import service.CommentService;

public class deleteCommentAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	private CommentService commentService;
	private int id;
	public void setCommentService(CommentService commentService){
		this.commentService=commentService;
	}
	public int getId(){
		return id;
	}
	public void setId(int id){
		this.id=id;
	}
	public String execute() throws Exception{
		commentService.delComment(id);
		return SUCCESS;
	}
}