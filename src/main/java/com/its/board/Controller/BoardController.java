package com.its.board.Controller;

import com.its.board.DTO.BoardDTO;
import com.its.board.Service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.util.List;

@Controller
public class BoardController {
    @Autowired
    public BoardService boardService;

    @GetMapping("/save")
    public String saveForm(){
        return "save";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute BoardDTO boardDTO){
        boolean saveResult = boardService.save(boardDTO);
        if(saveResult){
            System.out.println("글작성 성공");
            return "index";
        } else{
            System.out.println("글작성 실패");
            return "index";
        }
    }

    @GetMapping("/findAll")
    public String findAll(Model model){
        List<BoardDTO> boardList = boardService.findAll();
        model.addAttribute("boardList", boardList);
        return "findAll";
    }

    @GetMapping("/detail")
    public String detail(@RequestParam("id") Long id,Model model){
        BoardDTO boardDTO = boardService.detail(id);
        model.addAttribute("boardDTO", boardDTO);
        return "detail";
    }
    @GetMapping("/passwordCheck")
    public String passwordCheck(@RequestParam("id") Long id,
                                @RequestParam("type") String type,Model model){
        BoardDTO boardDTO = boardService.detail(id);
        model.addAttribute("modelDTO",boardDTO);
        model.addAttribute("id", id);
        model.addAttribute("type", type);
        return "passwordCheck";
    }
    @GetMapping("/update")
    public String update(@RequestParam("id") Long id,Model model){
        BoardDTO boardDTO = boardService.detail(id);
        model.addAttribute("idDTO",boardDTO);
        return "update";
    }
    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id){
            boardService.delete(id);
            System.out.println("삭제");
            return "index";
    }
    @PostMapping("/update")
    public String update1(@ModelAttribute BoardDTO boardDTO){
        boardService.update(boardDTO);
        return "redirect:/detail?id=" + boardDTO.getId();
    }

    @GetMapping("/saveFile")
    public String saveFileForm(){
        return "saveFile";
    }

    // 파일첨부
    @PostMapping("/saveFile")
    public String saveFile(@ModelAttribute BoardDTO boardDTO) throws IOException {
        boardService.saveFile(boardDTO);
        return "redirect:/findAll";
    }
}
