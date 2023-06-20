package com.tm.nmp.stadium;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tm.nmp.account.AccountDAO;
import com.tm.nmp.admin.AdminDAOo;
import com.tm.nmp.admin.ClubImageDTO;
import com.tm.nmp.board.BoardOption;
import com.tm.nmp.controller.AccountController;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping(value = "/stadium")
public class StadiumController {

	@Autowired
	private AccountDAO acDAO;
	
	@Autowired
	private StadiumDAO sdDAO;
	
	@Autowired
	private AdminDAOo adminDAO;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String stadiumMainGo(HttpServletRequest req) {
		log.info("stadium 메인 진입");
		acDAO.wathingPage(req);
		acDAO.loginCheck(req);
		
		req.setAttribute("contentPage", "stadium/stadiumMain.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/baseball.go", method = RequestMethod.GET)
	public String baseballGo(HttpServletRequest req) {
		acDAO.loginCheck(req);
		req.setAttribute("contentPage", "stadium/baseball/baseball_stadium.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/baseball.stadium.go.detail", method = RequestMethod.GET)
	public String baseballStadiumGoDetail(HttpServletRequest req) {
		acDAO.loginCheck(req);
		sdDAO.viewBaseballSeat(req);
		sdDAO.viewBaseballSeatDetail(req);
		req.setAttribute("contentPage", "stadium/baseball/baseball_stadium_detail.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/soccer.go", method = RequestMethod.GET)
	public String soccerGo(HttpServletRequest req) {
		acDAO.loginCheck(req);
		req.setAttribute("contentPage", "stadium/soccer/soccer_stadium.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/soccer.stadium.go.detail", method = RequestMethod.GET)
	public String soccerStadiumGoDetail(HttpServletRequest req) {
		acDAO.loginCheck(req);
		sdDAO.viewSoccerSeat(req);
		sdDAO.viewSoccerSeatDetail(req);
		req.setAttribute("contentPage", "stadium/soccer/soccer_stadium_detail.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/basketball.go", method = RequestMethod.GET)
	public String basketballGo(HttpServletRequest req) {
		acDAO.loginCheck(req);
		req.setAttribute("contentPage", "stadium/basketball/basketball_stadium.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/basketball2.go", method = RequestMethod.GET)
	public String basketballGo2(HttpServletRequest req) {
		acDAO.loginCheck(req);
		req.setAttribute("contentPage", "stadium/basketball/w_basketball_stadium.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/basketball.stadium.go.detail", method = RequestMethod.GET)
	public String basketballStadiumGoDetail(HttpServletRequest req) {
		acDAO.loginCheck(req);
		sdDAO.viewBasketballSeat(req);
		sdDAO.viewBasketballSeatDetail(req);
		req.setAttribute("contentPage", "stadium/basketball/basketball_stadium_detail.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/w_basketball.stadium.go.detail", method = RequestMethod.GET)
	public String wBasketballStadiumGoDetail(HttpServletRequest req) {
		acDAO.loginCheck(req);
		sdDAO.viewBasketballSeat(req);
		sdDAO.viewBasketballSeatDetail(req);
		req.setAttribute("contentPage", "stadium/basketball/w_basketball_stadium_detail.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/volleyball.go", method = RequestMethod.GET)
	public String volleyballGo(HttpServletRequest req) {
		acDAO.loginCheck(req);
		req.setAttribute("contentPage", "stadium/volleyball/volleyball_stadium.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/volleyball2.go", method = RequestMethod.GET)
	public String volleyballGo2(HttpServletRequest req) {
		acDAO.loginCheck(req);
		req.setAttribute("contentPage", "stadium/volleyball/w_volleyball_stadium.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/volleyball.stadium.go.detail", method = RequestMethod.GET)
	public String volleyballStadiumGoDetail(HttpServletRequest req) {
		acDAO.loginCheck(req);
		sdDAO.viewVolleyballSeat(req);
		sdDAO.viewVolleyballSeatDetail(req);
		req.setAttribute("contentPage", "stadium/volleyball/volleyball_stadium_detail.jsp");
		return "index";
	}
	//만든거
	@RequestMapping(value = "/w_volleyball.stadium.go.detail", method = RequestMethod.GET)
	public String wvolleyballStadiumGoDetail(HttpServletRequest req) {
		acDAO.loginCheck(req);
		sdDAO.viewVolleyballSeat(req);
		sdDAO.viewVolleyballSeatDetail(req);
		req.setAttribute("contentPage", "stadium/volleyball/w_volleyball_stadium_detail.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/league.clubList.go", method = RequestMethod.GET)
	public String getLogoBySports(HttpServletRequest req) {
		
		int sports_id = Integer.parseInt(req.getParameter("sports_id"));
		System.out.println(sports_id);
		
		List<ClubImageDTO> clubImages = sdDAO.getLogoBySports(sports_id);
		
		req.setAttribute("clubImages", clubImages);
		req.setAttribute("contentPage", "stadium/stadiumClubList.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/stadium.detail.go", method = RequestMethod.GET)
	public String getStadiumDetail(HttpServletRequest req) {
		
		int club_id = Integer.parseInt(req.getParameter("club_id"));
		System.out.println(club_id);
		
		List<ClubImageDTO> clubImages = adminDAO.getClubImages(club_id);
		
		req.setAttribute("clubImages", clubImages);
		req.setAttribute("contentPage", "stadium/stadiumDetail.jsp");
		return "index";
	}
	
}
