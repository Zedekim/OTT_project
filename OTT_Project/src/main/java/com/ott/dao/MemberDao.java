package com.ott.dao;

import java.util.ArrayList;

import com.ott.vo.MemberVO;

public class MemberDao extends DBConn {

	/* 회占쏙옙占쏙옙占쏙옙 */
	public int insert(MemberVO vo) {
		int result = 0;
		String sql = "insert into ottmember values(?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate,0,null)";
		getPreparedStatement(sql);

		try {
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPass());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getNick());
			pstmt.setString(5, vo.getGender());
			pstmt.setString(6, vo.getTel());
			pstmt.setString(7, vo.getHp1());
			pstmt.setString(8, vo.getHp2());
			pstmt.setString(9, vo.getHp3());
			pstmt.setString(10, vo.getEmail1());
			pstmt.setString(11, vo.getEmail2());
			pstmt.setString(12, vo.getQuestion());
			pstmt.setString(13, vo.getAnswer());

			result = pstmt.executeUpdate();

			close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	/** 濡쒓렇�씤 �떆 李⑤떒�뿬遺� �솗�씤 **/
	public int logindropcheck() {
		// System.out.println("�븿�닔�떎�뻾");
		int result = 0;
		String sql = " select mem_id from ottmember ";
		MemberVO vo = new MemberVO();
		getPreparedStatement(sql);

		try {
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo.setBlock(rs.getInt(1));
				result = vo.getBlock();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		/*
		 * for(int i=0;i<list.size();i++) { System.out.println(list.get(i).getId()); }
		 */
		return result;
	}

	/** �븘�씠�뵒媛��졇�샂 **/
	public ArrayList<MemberVO> idselect() {
		// System.out.println("�븿�닔�떎�뻾");
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		String sql = " select mem_id from ottmember ";

		getPreparedStatement(sql);

		try {
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setId(rs.getString(1));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		/*
		 * for(int i=0;i<list.size();i++) { System.out.println(list.get(i).getId()); }
		 */
		return list;
	}

	/** �깉�눜DB�뿉�꽌 �븘�씠�뵒媛��졇�샂 **/
	public ArrayList<MemberVO> dropidselect() {

		// System.out.println("�븿�닔�떎�뻾");
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		String sql = " select drop_mem_id from ottdropmember ";

		getPreparedStatement(sql);

		try {
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setDropid(rs.getString(1));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		/*
		 * for(int i=0;i<list.size();i++) { System.out.println(list.get(i).getDropid());
		 * }
		 */
		return list;
	}

	/** �땳�꽕�엫媛��졇�샂 **/
	public ArrayList<MemberVO> nickselect() {
		// System.out.println("�븿�닔�떎�뻾");
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		String sql = " select mem_nick from ottmember ";

		getPreparedStatement(sql);

		try {
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setNick(rs.getString(1));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		/*
		 * for(int i=0;i<list.size();i++) { System.out.println(list.get(i).getNick()); }
		 */
		return list;
	}

	/** mypage-info-update-nick Check **/
	public ArrayList<MemberVO> nickselect(String sid) {
		// System.out.println("�븿�닔�떎�뻾");
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		String sql = " select mem_nick from ottmember where mem_id != ?";

		getPreparedStatement(sql);

		try {
			pstmt.setString(1, sid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setNick(rs.getString(1));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		/*
		 * for(int i=0;i<list.size();i++) { System.out.println(list.get(i).getNick()); }
		 */
		return list;
	}

	/** �쟾�솕踰덊샇媛��졇�샂 **/
	public ArrayList<MemberVO> hpselect() {
		// System.out.println("�븿�닔�떎�뻾");
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		String sql = " select mem_hp1 || '-' || mem_hp2 || '-' || mem_hp3 from ottmember ";

		getPreparedStatement(sql);

		try {
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setHp1(rs.getString(1));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		/*
		 * for(int i=0;i<list.size();i++) { System.out.println(list.get(i).getHp1()); }
		 */
		return list;
	}

	/** mypage-info-update-nick Check **/
	public ArrayList<MemberVO> hpselect(String sid) {
		// System.out.println("�븿�닔�떎�뻾");
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		String sql = " select mem_hp1 || '-' || mem_hp2 || '-' || mem_hp3 from ottmember where !=?";

		getPreparedStatement(sql);

		try {
			pstmt.setString(1, sid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setHp1(rs.getString(1));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		/*
		 * for(int i=0;i<list.size();i++) { System.out.println(list.get(i).getHp1()); }
		 */
		return list;
	}

	/* 占싸깍옙占쏙옙 */
	public int getLoginResult(MemberVO vo) {
		int result = 0;
		String sql = "select count(*) from ottmember where mem_id=? and mem_pass=?"; // 占쏙옙占싱듸옙,占싻쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占싹몌옙
																						// 1占싱띰옙占� 占쏙옙占쏙옙占� 占쏙옙占쏙옙 <-->0
		getPreparedStatement(sql);

		try {
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPass());

			rs = pstmt.executeQuery();
			while (rs.next()) {
				result = rs.getInt(1); // count占쏙옙 1占쏙옙占쏙옙?
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	/* 탈퇴db로 정보 옮기기 */
	public int dropinsert(MemberVO vo) {
		int result = 0;
		// String sql = "insert into ottdropmember
		// values(?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate,0,null)";

		String sql = "insert into ottdropmember(drop_mem_id, drop_mem_pass, drop_mem_name, "
				+ " drop_mem_gender, drop_mem_email1, drop_mem_email2, drop_mem_hp1,drop_mem_hp2, drop_mem_hp3) "
				+ " select mem_id, mem_pass, mem_name, mem_gender, "
				+ " mem_email1, mem_email2, mem_hp1, mem_hp2, mem_hp3 from ottmember " + " where mem_id=?";
		// 이름,아이디,비밀번호,이메일,전화번호,성별,탈퇴사유만

		getPreparedStatement(sql);
		try {
			// System.out.print(vo.getId());
			pstmt.setString(1, vo.getId());

			result = pstmt.executeUpdate();

			// close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public int dropdelete(MemberVO vo) {
		// sid = mem_id, num은 vo.getnum()을 계속 넘겨 넘겨 받아오기
		int result = 0;
		String sql = "delete from ottmember where mem_id=?";
		getPreparedStatement(sql);

		try {
			/* System.out.println(vo.getId()); */
			pstmt.setString(1, vo.getId());
			result = pstmt.executeUpdate();

			close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	/**
	 * Mypage-myinfo: select
	 */
	public MemberVO myInfoSelect(String id) {
		MemberVO vo = new MemberVO();
		String sql = "select mem_id, mem_pass, mem_name, mem_nick, mem_tel, mem_hp1, mem_hp2, mem_hp3"
				+ ", mem_email1, mem_email2 from ottmember where mem_id=?";

		getPreparedStatement(sql);
		try {
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo.setId(rs.getString(1));
				vo.setPass(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setNick(rs.getString(4));
				vo.setTel(rs.getString(5));
				vo.setHp1(rs.getString(6));
				vo.setHp2(rs.getString(7));
				vo.setHp3(rs.getString(8));
				vo.setEmail1(rs.getString(9));
				vo.setEmail2(rs.getString(10));
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return vo;
	}

	/**
	 * Mypage-myinfo: update
	 */
	public int myInfoUpdate(MemberVO vo) {
		int result = 0;
		String sql = "update ottmember set mem_name=?, mem_nick=?, mem_tel=?, mem_hp1=?, mem_hp2=?, mem_hp3=?, mem_email1=?, mem_email2=? where mem_id=?";

		getPreparedStatement(sql);
		try {

			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getNick());
			pstmt.setString(3, vo.getTel());
			pstmt.setString(4, vo.getHp1());
			pstmt.setString(5, vo.getHp2());
			pstmt.setString(6, vo.getHp3());
			pstmt.setString(7, vo.getEmail1());
			pstmt.setString(8, vo.getEmail2());
			pstmt.setString(9, vo.getId());

			result = pstmt.executeUpdate();

			close();

		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;

	}

	/**
	 * adminpage-userInfo: select
	 */
	public ArrayList<MemberVO> userSelect() {
		// System.out.println("�븿�닔�떎�뻾");
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		String sql = " select mem_id, mem_name, mem_nick, mem_tel, mem_hp1, mem_hp2, mem_hp3, mem_date, mem_block from ottmember order by mem_date desc";

		getPreparedStatement(sql);

		try {
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setId(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setNick(rs.getString(3));
				vo.setTel(rs.getString(4));
				vo.setHp1(rs.getString(5));
				vo.setHp2(rs.getString(6));
				vo.setHp3(rs.getString(7));
				vo.setDate(rs.getString(8));
				vo.setBlock(rs.getInt(9));

				list.add(vo);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		/*
		 * for(int i=0;i<list.size();i++) { System.out.println(list.get(i).getHp1()); }
		 */
		return list;
	}
}
