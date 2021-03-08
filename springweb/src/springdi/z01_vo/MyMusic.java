package springdi.z01_vo;

import java.util.ArrayList;

public class MyMusic {
	private String name;
	private ArrayList<String> mlist;

	public MyMusic() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MyMusic(String name) {
		super();
		this.name = name;
		mlist = new ArrayList<String>();
	}

	public void setMlist(ArrayList<String> mlist) {
		this.mlist = mlist;
	}

	public void musicList() {
		System.out.println(name + "의 좋아하는 음악리스트");
		if (mlist.size() > 0) {
			for (String music : mlist) {
				System.out.println(music);
			}
		} else {
			System.out.println("좋아하는 음악이 없습니다.");
		}
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
