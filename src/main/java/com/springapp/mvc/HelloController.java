package com.springapp.mvc;

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
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/")
public class HelloController {
	private static final Logger logger = LoggerFactory.getLogger(HelloController.class);

	@Autowired
	BoardMapper boardMapper;

	private @Autowired
	ServletContext servletContext;

	@RequestMapping(method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
		model.addAttribute("message", "Hello world!");
		return "hello";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String getMain(ModelMap model,
						  @RequestParam(value = "from",  defaultValue = "0") int from,
						  @RequestParam(value = "size", defaultValue = "15") int size) throws Exception {
		List<Map<String, Object>> boradList;
		List<Map<String, Object>> mallRepuList;
		List<Board> boardList = new ArrayList<Board>();

		List<Board> boardSelect = boardMapper.selectBoardFromTo(from, size);
		Iterator iter = boardSelect.iterator();
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
			if (board.getThumbUrl().length()>0) {
				board.setIsThumbnail("Y");
			}
			board.setDateTime(boardTemp.getDateTime().substring(4,8));
			board.setViewCount(boardTemp.getViewCount());
			board.setSuggestCount(boardTemp.getSuggestCount());
			board.setReplyCount(boardTemp.getReplyCount());

			boardList.add(board);

			logger.info(board.getTitle());
			logger.info(board.getUrl());
			logger.info(board.getDateTime());
			logger.info("==========================================");
		}

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

		return "board_list";
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