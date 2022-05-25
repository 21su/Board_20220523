package com.its.board.Repository;

import com.its.board.DTO.BoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BoardRepository {
    @Autowired
    public SqlSessionTemplate sql;
    public int save(BoardDTO boardDTO) {
        return sql.insert("Board.save",boardDTO);
    }

    public List<BoardDTO> findAll() {
        return sql.selectList("Board.findAll");
    }

    public BoardDTO detail(Long id) {
        sql.update("Board.hits",id);
        return sql.selectOne("Board.detail",id);
    }

    public BoardDTO pwCheck(Long id, String boardPassword) {
        BoardDTO boardDTO = new BoardDTO();
        boardDTO.setId(id);
        boardDTO.setBoardPassword(boardPassword);
        return sql.selectOne("Board.check",boardDTO);
    }

    public void delete(Long id) {
        System.out.println("id = " + id);
        sql.delete("Board.delete",id);
    }

    public void update(BoardDTO boardDTO) {
        sql.update("Board.update",boardDTO);
    }

    public void saveFile(BoardDTO boardDTO) {
        sql.insert("Board.saveFile", boardDTO);
    }

    public int boardCount() {
        return sql.selectOne("Board.count");
    }

    public List<BoardDTO> pagingList(Map<String, Integer> pagingParam) {
        return sql.selectList("Board.pagingList", pagingParam);
    }
}
