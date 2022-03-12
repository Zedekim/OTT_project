package com.ott.dao;

import java.util.ArrayList;

import com.ott.vo.BoardVO;
import com.ott.vo.CommentVO;
import com.ott.vo.MemberVO;
import com.ott.vo.StarBoardVO;

public class BoardDao extends DBConn {
	/**
	 * Board-delete
	 */
	/*
	 * public int delete(String bid) { int result = 0; String sql =
	 * "delete from cgv_board where bid=?"; getPreparedStatement(sql);
	 * 
	 * try { pstmt.setString(1, bid); result = pstmt.executeUpdate();
	 * 
	 * close(); } catch (Exception e) { e.printStackTrace(); }
	 * 
	 * return result; }
	 */

	/**
	 * Board-update
	 */
	/*
	 * public int update(BoardVO vo) { int result = 0; String sql =
	 * "update cgv_board set btitle=?, bcontent=? where bid=?";
	 * getPreparedStatement(sql);
	 * 
	 * try { pstmt.setString(1, vo.getBtitle()); pstmt.setString(2,
	 * vo.getBcontent()); pstmt.setString(3, vo.getBid());
	 * 
	 * result = pstmt.executeUpdate();
	 * 
	 * close();
	 * 
	 * } catch (Exception e) { e.printStackTrace(); }
	 * 
	 * return result; }
	 */

