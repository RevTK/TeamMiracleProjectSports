package com.tm.nmp.mypage;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.tm.nmp.account.AccountDTO;
import com.tm.nmp.community.ReviewMapper;
import com.tm.nmp.infoEvent.InfoEventMapper;

@Service
public class MyPostDAO {
	
	@Autowired
	private SqlSession ss;

	public void getMyPostAll(HttpServletRequest req, MyPostDTO mpt) {
		
		req.setAttribute("MyPosts", ss.getMapper(MyPageMapper.class).getMyPostAll());
		
	}

	public void getMyPost(HttpServletRequest req, MyPostDTO mp) {
		
		req.setAttribute("MyPost", ss.getMapper(MyPageMapper.class).getMyPost(mp));
		
	}

	public void updateMyPost(HttpServletRequest req, MyPostDTO mp) {
		
		if (ss.getMapper(MyPageMapper.class).updateMyPost(mp) == 1) {
			System.out.println("수정 성공");
		} else {
			System.out.println("수정 실패");
		}
		
	}

	public void deleteMyPost(HttpServletRequest req, MyPostDTO mp) {
		
		if (ss.getMapper(MyPageMapper.class).deleteMyPost(mp) == 1) {
			System.out.println("삭제 성공");
		} else {
			System.out.println("삭제 실패");
		}
		
	}

	public void insertMyPost(HttpServletRequest req, MyPostDTO mp) {
		String path = req.getSession().getServletContext().getRealPath("resources/files/myPostImg");
		MultipartRequest mr = null;
		System.out.println(path);
		
		AccountDTO loginMember = (AccountDTO) req.getSession().getAttribute("loginAccount");
		String mypost_id = loginMember.getAc_id();
		String mypost_nick = loginMember.getAc_nick();
		
		try {
			mr = new MultipartRequest(req, path, 30*1024*1024, "utf-8", new DefaultFileRenamePolicy());
			
			
			String mypost_cat = mr.getParameter("mypost_cat");
			String mypost_title = mr.getParameter("mypost_title");
			String mypost_content = mr.getParameter("mypost_content");
			mypost_content = mypost_content.replace("\r\n", "<br>");
			String mypost_img = mr.getFilesystemName("mypost_img");
			String mypost_video = mr.getFilesystemName("mypost_video");
			int mypost_count = 0;
			
			System.out.println(mypost_id);
			System.out.println(mypost_nick);
			System.out.println(mypost_cat);
			System.out.println(mypost_title);
			System.out.println(mypost_content);
			System.out.println(mypost_img);
			System.out.println(mypost_video);
			System.out.println(mypost_count);
			
			mp.setMypost_id(mypost_id);
			mp.setMypost_nick(mypost_nick);
			mp.setMypost_cat(mypost_cat);
			mp.setMypost_title(mypost_title);
			mp.setMypost_content(mypost_content);
			if(mypost_img != null) {
				mp.setMypost_img(mypost_img);
			}else {
				mp.setMypost_img(" ");
			}
			if(mypost_video != null) {
				mp.setMypost_video(mypost_video);
			}else {
				mp.setMypost_video(" ");
			}
			mp.setMypost_count(mypost_count);
			
			
			
			if(ss.getMapper(MyPageMapper.class).insertMyPost(mp)==1){
				req.setAttribute("r", "등록성공");
			}else {
				req.setAttribute("r", "등록실패");
				
			}
			
		} catch (IOException e) {
			e.printStackTrace();
			String fileName1 = mr.getFilesystemName("mypost_img");
			String fileName2 = mr.getFilesystemName("mypost_vedio");
			new File(path + "/" + fileName1).delete();
			new File(path + "/" + fileName2).delete();
		}
		
	}
	
	

}