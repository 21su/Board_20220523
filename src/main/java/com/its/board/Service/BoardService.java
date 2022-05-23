package com.its.board.Service;

import com.its.board.DTO.BoardDTO;
import com.its.board.Repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {
    @Autowired
    public BoardRepository boardRepository;
    public boolean save(BoardDTO boardDTO) {
        int saveResult = boardRepository.save(boardDTO);
        if(saveResult > 0){
            return true;
        } else{
            return false;
        }
    }

    public List<BoardDTO> findAll() {
        return boardRepository.findAll();
    }

    public BoardDTO detail(Long id) {
        return boardRepository.detail(id);
    }

    public BoardDTO pwCheck(Long id, String boardPassword) {
        return boardRepository.pwCheck(id, boardPassword);
    }

    public void delete(Long id) {
        boardRepository.delete(id);
    }

    public void update(BoardDTO boardDTO) {
        boardRepository.update(boardDTO);
    }
}
