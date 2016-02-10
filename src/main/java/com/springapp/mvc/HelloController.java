package com.springapp.mvc;

import com.erpyjune.StdUtils;
import com.springapp.mvc.data.Board;
import com.springapp.mvc.mapper.BoardMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletContext;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.*;

@Controller
@RequestMapping("/")
public class HelloController {
	private static final Logger logger = LoggerFactory.getLogger(HelloController.class);

	@Autowired
	BoardMapper boardMapper;

	private @Autowired
	ServletContext servletContext;

	/**
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
		model.addAttribute("message", "Hello world!");
		return "hello";
	}

	/**
	 *
	 * @param opt
	 * @return
	 * @throws Exception
	 */
	private Map<String, String> getDateTimeOption(String opt) throws Exception {
		StdUtils stdUtils = new StdUtils();
		String currDateTime="";
		String beforeDateTime="";
		Map<String, String> map = new HashMap<String, String>();

		if ("1hour".equals(opt)) {
			currDateTime = stdUtils.getCurrDateTimeString().substring(0,12);
			beforeDateTime = stdUtils.getHourBeforeAfterString(-1).substring(0,12);
		} else if ("3hour".equals(opt)) {
			currDateTime = stdUtils.getCurrDateTimeString().substring(0,12);
			beforeDateTime = stdUtils.getHourBeforeAfterString(-3).substring(0,12);
		} else if ("6hour".equals(opt)) {
			currDateTime = stdUtils.getCurrDateTimeString().substring(0,12);
			beforeDateTime = stdUtils.getHourBeforeAfterString(-6).substring(0,12);
		} else if ("12hour".equals(opt)) {
			currDateTime = stdUtils.getCurrDateTimeString().substring(0,12);
			beforeDateTime = stdUtils.getHourBeforeAfterString(-12).substring(0,12);
		} else if ("24hour".equals(opt)) {
			currDateTime = stdUtils.getCurrDateTimeString().substring(0,12);
			beforeDateTime = stdUtils.getHourBeforeAfterString(-24).substring(0,12);
		} else if ("30min".equals(opt)) {
			currDateTime = stdUtils.getCurrDateTimeString().substring(0,12);
			beforeDateTime = stdUtils.getMinutesBeforeAfterString(-30).substring(0,12);
		} else {
			currDateTime = "";
			beforeDateTime = "";
		}

		logger.info(" start date [" + beforeDateTime + "]");
		logger.info(" end   date [" + currDateTime + "]");

		map.put("start", beforeDateTime);
		map.put("end", currDateTime);

		return map;
	}

	/**
	 *
	 * @param cpName
	 * @param dateOpt
	 * @param sortField
	 * @param from
	 * @param size
	 * @return
	 * @throws Exception
	 */
	private List<Board> selectService(String cpName, String dateOpt, String sortField, int from, int size) throws Exception {
		String startDateTime="", endDateTime="";
		List<Board> boardList=null;
		Map<String, String> dateMap=null;

		if (dateOpt.trim().length()>0) {
			dateMap = getDateTimeOption(dateOpt);
			startDateTime = dateMap.get("start");
			endDateTime = dateMap.get("end");

			if (startDateTime.length()==0 || endDateTime.length()==0) {
				dateOpt="";
			}
		}

		if (cpName.length()==0) {
			if ("reply".equals(sortField) && dateOpt.length()>0) {
				boardList = boardMapper.selectDateBetweenReplyCountBoard(startDateTime, endDateTime, from, size);
				logger.info(" sort : reply");
			} else if ("view".equals(sortField) && dateOpt.length()>0){
				boardList = boardMapper.selectDateBetweenViewCountBoard(startDateTime, endDateTime, from, size);
				logger.info(" sort : view");
			} else if ("suggest".equals(sortField) && dateOpt.length()>0){
				boardList = boardMapper.selectDateBetweenSuggestCountBoard(startDateTime, endDateTime, from, size);
				logger.info(" sort : suggest");
			} else {
				boardList = boardMapper.selectBoardFromTo(from, size);
				logger.info(" sort : not");
			}
		} else {
			boardList = boardMapper.selectCpNameBoardFromTo(cpName, from, size);
			logger.info(" cp [" + cpName + "]");
		}

		return boardList;
	}

