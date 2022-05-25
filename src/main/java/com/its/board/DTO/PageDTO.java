package com.its.board.DTO;

import lombok.Data;

@Data
public class PageDTO {
    private int page; // 현제페이지
    private int maxPage; //최대페이지 갯수
    private int startPage; // 시작페이지
    private int endPage; // 끝페이지
}
