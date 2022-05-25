package com.its.board.Service;

import com.its.board.DTO.BoardDTO;
import com.its.board.DTO.PageDTO;
import com.its.board.Repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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


    // 파일첨부 공식
    public  void saveFile(BoardDTO boardDTO) throws IOException {
        /**
         * 1. DTO 객체에 담길 파일을 꺼냄
         * 2. 파일의 이름을 가져옴.
         * 2.1. 파일 이름 중복을 피하기 위한 조치
         * 3. 파일 이름을 DTO 객체의 boardFileName에 저장
         * 4. 파일의 저장 위치 지정.
         * 5.파일 저장처리
         * 6.DTO 객체 repository로 전달
         */
        MultipartFile boardFile = boardDTO.getBoardFile(); // 1.
        String boardFileName = boardFile.getOriginalFilename(); // 2.
        boardFileName = System.currentTimeMillis() + "-" + boardFileName; // 2.1.
        boardDTO.setBoardFileName(boardFileName); // 3.
        String savePath = "D:\\spring_img\\" + boardFileName; // 4.
        // 5.
        if (!boardFile.isEmpty()){
            boardFile.transferTo((new File(savePath)));
        }
        boardRepository.saveFile(boardDTO); // 6.
    }

    private static final int PAGE_LIMIT = 3;  // 한 페이지에 보여줄 글 갯수
    private static final int BLOCK_LIMIT = 3;


    /**
     * 요청한 페이지에 해당하는 글 목록을 DB에서 가져오는 역할
     */
    public List<BoardDTO> pagingList(int page) {
        int pagingStart = (page-1) * PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PAGE_LIMIT);
        List<BoardDTO> pagingList = boardRepository.pagingList(pagingParam);
        return pagingList;
    }

    public PageDTO paging(int page) {
        // 글 갯수 조회
        int boardCount = boardRepository.boardCount();
        // 필요한 전체 페이지 갯수
        int maxPage = (int)(Math.ceil((double)boardCount / PAGE_LIMIT));
        // 시작페이지 1 4 7 10 ...
        int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
        // 끝페이지 3 6 9 12 ...
        int endPage = startPage + BLOCK_LIMIT - 1;
        if(endPage > maxPage)
            endPage = maxPage;
        PageDTO paging = new PageDTO();
        paging.setPage(page);
        paging.setStartPage(startPage);
        paging.setEndPage(endPage);
        paging.setMaxPage(maxPage);
        return paging;
    }
}
