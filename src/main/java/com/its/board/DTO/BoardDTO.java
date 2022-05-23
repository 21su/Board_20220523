package com.its.board.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardDTO {
    public Long id;
    public String boardTitle;
    public String boardWriter;
    public String boardPassword;
    public String boardContents;
    public int boardHits;
    public Timestamp boardCreatedDate;
}