	/**
	 *
	 * @param iter
	 * @return
	 * @throws Exception
	 */
	private List<Board> makeBoardIterator(Iterator iter) throws Exception {
		String tempStr;
		List<Board> boardList = new ArrayList<>();

		while (iter.hasNext()) {
			Board board = new Board();
			Board boardTemp = (Board)iter.next();

			board.setTitle(boardTemp.getTitle());
			board.setWriter(boardTemp.getWriter());
			board.setUrl(boardTemp.getUrl());
			board.setCpName(boardTemp.getCpName());
			board.setCpNameDisplay(boardTemp.getCpNameDisplay());
			board.setImageUrl(boardTemp.getImageUrl());
			board.setImageCount(boardTemp.getImageCount());
			board.setVideoCount(boardTemp.getVideoCount());
			board.setThumbUrl(boardTemp.getThumbUrl());
			if (boardTemp.getDateTime().length()>=12) {
				tempStr = String.format("%s-%s-%s %s:%s",
						boardTemp.getDateTime().substring(0, 4),
						boardTemp.getDateTime().substring(4, 6),
						boardTemp.getDateTime().substring(6, 8),
						boardTemp.getDateTime().substring(8, 10),
						boardTemp.getDateTime().substring(10, 12));
				board.setDateTime(tempStr);
			}
			board.setViewCount(boardTemp.getViewCount());
			board.setSuggestCount(boardTemp.getSuggestCount());
			board.setReplyCount(boardTemp.getReplyCount());

			boardList.add(board);

			logger.info(board.getTitle());
			logger.info(board.getUrl());
			logger.info("==========================================");
		}

		return boardList;
	}

	/**
	 *
	 * @param model
	 * @param from
	 * @param size
	 * @param cpName
	 * @param dateOpt
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String getList(
			              ModelMap model,
						  @RequestParam(value = "from",  defaultValue = "0") int from,
						  @RequestParam(value = "size",  defaultValue = "15") int size,
						  @RequestParam(value = "cp",    defaultValue = "") String cpName,
						  @RequestParam(value = "date_opt",    defaultValue = "") String dateOpt,
						  @RequestParam(value = "sort",    defaultValue = "") String sortField
	) throws Exception {

		/**
		 * decode cp name
		 */
		String decodeCpName = URLDecoder.decode(cpName, "utf-8");


		/**
		 * select SQL
		 */
		List<Board> recencyBoardList = selectService(decodeCpName,dateOpt,sortField,from, size);
		List<Board> boardList = makeBoardIterator(recencyBoardList.iterator());


		/**
		 * page 계산
		 */
		int prevFrom=0;
		if (from > 0) {
			prevFrom = from - size;
			if (prevFrom < 0) prevFrom = 0;
		} else {
			prevFrom = 0;
		}

		int nextFrom=0;
		nextFrom = from + size;

		/**
		 * model data
		 */
		model.addAttribute("boardList", boardList);
		model.addAttribute("title", "BoardWang !!!");
		model.addAttribute("prevFrom", prevFrom);
		model.addAttribute("nextFrom", nextFrom);
		model.addAttribute("size", size);
		model.addAttribute("from", from);
		model.addAttribute("cp", decodeCpName);
		model.addAttribute("date_opt", dateOpt);
		model.addAttribute("sort", sortField);

		return "board_list";
	}


	/**
	 *
	 * @param model
	 * @param from
	 * @param size
	 * @param cpName
	 * @param dateOpt
	 * @param sortField
	 * @param how
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String getMainPage(ModelMap model,
						  @RequestParam(value = "from",  defaultValue = "0") int from,
						  @RequestParam(value = "size",  defaultValue = "15") int size,
						  @RequestParam(value = "cp",    defaultValue = "") String cpName,
						  @RequestParam(value = "date_opt",    defaultValue = "") String dateOpt,
						  @RequestParam(value = "sort",    defaultValue = "") String sortField,
						  @RequestParam(value = "how",    defaultValue = "") String how) throws Exception {

		Map<String, String> dateMap=null;
		List<Board> tempList=null;
		List<Board> boradListA=null;
		List<Board> boradListB=null;
		List<Board> boradListC=null;


		/**
		 * select recency sql
		 */
		tempList = boardMapper.selectBoardFromTo(from, 7);
		boradListA = makeBoardIterator(tempList.iterator());

		/**
		 * 최신 reply 30분
		 */
		dateMap = getDateTimeOption("30min");
		tempList = boardMapper.selectDateBetweenReplyCountBoard(dateMap.get("start"), dateMap.get("end"), from, 7);
		boradListB = makeBoardIterator(tempList.iterator());
		logger.info(String.format(" 최신 1시간 start[%s], end[%s]", dateMap.get("start"), dateMap.get("end")));

		/**
		 * 최신 reply 3시간
		 */
		dateMap = getDateTimeOption("3hour");
		tempList = boardMapper.selectDateBetweenReplyCountBoard(dateMap.get("start"), dateMap.get("end"), from, 7);
		boradListC = makeBoardIterator(tempList.iterator());
		logger.info(String.format(" 최신 3시간 start[%s], end[%s]", dateMap.get("start"), dateMap.get("end")));


		/**
		 * page 계산
		 */
		int prevFrom=0;
		if (from > 0) {
			prevFrom = from - size;
			if (prevFrom < 0) prevFrom = 0;
		} else {
			prevFrom = 0;
		}

		int nextFrom=0;
		nextFrom = from + size;

		/**
		 * model data
		 */
		model.addAttribute("boradListA", boradListA);
		model.addAttribute("boradListB", boradListB);
		model.addAttribute("boradListC", boradListC);

		model.addAttribute("boradListAcount", boradListA.size());
		model.addAttribute("boradListBcount", boradListB.size());
		model.addAttribute("boradListCcount", boradListC.size());

		model.addAttribute("title", "보드왕");
		model.addAttribute("prevFrom", prevFrom);
		model.addAttribute("nextFrom", nextFrom);
		model.addAttribute("size", size);
		model.addAttribute("from", from);
		model.addAttribute("cp", cpName);

		model.addAttribute("date_opt", dateOpt);
		model.addAttribute("sort", sortField);

		return "board_main";
	}


