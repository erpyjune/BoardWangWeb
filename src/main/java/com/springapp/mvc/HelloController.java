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
						  @RequestParam(value = "size", defaultValue = "10") int size) throws Exception {
		List<Map<String, Object>> boradList;
		List<Map<String, Object>> mallRepuList;
		List<Board> productMainDataList = new ArrayList<Board>();

		List<Board> boardList = boardMapper.selectBoardFromTo(from, size);
//		Iterator iter = mainDataAll.iterator();
//		while (iter.hasNext()) {
//			Board board = new Board();
//			board.setTitle((String)entry.get("title"));
//			board.setWriter((String) entry.get("writer"));
//			board.setUrl((String) entry.get("url"));
//			board.setCpName((String) entry.get("cp_name"));
//			board.setImageUrl((String) entry.get("image_url"));
//			board.setImageCount(Integer.parseInt((String)entry.get("image_count")));
//			board.setVideoCount(Integer.parseInt((String) entry.get("video_count")));
//			board.setThumbUrl((String) entry.get("thumb_url"));
//			board.setThumbUrl((String) entry.get("thumb_url"));
//			board.setDateTime((String) entry.get("date"));
//			board.setViewCount(Integer.parseInt((String) entry.get("date")));
//			board.setSuggestCount(Integer.parseInt((String) entry.get("suggest_count")));
//			board.setReplyCount(Integer.parseInt((String) entry.get("reply_count")));
//
//			productMainDataList.add(board);
//
//			logger.info(board.getTitle());
//			logger.info(board.getUrl());
//			logger.info("==========================================");
//		}

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