package com.springapp.mvc;

import com.erpyjune.StdUtils;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
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
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

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

    @RequestMapping(value = "/about", method = RequestMethod.GET)
    public String printAbout(ModelMap model) {
        model.addAttribute("message", "키위토마토닷컴");
        return "r2/about";
    }


    //////////////////////////////////////////////////////////////////////////////////
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
         * make key
         */
        String key = "list_" + decodeCpName + dateOpt + sortField + from + size;

        // get data from redis
        Service service = new Service();
        ObjectMapper jsonMapper = new ObjectMapper();
        List<Board> boardList=null;
        String datas;
        Jedis jedis = null;
        JedisPool pool = new JedisPool(new JedisPoolConfig(), "www.kiwitomato.com");
        try {
            jedis = pool.getResource();
            datas = jedis.get(key);
            if (datas==null) {
                List<Board> recencyBoardList = service.selectService(decodeCpName, dateOpt, sortField, from, size, boardMapper);
                boardList = service.makeBoardIterator(recencyBoardList.iterator());
                String jsonResults = jsonMapper.writeValueAsString(boardList);
                jedis.set(key, jsonResults);
                jedis.expire(key, 60 * 3);
                System.out.println(">>> make json");
            }
            else {
                boardList = service.makeBoardFromJson(datas);
                System.out.println(">>> get json");
            }
        } catch (Exception e) {
            System.out.println(Arrays.toString(e.getStackTrace()));
        } finally {
            if (jedis!=null) jedis.close();
            pool.destroy();
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
        model.addAttribute("cp", decodeCpName);
        model.addAttribute("date_opt", dateOpt);
        model.addAttribute("sort", sortField);

        return "r2/board_list";
    }



    /////////////////////////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping(value = "/main",method = RequestMethod.GET)
    public String getMainPage(ModelMap model,
                              @RequestParam(value = "from",  defaultValue = "0") int from,
                              @RequestParam(value = "size",  defaultValue = "15") int size,
                              @RequestParam(value = "cp",    defaultValue = "") String cpName,
                              @RequestParam(value = "date_opt",    defaultValue = "") String dateOpt,
                              @RequestParam(value = "sort",    defaultValue = "") String sortField,
                              @RequestParam(value = "how",    defaultValue = "") String how) throws Exception
    {

        Service service = new Service();
        Map<String, List<Board>> resultMap=null;



        /**
         * if sort is null --> reply
         */
        if (sortField.trim().length()==0) {
            sortField = "reply";
        }

        /**
         * get data
         */
        resultMap = service.getDataMain(from, sortField, boardMapper);


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
        model.addAttribute("boradListA", resultMap.get("boradListA"));
        model.addAttribute("boradListB", resultMap.get("boradListB"));
        model.addAttribute("boradListC", resultMap.get("boradListC"));
        model.addAttribute("boradListD", resultMap.get("boradListD"));
        model.addAttribute("boradListE", resultMap.get("boradListE"));
        model.addAttribute("boradListF", resultMap.get("boradListF"));
        model.addAttribute("boradListG", resultMap.get("boradListG"));

        model.addAttribute("title", "보드왕");
        model.addAttribute("prevFrom", prevFrom);
        model.addAttribute("nextFrom", nextFrom);
        model.addAttribute("size", size);
        model.addAttribute("from", from);
        model.addAttribute("cp", cpName);

        model.addAttribute("date_opt", dateOpt);
        model.addAttribute("sort", sortField);

        return "r2/board_main";
    }



    ////////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping(value = "/test", method = RequestMethod.GET)
    public String getTest(
            ModelMap model,
            @RequestParam(value = "from",  defaultValue = "0") int from,
            @RequestParam(value = "size",  defaultValue = "15") int size,
            @RequestParam(value = "cp",    defaultValue = "") String cpName,
            @RequestParam(value = "date_opt",    defaultValue = "") String dateOpt,
            @RequestParam(value = "sort",    defaultValue = "") String sortField
    ) throws Exception {

        Service service = new Service();

        /**
         * json object mapper
         */
        ObjectMapper jsonMapper = new ObjectMapper();

        /**
         * decode cp name
         */
        String decodeCpName = URLDecoder.decode(cpName, "utf-8");

        /**
         * make key
         */
        String key = String.format("list_%s_%s_%s_%d_%s", decodeCpName, dateOpt, sortField, from, size);

        //////////////////////////////////////////////////////////////////////
        // get data from redis
        List<Board> recencyBoardList;
        List<Board> boardList=null;
        String datas;
        String jsonResults;
        Jedis jedis = null;
        JedisPool pool = new JedisPool(new JedisPoolConfig(), "www.kiwitomato.com");
        try {
            jedis = pool.getResource();
            datas = jedis.get(key);
            if (datas==null) {
                recencyBoardList = service.selectService(decodeCpName, dateOpt, sortField,from,size,boardMapper);
                boardList = service.makeBoardIterator(recencyBoardList.iterator());

                jsonResults = jsonMapper.writeValueAsString(boardList);

                jedis.set(key, jsonResults);
                jedis.expire(key, 60 * 3);
                logger.info("cache hit [" + key + "]");
            }
            else {
                boardList = service.makeBoardFromJson(datas);
            }
        } catch (Exception e) {
            System.out.println(Arrays.toString(e.getStackTrace()));
        } finally {
            if (jedis!=null) jedis.close();
            pool.destroy();
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
        model.addAttribute("cp", decodeCpName);
        model.addAttribute("date_opt", dateOpt);
        model.addAttribute("sort", sortField);

        return "r2/board_list";
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