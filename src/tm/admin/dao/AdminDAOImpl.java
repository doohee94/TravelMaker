package tm.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tm.admin.dto.AdminMemberDTO;
import tm.admin.dto.AdminQnaDTO;
import tm.admin.dto.AdminStempDTO;
import tm.admin.dto.AdminadDTO;
import tm.alliance.dto.AllianceDTO;

@Service
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	SqlSessionTemplate ss;
	
	private String namespace = "admin";
	
	
	/****************   페이징 처리  *****************/
	
	public int[] page(int totalcol,int countpage,int pageNum) {
		int[] resultPage = new int[3];
		
		int startNum = 0; // 시작  숫자
		int endNum = 0; // 끝  숫자
		int totalPageNum = 0; // 끝  숫자
		
		//총 페이지수를 계산
		totalPageNum = totalcol/countpage;
		if(totalcol%countpage > 0){
			totalPageNum++;
		}
		
		//불러올 컬럼 번호의 시작값과 끝값을 계산
		endNum = pageNum * countpage;
		startNum = endNum - (countpage-1);
		
		// 0:총 페이지수, 1:시작번호, 2:끝번호
		resultPage[0] = totalPageNum;
		resultPage[1] = startNum;
		resultPage[2] = endNum;
		
		return resultPage;
	}
	/**
	 * SettingPageNum
	 * 역할 : 현재 페이지에 
	 * 총 컬럼 수 와 페이지당 출력하고 싶은 컬럼의 수를 입력받아
	 * 총페이지 수와 시작 rownum값과 끝 rownum값 결과 출력
	 * 인자값 
	 * 멤버 / 광고 / QNA : String table, int countpage, int pageNum, String sel, String con
	 * 제휴 : int type, int countpage, int pageNum, int state, String str
	 * countpage : 페이지당 출력할 컬럼수
	 * pageNum : 현재 페이지 번호
	 *
	 * 리턴값 : int 배열
	 * 0 : 총 페이지 수
	 * 1 : 시작 rownum
	 * 2 : 끝 rownum
	 */
	/**
	 * 멤버 / 광고 / QNA
	 */
	public int[] SettingPageNum(String table, int countpage, int pageNum, String sel, String con){
		//type은 테이블선택자
		int totalcol = 0;
		HashMap map = new HashMap();
		map.put("table", table);
		if(sel != null){
			map.put("sel", sel);
			map.put("con", con);
		}
		if(table.equals("parstemp")){
			totalcol = ss.selectOne(namespace+".stempcnt", map);
		}else if(table.equals("advertisement")){
			totalcol = ss.selectOne(namespace+".adcnt", map);
		}else{
			//테이블의 총 컬럼수를 읽어옴
			totalcol = ss.selectOne(namespace+".cnt", map);
		}
		
		return page(totalcol,countpage,pageNum);
	}
	
	@Override
	public int[] SettingPageNum(int type, int countpage, int pageNum, int state, String str) {
		//테이블의 총 컬럼수를 읽어옴
		int totalcol = 0;
		
		if(state == 1){
			if(str != null){
				HashMap map = new HashMap();
				map.put("partnerComname", str);
				totalcol = ss.selectOne(namespace+".cntparlist",map);
			}else{
				totalcol = ss.selectOne(namespace+".cntparlist");
			}
			
		}else{
			if(str != null){
				HashMap map = new HashMap();
				map.put("partnerComname", str);
				totalcol = ss.selectOne(namespace+".cntparrec",map);
			}else{
				totalcol = ss.selectOne(namespace+".cntparrec");
			}
		}
		
		return page(totalcol,countpage,pageNum);
	}
	
	/****************   회원 처리  *****************/
	
	@Override
	public List<AdminMemberDTO> MemberList() {
		
		List<AdminMemberDTO> list = ss.selectList(namespace+".memberlist");
		
		return list;
	}
	
	@Override
	public List<AdminMemberDTO> MemberList(int startnum, int endnum) {
		HashMap map = new HashMap();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		
		List<AdminMemberDTO> list = ss.selectList(namespace+".memberlist",map);
		
		return list;
	}
	
	@Override
	public AdminMemberDTO Membershow(String id) {
		HashMap map = new HashMap();
		map.put("id", id);
		
		AdminMemberDTO dto = ss.selectOne(namespace+".memberlist",map);
		return dto;
	}
	
	@Override
	public List<AdminMemberDTO> Membersearch(String sel, String con, int startnum, int endnum) {
		HashMap map = new HashMap();
		map.put("sel", sel);
		map.put("con", con);
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		List<AdminMemberDTO> list = ss.selectList(namespace+".memberlist",map);
		
		return list;
	}

	
	/****************   QNA 처리  *****************/
	

	@Override
	public List<AdminQnaDTO> qnalist() {
		List<AdminQnaDTO> list = ss.selectList(namespace+".qnalist");
		return list;
	}
	
	@Override
	public List<AdminQnaDTO> qnalist(int startnum, int endnum) {
		HashMap map = new HashMap();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		
		List<AdminQnaDTO> list = ss.selectList(namespace+".qnalist", map);
		return list;
	}
	
	@Override
	public int qnareply(AdminQnaDTO adminQnaDTO) {
		int res = ss.update(namespace+".reply", adminQnaDTO);
		return res;
	}
	
	/****************   광고 처리  *****************/
	
	@Override
	public List<AdminadDTO> adlist() {
		List<AdminadDTO> list = ss.selectList(namespace + ".adlist");
		return list;
	}
	
	@Override
	public List<AdminadDTO> adlist(int startnum, int endnum) {
		HashMap map = new HashMap();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		
		List<AdminadDTO> list = ss.selectList(namespace + ".adlist", map);
		return list;
	}
	
	@Override
	public List<AdminadDTO> adsearch(int startnum, int endnum, String partnerComname){
		HashMap map = new HashMap();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		map.put("partnerComname", partnerComname);
		
		List<AdminadDTO> list = ss.selectList(namespace + ".adlist", map);
		return list;
	}
	
	@Override
	public int adadinsert(AdminadDTO adminadDTO) {
		//글번호 작성 부분

		// 시퀀스 값을 가져옴
		String num = ss.selectOne(namespace + ".adnumber");

		// 글번호 생성 부분
		// 글번호 앞에 붙일 이름을 설정 후
		String str = "ad";

		// 번호의 길이를 비교후 빈공간에 0을 채우고
		for (int i = 0; i < 8 - num.length(); i++) {
			str += "0";
		}

		// 생성된 번호를 뒤에 붙임
		str += num;

		// 그리고 글번호 부분에 값을 넣어줌
		adminadDTO.setAdNum(str);
		
		int res = ss.insert(namespace + ".adinsert", adminadDTO);
		return res;
	}
	
	@Override
	public int addelete(String adnum) {
		HashMap map = new HashMap();
		map.put("adnum",adnum);
		
		int res = ss.delete(namespace + ".addelete", map);
		return res;
	}
	

	
	
	/****************   스탬프 처리  *****************/
	
	@Override
	public List<AdminStempDTO> stemp() {
		
		return ss.selectList(namespace + ".stemplist");
	}
	
	@Override
	public List<AdminStempDTO> stemp(int startnum, int endnum) {
		HashMap map = new HashMap();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		
		return ss.selectList(namespace + ".stemplist",map);
	}
	
	@Override
	public List<AdminStempDTO> searchstemp(int startnum, int endnum, String partnerName){
		HashMap map = new HashMap();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		map.put("partnerName", partnerName);
		
		return ss.selectList(namespace + ".stemplist",map);
	}

	@Override
	public int insertstemp(AdminStempDTO adminStempDTO){
		// 시퀀스 값을 가져옴
		String num = ss.selectOne(namespace + ".stempnumber");

		// 글번호 생성 부분
		// 글번호 앞에 붙일 이름을 설정 후
		String str = "st";

		// 번호의 길이를 비교후 빈공간에 0을 채우고
		for (int i = 0; i < 8 - num.length(); i++) {
			str += "0";
		}

		// 생성된 번호를 뒤에 붙임
		str += num;

		// 그리고 글번호 부분에 값을 넣어줌
		adminStempDTO.setParstempNum(str);
		
		int res = ss.insert(namespace + ".insertstemp", adminStempDTO);
		
		return res;
	}
	
	
	/****************   제휴 처리  *****************/
	

	@Override
	public List<AllianceDTO> adallist() {
		
		List<AllianceDTO> list = ss.selectList(namespace + ".allist");
		
		return list;
	}
	
	@Override
	public List<AllianceDTO> alsearch(String partnercomname) {
		HashMap map = new HashMap();
		map.put("partnerComname", partnercomname);
		
		List<AllianceDTO> list = ss.selectList(namespace + ".allist", map);
		return list;
	}
	
	
	@Override
	public List<AllianceDTO> alsearch(int startnum, int endnum, String partnercomname) {
		HashMap map = new HashMap();
		map.put("partnerComname", partnercomname);
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		
		List<AllianceDTO> list = ss.selectList(namespace + ".allist", map);
		return list;
	}
	
	@Override
	public List<AllianceDTO> adallist(int startnum, int endnum) {
		
		HashMap map = new HashMap();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		
		List<AllianceDTO> list = ss.selectList(namespace + ".allist", map);
		
		return list;
	}
	
	@Override
	public int allianceDel(String partnernum) {
		
		HashMap map = new HashMap();
		map.put("partnernum", partnernum);
		int cnt = ss.selectOne(namespace + ".cntad", map);
		
		if(cnt > 0 ){
			int resad = ss.delete(namespace + ".addelete", map);
		}
		
		int resal = ss.delete(namespace + ".alliancedel", map);
		
		return resal;
	}
	
	@Override
	public int adminalup(String num) {
		
		HashMap map = new HashMap();
		map.put("partnernum", num);
		int res = ss.update(namespace + ".allianceapproval", map);
		
		return res;
	}
	
	@Override
	public int typeupdate(AllianceDTO allianceDTO) {
		
		int res = ss.update(namespace + ".typeupdate", allianceDTO);
		
		return res;
	}
	
	
	/****************   제휴승인 처리  *****************/
	

	@Override
	public List<AllianceDTO> alsearchRec(int startnum, int endnum, String partnercomname) {
		HashMap map = new HashMap();
		map.put("partnerComname", partnercomname);
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		
		List<AllianceDTO> list = ss.selectList(namespace + ".allistRec", map);
		return list;
	}

	@Override
	public List<AllianceDTO> adallistRec(int startnum, int endnum) {
		
		HashMap map = new HashMap();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		
		List<AllianceDTO> list = ss.selectList(namespace + ".allistRec", map);
		
		return list;
	}

	
	
	
}