	/************************************************************************************************
	 * Id-getNick
	 */
	public String getnick(String id) {
		String nick = "";
		String sql = "select mem_nick from ottmember where mem_id=?";
		getPreparedStatement(sql);

		try {
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				nick = rs.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return nick;
	}

	/************************************************************************************************
	 * Board-updateHit
	 */
	public void updateHits(String num) {
		String sql = "update ottboards set board_hit=board_hit+1 where board_num=?";
		getPreparedStatement(sql);

		try {
			pstmt.setString(1, num);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/************************************************************************************************
	 * MyPage-Free-Count
	 */
	public int getMyPageFreeCount(String id) {
		int count = 0;
		String sql = "select count(*)  from ottboards  where mem_id = ?";
		getPreparedStatement(sql);
		try {

			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	/************************************************************************************************
	 * MyPage-Review-Count
	 */
	public int getMyPageReviewCount(String id) {
		int count = 0;
		String sql = "select count(*)  from ottreviewboards  where mem_id = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	/************************************************************************************************
	 * MyPage-Review-Comment-Count
	 */
	public int getMyPageCommentsCount(String id) {
		int count = 0;
		String sql = "select count(*)  from ottcomment  where mem_id = ?";
		getPreparedStatement(sql);
		try {

			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	/************************************************************************************************
	 * PageList-Count
	 */
	/** ReviewBoard **/
	public ArrayList<StarBoardVO> getreviewPageList(int startRow, int endRow) {
		ArrayList<StarBoardVO> list = new ArrayList<StarBoardVO>();
		String sql = "select rno, rboard_num ,rboard_plat,rboard_title, avgscore, mem_id,rboard_date,rboard_hit from"
				+ "	(select rownum rno, rboard_num ,rboard_plat,rboard_title, avgscore, mem_id, to_char(rboard_date,'yyyy-mm-dd') rboard_date,rboard_hit"
				+ "	from (select rboard_num ,rboard_plat, rboard_title, (rboard_pic+rboard_money+rboard_quantity+rboard_kinds+rboard_div)/5 as avgscore,"
				+ "	mem_id, rboard_date, rboard_hit from ottreviewboards order by rboard_date desc)) where rno between ? and ?";
		getPreparedStatement(sql);

		try {
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				StarBoardVO vo = new StarBoardVO();
				vo.setRno(rs.getInt(1));
				vo.setNum(rs.getString(2));
				vo.setPlat(rs.getString(3));
				vo.setTitle(rs.getString(4));
				vo.setScore(rs.getString(5));
				vo.setId(rs.getString(6));
				vo.setDate(rs.getString(7));
				vo.setHit(rs.getInt(8));
				list.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	/************************************************************************************************
	 * Review-PageCount
	 */
	public int getReviewPageCount() {
		int count = 0;
		String sql = "select count(*) from ottreviewboards";
		try {
			getPreparedStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	/** 페이지의 시작값과 끝나는 값을 받아 리스트를 가져옴 **/
	public ArrayList<BoardVO> getPageList(int boardtype, int startRow, int endRow) {
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		String sql = " select rno, board_num ,board_title, mem_id,board_date, board_good, board_bad, board_hit from"
				+ "(select rownum rno, board_num ,board_title, mem_id, to_char(board_date,'yyyy-mm-dd') board_date, board_good, board_bad, board_hit "
				+ " from (select board_num ,board_title, mem_id, board_date, board_good, board_bad, board_hit from ottboards"
				+ " where board_type= ? order by board_date desc)) where rno between ? and ? ";
		getPreparedStatement(sql);

		try {
			pstmt.setInt(1, boardtype);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setRno(rs.getInt(1));
				vo.setNum(rs.getString(2));
				vo.setTitle(rs.getString(3));
				vo.setId(rs.getString(4));
				vo.setDate(rs.getString(5));
				vo.setGood(rs.getInt(6));
				vo.setBad(rs.getInt(7));
				vo.setHit(rs.getInt(8));
				list.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	/** 페이지 카운트 **/
	public int getPageCount(int boardtype) {
		int count = 0;
		String sql = "select count(*) from ottboards where board_type = ? ";
		try {
			getPreparedStatement(sql);
			pstmt.setInt(1, boardtype);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	/************************************************************************************************
	 * Board- select(board-type)
	 * 
	 */
	public ArrayList<BoardVO> select(int board_type) {
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		String sql = " select rownum rno, board_num ,board_title, mem_id, to_char(board_date,'yyyy-mm-dd') board_date, board_good, board_bad, board_hit "
				+ " from (select board_num ,board_title, mem_id, board_date, board_good, board_bad, board_hit from ottboards"
				+ " where board_type=?" + "  order by board_date desc)";
		getPreparedStatement(sql);

		try {
			pstmt.setInt(1, board_type);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setRno(rs.getInt(1));
				vo.setNum(rs.getString(2));
				vo.setTitle(rs.getString(3));
				vo.setId(rs.getString(4));
				vo.setDate(rs.getString(5));
				vo.setGood(rs.getInt(6));
				vo.setBad(rs.getInt(7));
				vo.setHit(rs.getInt(8));

				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	/************************************************************************************************
	 * Mypage-review : select
	 * 
	 */
	public ArrayList<StarBoardVO> getMyPageReviewList(String id, int startRow, int endRow) {
		ArrayList<StarBoardVO> list = new ArrayList<StarBoardVO>();
		String sql = "select rno, rboard_num ,rboard_plat,rboard_title, avgscore, mem_id,rboard_date,rboard_hit from"
				+ "	(select rownum rno, rboard_num ,rboard_plat,rboard_title, avgscore, mem_id, to_char(rboard_date,'yyyy-mm-dd') rboard_date,rboard_hit"
				+ "	from (select rboard_num ,rboard_plat, rboard_title, (rboard_pic+rboard_money+rboard_quantity+rboard_kinds+rboard_div)/5 as avgscore,"
				+ "	mem_id, rboard_date, rboard_hit from ottreviewboards where mem_id = ? order by rboard_date desc)) where rno between ? and ?";

		getPreparedStatement(sql);

		try {
			pstmt.setString(1, id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				StarBoardVO vo = new StarBoardVO();
				vo.setRno(rs.getInt(1));
				vo.setNum(rs.getString(2));
				vo.setPlat(rs.getString(3));
				vo.setScore(rs.getString(4));
				vo.setTitle(rs.getString(5));
				vo.setId(rs.getString(6));
				vo.setDate(rs.getString(7));
				vo.setHit(rs.getInt(8));
				list.add(vo);
			}

			close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	/************************************************************************************************
	 * Board- select(Mypage-my writing)
	 * 
	 */
	public ArrayList<BoardVO> MyBoardselect(String id) {
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		String sql = " select board_num ,board_type, board_title, mem_id, to_char(board_date,'yyyy-mm-dd'), board_hit "
				+ " from ottboards" + " where mem_id=?" + "  order by board_date desc";
		getPreparedStatement(sql);

		try {
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setNum(rs.getString(1));
				vo.setType(rs.getInt(2));
				vo.setTitle(rs.getString(3));
				vo.setId(rs.getString(4));
				vo.setDate(rs.getString(5));
				vo.setHit(rs.getInt(6));

				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	/************************************************************************************************
	 * Board- select(Mypage-my writing)
	 * 
	 */
	public ArrayList<BoardVO> MyBoardselect(String id, int startRow, int endRow) {
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		String sql = "select rno, board_num , board_type, board_title, mem_id, board_date, board_hit from"
				+ "(select rownum rno, board_num , board_type, board_title, mem_id, to_char(board_date,'yyyy-mm-dd') board_date, board_hit "
				+ "from (select board_num, board_type, board_title, mem_id, board_date, board_hit from ottboards"
				+ " where mem_id= ? order by board_date desc)) where rno between ? and ? ";
		getPreparedStatement(sql);

		try {
			pstmt.setString(1, id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setRno(rs.getInt(1));
				vo.setNum(rs.getString(2));
				vo.setType(rs.getInt(3));
				vo.setTitle(rs.getString(4));
				vo.setId(rs.getString(5));
				vo.setDate(rs.getString(6));
				vo.setHit(rs.getInt(7));

				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	/************************************************************************************************
	 * Board-content-select
	 */
	public BoardVO select(String num, String pageName) {

		BoardVO vo = new BoardVO();
		String sql = "select board_title, board_content,to_char(board_date,'yyyy-mm-dd') "
				+ " board_date, board_good, board_bad, board_hit, mem_id from ottboards where board_num = ?";

		getPreparedStatement(sql);

		try {
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo.setTitle(rs.getString(1));
				vo.setContent(rs.getString(2));
				vo.setDate(rs.getString(3));
				vo.setGood(rs.getInt(4));
				vo.setBad(rs.getInt(5));
				vo.setHit(rs.getInt(6));
				vo.setId(rs.getString(7));
			}

			if (pageName.equals("content")) {
				updateHits(num);
			} else {
				/* close(); */
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return vo;
	}

	/************************************************************************************************
	 * StarBoard- select()
	 * 
	 */
	public ArrayList<StarBoardVO> select() {
		ArrayList<StarBoardVO> list = new ArrayList<StarBoardVO>();
		String sql = " select rownum rno, rboard_num ,rboard_title, mem_id, to_char(rboard_date,'yyyy-mm-dd') rboard_date, rboard_Plat, to_char(rboard_score,'9.9') rboard_score, rboard_etc, rboard_good, rboard_bad, rboard_hit "
				+ " from (select rboard_num ,rboard_title, mem_id, rboard_date, rboard_Plat,(rboard_pic+rboard_money+rboard_quantity+rboard_kinds+rboard_div)/5 rboard_score, rboard_etc, rboard_good, rboard_bad, rboard_hit from ottreviewboards"
				+ "  order by rboard_date desc)";
		getPreparedStatement(sql);

		try {
			rs = pstmt.executeQuery();
			while (rs.next()) {
				StarBoardVO vo = new StarBoardVO();
				vo.setRno(rs.getInt(1));
				vo.setNum(rs.getString(2));
				vo.setTitle(rs.getString(3));
				vo.setId(rs.getString(4));
				vo.setDate(rs.getString(5));
				vo.setPlat(rs.getString(6));
				vo.setScore(rs.getString(7));
				vo.setEtc(rs.getString(8));
				vo.setGood(rs.getInt(9));
				vo.setBad(rs.getInt(10));
				vo.setHit(rs.getInt(11));

				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	/************************************************************************************************
	 * StarBoard-content-select
	 */
	public StarBoardVO starContentSelect(String num) {

		StarBoardVO vo = new StarBoardVO();
		String sql = "select rboard_title,mem_id, to_char(rboard_date,'yyyy-mm-dd') "
				+ " rboard_date, rboard_plat, rboard_pic, rboard_money, rboard_quantity, rboard_kinds, rboard_div, rboard_etc, rboard_good, rboard_bad, rboard_hit"
				+ " from ottreviewboards where rboard_num = ?";

		getPreparedStatement(sql);

		try {
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo.setTitle(rs.getString(1));
				vo.setId(rs.getString(2));
				vo.setDate(rs.getString(3));
				vo.setPlat(rs.getString(4));
				vo.setPic(rs.getInt(5));
				vo.setMoney(rs.getInt(6));
				vo.setQuantity(rs.getInt(7));
				vo.setKinds(rs.getInt(8));
				vo.setDiv(rs.getInt(9));
				vo.setEtc(rs.getString(10));
				vo.setGood(rs.getInt(11));
				vo.setBad(rs.getInt(12));
				vo.setHit(rs.getInt(13));
			}
			updateHits(num);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return vo;
	}

	/************************************************************************************************
	 * Board- insert
	 */
	public int insert(BoardVO vo) {
		int result = 0;
		String sql = "insert into ottboards values('b_'||sequ_ott_board.nextval,?,?,?,?,sysdate,null,null,0,0,0)";
		getPreparedStatement(sql);

		try {
			pstmt.setInt(1, vo.getType());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, vo.getId());

			result = pstmt.executeUpdate();

			close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	/************************************************************************************************
	 * StarBoard- insert
	 */
	public int reviewInsert(StarBoardVO vo) {
		int result = 0;
		String sql = "insert into ottreviewboards values('r_'||sequ_ott_review.nextval,?,?,sysdate,?,?,?,?,?,?,?,null,null,null)";
		getPreparedStatement(sql);

		try {
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getId());
			pstmt.setString(3, vo.getPlat());
			pstmt.setInt(4, vo.getPic());
			pstmt.setInt(5, vo.getMoney());
			pstmt.setInt(6, vo.getQuantity());
			pstmt.setInt(7, vo.getKinds());
			pstmt.setInt(8, vo.getDiv());
			pstmt.setString(9, vo.getEtc());

			result = pstmt.executeUpdate();

			close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	/************************************************************************************************
	 * Board- update(BoardVO vo)
	 * 
	 */
	public int update(BoardVO vo) {
		int result = 0;
		String sql = "update ottboards set board_title=?, board_content=? where board_num=?"; // bid媛� �꽆�뼱�솓�굹
																								// board_update_proc.jsp�뿉�꽌
																								// bid李띿뼱蹂닿린
		getPreparedStatement(sql);

		try {
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getNum());

			result = pstmt.executeUpdate();

			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/************************************************************************************************
	 * Board- delete
	 * 
	 */
	public int delete(String sid, String num) {
		// sid = mem_id, num�� vo.getnum()�쓣 怨꾩냽 �꽆寃� �꽆寃� 諛쏆븘�삤湲�
		int result = 0;
		String sql = "delete from ottboards where mem_id=? and board_num=?";
		getPreparedStatement(sql);

		try {
			pstmt.setString(1, sid);
			pstmt.setString(2, num);
			result = pstmt.executeUpdate();

			close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	/************************************************************************************************
	 * Comment-insert
	 */
	public int insert(CommentVO vo) {
		int result = 0;
		String sql = "insert into ottcomment(comm_num, board_num, comm_contents, mem_id, comm_date) values('c_'||sequ_ott_comment.nextval,?,?,?,sysdate)";
		getPreparedStatement(sql);

		try {
			pstmt.setString(1, vo.getBnum());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getId());

			result = pstmt.executeUpdate();

			/* close(); */

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	/************************************************************************************************
	 * Starboard-Comment-insert
	 */
	public int reviewCommentinsert(CommentVO vo) {
		int result = 0;
		String sql = "insert into ottcomment(comm_num, rboard_num, comm_contents, mem_id, comm_date) values('c_'||sequ_ott_comment.nextval,?,?,?,sysdate)";
		getPreparedStatement(sql);

		try {
			pstmt.setString(1, vo.getBnum());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getId());

			result = pstmt.executeUpdate();

			close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	/************************************************************************************************
	 * Board-Comment- select
	 */
	public ArrayList<CommentVO> select(String bnum) {
		ArrayList<CommentVO> clist = new ArrayList<CommentVO>();
		String sql = "select comm_num, comm_contents, mem_id, to_char(comm_date,'yyyy-mm-dd')" + " from ottcomment"
				+ " where board_num=?" + " order by comm_date asc";
		getPreparedStatement(sql);

		try {
			pstmt.setString(1, bnum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CommentVO vo = new CommentVO();
				vo.setNum(rs.getString(1));
				vo.setContent(rs.getString(2));
				vo.setId(rs.getString(3));
				vo.setDate(rs.getString(4));

				clist.add(vo);
				/* close(); */
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return clist;
	}

	/************************************************************************************************
	 * rBoard-Comment- select
	 */
	public ArrayList<CommentVO> reviewBoard_comment_select(String bnum) {
		ArrayList<CommentVO> clist = new ArrayList<CommentVO>();
		String sql = "select comm_num, comm_contents, mem_id, to_char(comm_date,'yyyy-mm-dd')" + " from ottcomment"
				+ " where rboard_num=?" + " order by comm_date asc";
		getPreparedStatement(sql);

		try {
			pstmt.setString(1, bnum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CommentVO vo = new CommentVO();
				vo.setNum(rs.getString(1));
				vo.setContent(rs.getString(2));
				vo.setId(rs.getString(3));
				vo.setDate(rs.getString(4));

				clist.add(vo);
				/* close(); */
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return clist;
	}

	/************************************************************************************************
	 * Comment- select(Mypage-my comment) ///Kim SM, Bae JY
	 */
//	public ArrayList<CommentVO> myCommSelect(String id, int startRow, int endRow) {
//		ArrayList<CommentVO> clist = new ArrayList<CommentVO>();
//		String sql = "select comm_num , mem_id, comm_contents, comm_date from"
//				+ " (select rownum rno, comm_num , mem_id, comm_contents, to_char(comm_date,'yyyy-mm-dd') comm_date "
//				+ " from (select comm_num, mem_id, comm_contents, comm_date from ottcomment"
//				+ " where mem_id= ? order by comm_date desc)) where rno between ? and ? ";
//		getPreparedStatement(sql);
//
//		try {
//			pstmt.setString(1, id);
//			pstmt.setInt(2, startRow);
//			pstmt.setInt(3, endRow);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				CommentVO vo = new CommentVO();
//				vo.setNum(rs.getString(1));
//				vo.setId(rs.getString(2));
//				vo.setContent(rs.getString(3));
//				vo.setDate(rs.getString(4));
//
//				clist.add(vo);
//				/* close(); */
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return clist;
//	}
	public ArrayList<CommentVO> myCommSelect(String id, int startRow, int endRow) {
		ArrayList<CommentVO> clist = new ArrayList<CommentVO>();
		String sql = "select t.* from (select row_number() over (order by c.comm_date desc) as rno, c.comm_num, c.board_num, c.rboard_num, c.comm_contents, c.mem_id, to_char(c.comm_date, 'yyyy-mm-dd'), b.board_title, b.board_type, r.rboard_title"
				+ "	from ottcomment c" + "   left outer join ottboards b on c.board_num = b.board_num"
				+ "   left outer join ottreviewboards r on c.rboard_num = r.rboard_num" + "	where c.mem_id=?"
				+ " order by c.comm_date desc)t where rno between ? and ?";
		getPreparedStatement(sql);

		try {
			pstmt.setString(1, id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CommentVO vo = new CommentVO();
				vo.setRnum(rs.getString(1));
				vo.setNum(rs.getString(2));
				vo.setBnum(rs.getString(3));
				vo.setRnum(rs.getString(4));
				vo.setContent(rs.getString(5));
				vo.setId(rs.getString(6));
				vo.setDate(rs.getString(7));
				vo.setBtitle(rs.getString(8));
				vo.setBtype(rs.getInt(9));
				vo.setRtitle(rs.getString(10));

				clist.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return clist;
	}

	/**
	 * 게시판 게시글 검색
	 */
//	public ArrayList<BoardVO> select_search_freeboard(int board_type, String search_type, String text) {
//		/*
//		 * board_type: 게시판 타입, search_type: 검색조건 ,text: 검색하려고 입력한 값,
//		 */
//		ArrayList<BoardVO> olist = new ArrayList<BoardVO>();
//		String sql = "select rownum rno, board_num ,board_title, mem_id, to_char(board_date,'yyyy-mm-dd') board_date, board_good, board_bad, board_hit "
//				+ " from (select board_num ,board_title, mem_id, board_date, board_good, board_bad, board_hit from ottboards "
//				+ " where board_type= ? and " + search_type + " like ? order by board_date desc)";
//		getPreparedStatement(sql);
//		try {
//			BoardVO vo = new BoardVO();
//			pstmt.setInt(1, board_type);
//			/* pstmt.setString(2, search_type); */
//			pstmt.setString(2, text);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				vo.setRno(rs.getInt(1));
//				vo.setNum(rs.getString(2));
//				vo.setTitle(rs.getString(3));
//				vo.setId(rs.getString(4));
//				vo.setDate(rs.getString(5));
//				vo.setGood(rs.getInt(6));
//				vo.setBad(rs.getInt(7));
//				vo.setHit(rs.getInt(8));
//
//				olist.add(vo);
////				close();
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//			;
//		}
//
//		return olist;
//
//	}

	public ArrayList<BoardVO> select_search_freeboard(int board_type, String search_type, String text, int startRow,
			int endRow) {// 살려줘ㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓ
		// board_type: 게시판 타입, search_type: 검색조건 ,text: 검색하려고 입력한 값,

		ArrayList<BoardVO> olist = new ArrayList<BoardVO>();
		String sql = "select * from (select rownum rno, ottboards.board_num ,ottboards.board_title,ottboards.mem_id, to_char(ottboards.board_date,'yyyy-mm-dd'), ottboards.board_good, ottboards.board_bad, ottboards.board_hit, ottmember.mem_nick"
				+ " from ottmember left outer join ottboards on ottmember.mem_id=ottboards.mem_id"
				+ " where ottboards.board_type= ?  and " + search_type + " like '%' || " + "'" + text + "'"
				+ "|| '%' order by ottboards.board_date desc) where rno between ? and ?";

		getPreparedStatement(sql);
		try {
			BoardVO vo = new BoardVO();
			MemberVO vo1 = new MemberVO();
			/*
			 * if(search_type.equals("mem_id") && search_type != null) { String
			 * invert_mem_id_to_mem_nick = this.getnick(search_type); //아이디 -> 닉네임 변환. 둘다
			 * uq속성이 있어서 가능함. sql=
			 * "select rownum rno, ottboards.board_num ,ottboards.board_title,ottboards.mem_id, ottboards.board_date, ottboards.board_good, ottboards.board_bad, ottboards.board_hit, ottmember.mem_nick"
			 * + " from ottmember, ottboards" + " where ottboards.board_type= ? and" +
			 * invert_mem_id_to_mem_nick + " like " + "'%'" + "?" + "'%'" +
			 * " order by ottboards.board_date desc";
			 * 
			 * }
			 */
			pstmt.setInt(1, board_type);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

//	           pstmt.setString(2, search_type);
			/* pstmt.setString(2, text); */
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo.setRno(rs.getInt(1));
				vo.setNum(rs.getString(2));
				vo.setTitle(rs.getString(3));
				vo.setId(rs.getString(4));
				vo.setDate(rs.getString(5));
				vo.setGood(rs.getInt(6));
				vo.setBad(rs.getInt(7));
				vo.setHit(rs.getInt(8));
				vo1.setNick(rs.getString(8));

				olist.add(vo);
//	             close();
			}

		} catch (Exception e) {
			e.printStackTrace();
			;
		}

		return olist;

	}

	public int count_comment(String cnum) {
		int result = 0;
		String sql = "select count(*) from OTTCOMMENT where board_num =? ";
		getPreparedStatement(sql);

		try {
			pstmt.setString(1, cnum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				result = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
