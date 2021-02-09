package a02_object.a07_oneVSmulti;

import java.util.ArrayList;

public class League {
	private String lname;
	private ArrayList<Team> tlist;

	public League(String lname) {
		super();
		this.lname = lname;
		tlist = new ArrayList<Team>();
	}

	public void addTeam(Team t) {
		tlist.add(t);
	}

	public void playTeam10() {
		for (Team t : tlist) {
			// League에 들어온 팀들 10개 게임 진행.
			for (int cnt = 1; cnt <= 20; cnt++) {
				t.play();
			}
		}
	}

	public void teamRecord() {
		System.out.println("팀명\t경기수\t승\t무\t패");
		for (Team t : tlist) {
			t.showRecord();
		}
	}
}
