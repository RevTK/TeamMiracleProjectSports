package com.tm.nmp.account;

public class FavoriteClubDTO {
	private int user_id;
	private int club_id;

	public FavoriteClubDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FavoriteClubDTO(int user_id, int club_id) {
		super();
		this.user_id = user_id;
		this.club_id = club_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getClub_id() {
		return club_id;
	}

	public void setClub_id(int club_id) {
		this.club_id = club_id;
	}

	@Override
	public String toString() {
		return "FavoriteClubDTO [user_id=" + user_id + ", club_id=" + club_id + "]";
	}

}
