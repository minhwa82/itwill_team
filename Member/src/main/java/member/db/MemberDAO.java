package member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
// ctrl + shift + o : 관계없는 import 패키지 자동 정리

public class MemberDAO {
	
	// 공통 변수 선언
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	// 공통 기능 (메서드) 구현
	// 1. DB 연결 - 커넥션풀
	private Connection getCon() throws Exception{
		
		// Context 객체 (Project) 생성
		Context initCTX = new InitialContext(); // 업캐스팅
		
		// DB 정보 연동, context.xml의 name과 동일
		DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/movie"); 
		con = ds.getConnection();		
		return con;
	}
	
	// 2. 자원 해제
	public void closeDB() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
			
	public int loginMember(MemberDTO dto) {
			
		int result = -1;
			
		try {
			// DB 연결
			con = getCon();
				
			sql = "select Mem_pw from member where Mem_id=?"; // 비회원이다.
			PreparedStatement pstmt = con.prepareStatement(sql);
				
			pstmt.setString(1, dto.getMem_id());
				
			ResultSet rs = pstmt.executeQuery();
				
			// 5. 데이터처리
			if(rs.next()) {
				
				if(dto.getMem_pw().equals(rs.getString("Mem_pw"))) {
					//본인		
					result = 1;
				}else {
					// 비밀번호 오류
					result = 0;
				}			
			}else {
				// 비회원(아이디 정보없음)
				result = -1;
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		} 
		
		return result;		
		
	} // loginMember
		
	public void naverJoin(MemberDTO dto) {
		
		int Mem_num = 0;
		
		try {
			con = getCon();
			
			sql = "select max(Mem_num) from member";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				Mem_num = rs.getInt(1)+1;
			}
			
			System.out.println(" DAO : Mem_num = " + Mem_num);
			
			sql = "insert into member(Mem_num,Mem_name,Mem_id,Mem_pw,Mem_phone,Mem_email) "
					+ "values(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, Mem_num);
			pstmt.setString(2, dto.getMem_name());
			pstmt.setString(3, dto.getMem_id());
			pstmt.setString(4, dto.getMem_pw());
			pstmt.setString(5, dto.getMem_phone());
			//pstmt.setDate(6, dto.getMem_birth());
			pstmt.setString(6, dto.getMem_email());
			
			pstmt.executeUpdate();
			
			System.out.println(" DAO : 네이버 회원가입 성공! ");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	// naverJoin(DTO)
	
	// naverLogin(Mem_id, Mem_pw)
	public int naverLogin(String Mem_id, String Mem_pw) {
		
		int result = -1;
		
		try {

			con = getCon();

			sql = "select Mem_pw from member where Mem_id=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, Mem_id);

			rs = pstmt.executeQuery();
			
			// 5. 
			if(rs.next()) {
				
				// 회원일 경우
				if(Mem_pw.equals(rs.getString("mem_pw"))) {
					// 로그인 성공
					result = 1;
				}
			}else {
				// 비회원
				result = -1;
			}
			System.out.println(" DAO : 로그인 체크 = " + result);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
	}
	// memberNaverLogin(mem_id, mem_pw) - 끝
	
	// deleteMember
	public int deleteMember (MemberDTO dto) {
			
		// 0 : 비밀번호 오류 / 1 : 정상적으로 삭제 완료
		int result = -1;
			
		try {
			con = getCon();
				
			sql = "select Mem_pw from member where Mem_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getMem_id());
			
			rs = pstmt.executeQuery();

			System.out.println(dto.getMem_pw());
					
			if(rs.next()) {

				// select 구문으로 가져온 비밀번호와 입력한 비밀번호가 동일한지 비교
				if(dto.getMem_pw().equals(rs.getString("Mem_pw"))) {
					
					sql = "delete from member where Mem_id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, dto.getMem_id());
					result = pstmt.executeUpdate();
					System.out.println(" 회원 탈퇴 성공 ");
				} else {
					// 비밀번호 불일치
					result = 0;	
					System.out.println(" 탈퇴 실패 - 비밀번호 불일치 ");
					}
				} else{
					result = -1;
					System.out.println(" 탈퇴 실패 - 아이디 불일치 ");
				}

		} catch (Exception e) {
			
		} finally {
			closeDB();
		}		
			
		return result;
		
	} // deleteBoard
	
	// getMemberInfo - 등급조회
	public MemberDTO getMemberInfo(String Mem_id){
			
		MemberDTO dto = null;
			
		try {
			con = getCon();
			sql = "select Mem_name,rCount,Mem_id from member "
					+ " where Mem_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, Mem_id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto = new MemberDTO();
				dto.setMem_name(rs.getString("Mem_name")); ;
				dto.setRCount(rs.getInt("rCount"));;
				dto.setMem_id(rs.getString("Mem_id")); ;
				
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
			
		return dto;
		
	} // 등급조회
	
	
	
	

	
	
	
		
} // MemberDAO