//	@RequestMapping(value = "/get.json", method = RequestMethod.GET)
//	@ResponseBody
//	public List<ProductMainData> getData(ModelMap model,
//										 @RequestParam(value = "from",  defaultValue = "0") int from,
//										 @RequestParam(value = "count", defaultValue = "10") int count) throws Exception {
//		List<Map<String, Object>> blogExtList;
//		List<Map<String, Object>> mallRepuList;
//		List<ProductMainData> productMainDataList = new ArrayList<ProductMainData>();
//
//		List<Map<String, Object>> mainDataAll = copyKingMapper.selectMainDataPage(from, count);
//		for (Map<String, Object> history : mainDataAll) {
//			ProductMainData productMainData = new ProductMainData();
//			productMainData.setProductId((String)history.get("product_id"));
//			productMainData.setProductName((String) history.get("product_name"));
//			productMainData.setProductUrl((String) history.get("product_url"));
//			productMainData.setThumbUrl((String) history.get("thumb_url"));
//			productMainData.setSpec1((String) history.get("spec1"));
//			productMainData.setSpec2((String) history.get("spec2"));
//			productMainData.setSeedUrl((String) history.get("seed_url"));
//			productMainData.setCategoryName((String) history.get("category"));
//
//			/// get blog ext data
//			blogExtList = copyKingMapper.selectBlogList(productMainData.getProductId());
//			List<BlogExtBodyData> blogList = new ArrayList<BlogExtBodyData>();
//			for (Map<String, Object> blogData : blogExtList) {
//				BlogExtBodyData blogExtBodyData = new BlogExtBodyData();
//				blogExtBodyData.setProductId(productMainData.getProductId());
//				blogExtBodyData.setPostImageUrl((String)blogData.get("post_image_url"));
//				blogExtBodyData.setPostTitle((String)blogData.get("post_title"));
//				blogExtBodyData.setPostDesc((String) blogData.get("post_desc"));
//				blogExtBodyData.setPostAuthor((String) blogData.get("post_author"));
//				blogExtBodyData.setPostUrl((String) blogData.get("post_url"));
//				blogList.add(blogExtBodyData);
//			}
//
//			// == get shopping mall reputation
//			mallRepuList = copyKingMapper.selectRepuList(productMainData.getProductId());
//			List<ReputationData> reputationDatas = new ArrayList<ReputationData>();
//			for (Map<String, Object> repuData : mallRepuList) {
//				ReputationData reputationData = new ReputationData();
//				reputationData.setProductId((String)repuData.get("product_id"));
//				reputationData.setMallName((String) repuData.get("mall_name"));
//				reputationData.setRepuData((String) repuData.get("reputation"));
//				reputationData.setRepuUrl((String) repuData.get("url"));
//				reputationDatas.add(reputationData);
//			}
//
//			// set blog ext data
//			productMainData.setBlogExtBodyList(blogList);
//			// set reputation data
//			productMainData.setReputationDataList(reputationDatas);
//			productMainDataList.add(productMainData);
//
//			logger.info(productMainData.getProductName());
//			logger.info(productMainData.getProductUrl());
//			logger.info("==========================================");
//		}
//
//		model.addAttribute("productList", productMainDataList);
//		model.addAttribute("message", "CopyWangTest !!!");
//
//		return productMainDataList;
//	}
}