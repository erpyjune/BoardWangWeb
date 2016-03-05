package com.springapp.mvc;

import com.erpyjune.StdUtils;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.springapp.mvc.data.Board;
import com.springapp.mvc.mapper.BoardMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

import java.util.*;

/**
 * Created by erpy on 16. 3. 5..
 */
public class Service {
    private static final Logger logger = LoggerFactory.getLogger(Service.class);

    ////////////////////////////////////////////////////////////////////////////////////
    public List<Board> makeBoardIterator(Iterator iter) throws Exception {
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



    ////////////////////////////////////////////////////////////////////////////////////
    public List<Board> makeBoardFromJson(String json) throws Exception {
        List<Board> boardList = new ArrayList<>();
        ObjectMapper mapper = new ObjectMapper();
        JsonNode datas = mapper.readTree(json);

        for (JsonNode node : datas) {
            Board board = new Board();
            board.setTitle(node.path("title").asText());
            board.setWriter(node.path("writer").asText());
            board.setUrl(node.path("url").asText());
            board.setCpName(node.path("cpName").asText());
            board.setCpNameDisplay(node.path("cpNameDisplay").asText());
            board.setImageUrl(node.path("imageUrl").asText());
            board.setImageCount(Integer.parseInt(node.path("imageCount").asText()));
            board.setVideoCount(Integer.parseInt(node.path("videoCount").asText()));
            board.setThumbUrl(node.path("thumbUrl").asText());
            board.setDateTime(node.path("dateTime").asText());
            board.setViewCount(Integer.parseInt(node.path("viewCount").asText()));
            board.setSuggestCount(Integer.parseInt(node.path("suggestCount").asText()));
            board.setReplyCount(Integer.parseInt(node.path("replyCount").asText()));
            board.setIsThumbnail(node.path("isThumbnail").asText());
            boardList.add(board);

            logger.info(board.getTitle());
            logger.info(board.getUrl());
            logger.info("==========================================");
        }

        return boardList;
    }



    ////////////////////////////////////////////////////////////////////////////////////
    public List<Board> selectService(String cpName, String dateOpt, String sortField, int from, int size, BoardMapper boardMapper) throws Exception {
        String startDateTime="", endDateTime="";
        List<Board> boardList;
        Map<String, String> dateMap;

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
            } else if ("interest".equals(sortField) && dateOpt.length()>0){
                boardList = boardMapper.selectDateBetweenInterestBoard(startDateTime, endDateTime, from, size);
                logger.info(" sort : suggest");
            } else if ("recency".equals(sortField) && dateOpt.length()>0) {
                boardList = boardMapper.selectBoardFromTo(from, size);
                logger.info(" sort : recency");
            } else {
                boardList = boardMapper.selectBoardFromTo(from, size);
                logger.info(" sort : recency");
            }
        } else {
            boardList = boardMapper.selectCpNameBoardFromTo(cpName, from, size);
            logger.info(" cp [" + cpName + "]");
        }

        return boardList;
    }



    ////////////////////////////////////////////////////////////////////////////////////
    public Map<String, String> getDateTimeOption(String opt) throws Exception {
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



    ////////////////////////////////////////////////////////////////////////////////////
    private List<Board> getDataList(String time, String sortField, int from, int size, BoardMapper boardMapper) throws Exception {
        String key;
        String datas, jsonResults;
        Jedis jedis = null;
        JedisPool pool = new JedisPool(new JedisPoolConfig(), "www.kiwitomato.com");
        List<Board> tempList, boardList;
        Map<String, String> dateMap;

        if (sortField==null) sortField = "";
        if (time==null) time="";

        key = String.format("main_%s_%s_%d_%d", time, sortField, from, size);

        jedis = pool.getResource();
        datas = jedis.get(key);
        if (datas!=null) {
            jedis.close();
            pool.destroy();
            logger.info("cache hit [" + key + "]");
            return makeBoardFromJson(datas);
        }

        if (time.length()==0 || sortField.length() == 0) {
            jedis = pool.getResource();
            datas = jedis.get(key);

            tempList = boardMapper.selectBoardFromTo(from, size);
            boardList = makeBoardIterator(tempList.iterator());
        }
        else {
            dateMap = getDateTimeOption(time);
            if ("suggest".equals(sortField)) {
                tempList = boardMapper.selectDateBetweenSuggestCountBoard(dateMap.get("start"), dateMap.get("end"), from, size);
            } else if ("view".equals(sortField)) {
                tempList = boardMapper.selectDateBetweenViewCountBoard(dateMap.get("start"), dateMap.get("end"), from, size);
            } else if ("interest".equals(sortField)) {
                tempList = boardMapper.selectDateBetweenInterestBoard(dateMap.get("start"), dateMap.get("end"), from, size);
            } else { // reply
                tempList = boardMapper.selectDateBetweenReplyCountBoard(dateMap.get("start"), dateMap.get("end"), from, size);
            }
            boardList = makeBoardIterator(tempList.iterator());
            logger.info(String.format(" 최신 %s start[%s], end[%s]", time, dateMap.get("start"), dateMap.get("end")));
        }

        ObjectMapper mapper = new ObjectMapper();
        jsonResults = mapper.writeValueAsString(boardList);
        jedis.set(key, jsonResults);
        jedis.expire(key, 60 * 3);
        jedis.close();
        pool.destroy();

        return boardList;
    }



    ////////////////////////////////////////////////////////////////////////////////////
    public Map<String, List<Board>> getDataMain(int from, String sortField, BoardMapper boardMapper) throws Exception {
        List<Board> boardList;
        Map<String, List<Board>> resultMap = new HashMap<>();

        // 최신
        boardList = getDataList("","",from, 4, boardMapper);
        resultMap.put("boradListA", boardList);

        // 30 min
        boardList = getDataList("30min",sortField,from, 4, boardMapper);
        resultMap.put("boradListB", boardList);

        // 1 hour
        boardList = getDataList("1hour",sortField,from, 4, boardMapper);
        resultMap.put("boradListC", boardList);

        // 3시간
        boardList = getDataList("3hour",sortField,from, 4, boardMapper);
        resultMap.put("boradListD", boardList);

        // 6시간
        boardList = getDataList("6hour",sortField,from, 4, boardMapper);
        resultMap.put("boradListE", boardList);

        // 12시간
        boardList = getDataList("12hour",sortField,from, 4, boardMapper);
        resultMap.put("boradListF", boardList);

        // 24시간
        boardList = getDataList("24hour",sortField,from, 4, boardMapper);
        resultMap.put("boradListG", boardList);

        return resultMap;
    }
}
