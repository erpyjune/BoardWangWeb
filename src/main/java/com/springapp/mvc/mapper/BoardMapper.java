package com.springapp.mvc.mapper;

import com.springapp.mvc.data.Board;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

/**
 * Created by oj.bae on 2016. 2. 7..
 */
public interface BoardMapper {
    @Select("SELECT id, title, writer, url, thumb_url, image_url, cp_name, cp_name_display, date, view_count, suggest_count, reply_count FROM board")
    @Results(value = {
            @Result(property = "id",           column = "id"),
            @Result(property = "title",        column = "title"),
            @Result(property = "writer",       column = "writer"),
            @Result(property = "url",          column = "url"),
            @Result(property = "thumbUrl",     column = "thumb_url"),
            @Result(property = "imageUrl",     column = "image_url"),
            @Result(property = "cpName",       column = "cp_name"),
            @Result(property = "cpNameDisplay",column = "cp_name_display"),
            @Result(property = "dateTime",     column = "date"),
            @Result(property = "viewCount",    column = "view_count"),
            @Result(property = "suggestCount", column = "suggest_count"),
            @Result(property = "imageCount",   column = "image_count"),
            @Result(property = "videoCount",   column = "video_count"),
            @Result(property = "replyCount",   column = "reply_count")
    })
    List<Board> selectAllBoard();

    @Select("SELECT id, title, writer, url, thumb_url, image_url, cp_name, cp_name_display, date, view_count, suggest_count, reply_count " +
            "FROM board " +
            "WHERE cp_name_display = #{cp} order by date desc, ts desc limit #{from}, #{size}")
    @Results(value = {
            @Result(property = "id",           column = "id"),
            @Result(property = "title",        column = "title"),
            @Result(property = "writer",       column = "writer"),
            @Result(property = "url",          column = "url"),
            @Result(property = "thumbUrl",     column = "thumb_url"),
            @Result(property = "imageUrl",     column = "image_url"),
            @Result(property = "cpName",       column = "cp_name"),
            @Result(property = "cpNameDisplay",column = "cp_name_display"),
            @Result(property = "dateTime",     column = "date"),
            @Result(property = "viewCount",    column = "view_count"),
            @Result(property = "suggestCount", column = "suggest_count"),
            @Result(property = "imageCount",   column = "image_count"),
            @Result(property = "videoCount",   column = "video_count"),
            @Result(property = "replyCount",   column = "reply_count")
    })
    List<Board> selectCpNameBoardFromTo(@Param("cp") String cp, @Param("from") int from, @Param("size") int size);

    @Select("SELECT id, title, writer, url, thumb_url, image_url, cp_name, cp_name_display, date, view_count, suggest_count, reply_count " +
            "FROM board order by date desc, ts desc limit #{from}, #{size}")
    @Results(value = {
            @Result(property = "id",           column = "id"),
            @Result(property = "title",        column = "title"),
            @Result(property = "writer",       column = "writer"),
            @Result(property = "url",          column = "url"),
            @Result(property = "thumbUrl",     column = "thumb_url"),
            @Result(property = "imageUrl",     column = "image_url"),
            @Result(property = "cpName",       column = "cp_name"),
            @Result(property = "cpNameDisplay",column = "cp_name_display"),
            @Result(property = "dateTime",     column = "date"),
            @Result(property = "viewCount",    column = "view_count"),
            @Result(property = "suggestCount", column = "suggest_count"),
            @Result(property = "imageCount",   column = "image_count"),
            @Result(property = "videoCount",   column = "video_count"),
            @Result(property = "replyCount",   column = "reply_count")
    })
    List<Board> selectBoardFromTo(@Param("from") int from, @Param("size") int size);

    @Select("SELECT id, title, writer, url, thumb_url, image_url, cp_name, cp_name_display, date, view_count, suggest_count, reply_count FROM board WHERE id=#{id}")
    @Results(value = {
            @Result(property = "id",           column = "id"),
            @Result(property = "title",        column = "title"),
            @Result(property = "writer",       column = "writer"),
            @Result(property = "url",          column = "url"),
            @Result(property = "thumbUrl",     column = "thumb_url"),
            @Result(property = "imageUrl",     column = "image_url"),
            @Result(property = "cpName",       column = "cp_name"),
            @Result(property = "cpNameDisplay",column = "cp_name_display"),
            @Result(property = "dateTime",     column = "date"),
            @Result(property = "viewCount",    column = "view_count"),
            @Result(property = "suggestCount", column = "suggest_count"),
            @Result(property = "imageCount",   column = "image_count"),
            @Result(property = "videoCount",   column = "video_count"),
            @Result(property = "replyCount",   column = "reply_count")
    })
    Board selectBoardId(@Param("id") int id);

    @Select("SELECT title, writer, url, thumb_url, image_url, cp_name, cp_name_display, date, view_count, suggest_count, reply_count FROM board WHERE url=#{url}")
    @Results(value = {
            @Result(property = "title",        column = "title"),
            @Result(property = "writer",       column = "writer"),
            @Result(property = "url",          column = "url"),
            @Result(property = "thumbUrl",     column = "thumb_url"),
            @Result(property = "imageUrl",     column = "image_url"),
            @Result(property = "cpName",       column = "cp_name"),
            @Result(property = "cpNameDisplay",column = "cp_name_display"),
            @Result(property = "dateTime",     column = "date"),
            @Result(property = "viewCount",    column = "view_count"),
            @Result(property = "suggestCount", column = "suggest_count"),
            @Result(property = "imageCount",   column = "image_count"),
            @Result(property = "videoCount",   column = "video_count"),
            @Result(property = "replyCount",   column = "reply_count")
    })
    Board selectBoardUrl(Board board);

