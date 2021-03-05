package springweb.z02_vo;

public class Player {
	private String tname;
	private String player;
	private double hitRatio;

	public Player() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Player(String tname, String player, double hitRatio) {
		super();
		this.tname = tname;
		this.player = player;
		this.hitRatio = hitRatio;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public String getPlayer() {
		return player;
	}

	public void setPlayer(String player) {
		this.player = player;
	}

	public double getHitRatio() {
		return hitRatio;
	}

	public void setHitRatio(double hitRatio) {
		this.hitRatio = hitRatio;
	}

}
