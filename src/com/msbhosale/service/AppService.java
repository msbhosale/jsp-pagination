package com.msbhosale.service;

import java.util.ArrayList;
import java.util.List;

public class AppService {

	private int recordLimit = 5;

	public List<String> getPlayers(int pageNumber) {

		List<String> players = new ArrayList<String>();

		if (pageNumber <= 10) {
			for (int i = 1; i <= recordLimit; i++) {

				players.add("Player " + pageNumber + " - " + i);
			}
		}

		return players;
	}
}