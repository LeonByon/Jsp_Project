package board;

public class VO_COM {
	private int num;
	private int board_num;
	private String mem_name;
	private String memo;
	private String time;
	public VO_COM() {

	}

	public VO_COM(int num,int board_num,String mem_name,String memo,String time) {
	this.num = num;
	this.board_num = board_num;
	this.mem_name = mem_name;
	this.memo = memo;
	this.time = time;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

}