    @Select("INSERT INTO board (title,    writer,    url,    thumb_url,   image_url,   cp_name,   date,        view_count,   suggest_count,   reply_count,   image_count,   video_count) " +
            "VALUES (           #{title}, #{writer}, #{url}, #{thumbUrl}, #{imageUrl}, #{cpName}, #{dateTime}, #{viewCount}, #{suggestCount}, #{replyCount}, #{imageCount}, #{videoCount} )")
    void insertBoard(Board board);

    @Select("UPDATE board SET title=#{title}, writer=#{writer}, url=#{url}, thumb_url=#{thumbUrl}, image_url=#{imageUrl}, cp_name=#{cpName}, " +
            "date=#{dateTime}, view_count=#{viewCount}, suggest_count=#{suggestCount}, reply_count=#{replyCount}, image_count=#{imageCount}, video_count=#{videoCount} " +
            "WHERE url=#{url}")
    void updateBoard(Board board);
    @Select("SELECT product_id, product_name, product_url, thumb_url, spec1, spec2, seed_url, category FROM product_main limit 20")
    List<Map<String, Object>> selectMainDataAll();

    @Select("SELECT product_id, product_name, product_url, thumb_url, spec1, spec2, seed_url, category FROM product_main limit #{from}, #{count}")
    List<Map<String, Object>> selectMainDataPage(@Param("from") int from, @Param("count") int count);

    @Select("SELECT post_image_url, post_title, post_desc, post_author, post_url  FROM blog_ext_body_data WHERE product_id=#{productId} limit 5")
    List<Map<String, Object>> selectBlogList(@Param("productId") String productId);

    @Select("SELECT product_id, mall_name, reputation, url FROM reputation WHERE product_id=#{productId} limit 5")
    List<Map<String, Object>> selectRepuList(@Param("productId") String productId);


    /**
     *
     * @param dsid
     * @param operationUser
     * @return
     */


    @Insert("INSERT INTO document (dsid, operation_user, created_at) VALUES (#{dsid}, #{operation_user}, now())")
    int insertDocument(@Param("dsid") String dsid, @Param("operation_user") String operationUser);

    @Select("SELECT dsid, created_at FROM document WHERE dsid = #{dsid}")
    Map<String, Object> selectDocumentByDsid(@Param("dsid") String dsid);

    @Insert("INSERT INTO thumbnail (dsid, imghash, status, operation_user, description, created_at) VALUES (#{dsid}, #{imghash}, #{status}, #{operation_user}, #{description}, now())")
    int insertThumbnail(@Param("dsid") String dsid,
                        @Param("imghash") String imghash,
                        @Param("status") String status,
                        @Param("operation_user") String operationUser,
                        @Param("description") String description);

    @Update("UPDATE thumbnail SET status = #{status}, operation_user = #{operation_user}, description = #{description} WHERE dsid = #{dsid} AND imghash = #{imghash}")
    int updateThumbnail(@Param("status") String status,
                        @Param("operation_user") String operationUser,
                        @Param("description") String description,
                        @Param("dsid") String dsid,
                        @Param("imghash") String imghash);


    @Select("SELECT dsid, imghash, status, operation_user, description, updated_at, created_at FROM thumbnail WHERE dsid = #{dsid}")
    List<Map<String, Object>> selectThumbnailsByDsid(@Param("dsid") String dsid);

    @Select("SELECT dsid, imghash, status, operation_user, description, updated_at, created_at FROM thumbnail WHERE dsid = #{dsid} AND status = #{status}")
    List<Map<String, Object>> selectThumbnailsByDsidAndStatus(@Param("dsid") String dsid,
                                                              @Param("status") String status);

    @Select("SELECT dsid, imghash, status, operation_user, description, updated_at, created_at FROM thumbnail WHERE dsid = #{dsid} AND imghash = #{imghash} LIMIT 1")
    Map<String, Object> selectThumbnailByDsidAndImghash(@Param("dsid") String dsid,
                                                        @Param("imghash") String imghash);

    @Insert("INSERT INTO history (dsid, imghash, status, operation_user, description, created_at) VALUES (#{dsid}, #{imghash}, #{status}, #{operation_user}, #{description}, now())")
    int insertHistory(@Param("dsid") String dsid,
                      @Param("imghash") String imghash,
                      @Param("status") String status,
                      @Param("operation_user") String operationUser,
                      @Param("description") String description);

    @Select("SELECT dsid, imghash, status, operation_user, description, created_at FROM history ORDER BY id DESC")
    List<Map<String, Object>> selectHistories();

    @Select("SELECT dsid, imghash, status, operation_user, description, created_at FROM history WHERE ${where} ORDER BY id DESC")
    List<Map<String, Object>> selectHistoriesWhere(@Param("where") String where);

    @Select("SELECT dsid, imghash, status, operation_user, description, created_at FROM history WHERE dsid = #{dsid} ORDER BY id DESC")
    List<Map<String, Object>> selectHistoriesByDsid(@Param("dsid") String dsid);

    @Select("SELECT dsid, imghash, status, operation_user, description, created_at FROM history WHERE dsid = #{dsid} AND imghash = #{imghash} ORDER BY id DESC")
    List<Map<String, Object>> selectHistoriesByDsidAndImghash(@Param("dsid") String dsid,
                                                              @Param("imghash") String imghash);

    @Select("SELECT dsid, imghash, status, operation_user, description, created_at FROM history WHERE operation_user = #{operation_user} ORDER BY id DESC")
    List<Map<String, Object>> selectHistoriesByOperationUser(@Param("operation_user") String operationUser);
}
