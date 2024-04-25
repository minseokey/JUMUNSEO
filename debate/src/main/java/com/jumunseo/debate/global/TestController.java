package com.jumunseo.debate.global;

import com.jumunseo.debate.domain.opinion.dto.OpinionDto;
import com.jumunseo.debate.domain.opinion.entity.MessageSide;
import com.jumunseo.debate.domain.opinion.entity.MessageType;
import com.jumunseo.debate.domain.opinion.entity.Opinion;
import com.jumunseo.debate.domain.opinion.repository.OpinionJPARepository;
import com.jumunseo.debate.domain.opinion.service.OpinionServiceImpl;
import com.jumunseo.debate.domain.subject.entity.Subject;
import com.jumunseo.debate.domain.subject.entity.SubjectSummary;
import com.jumunseo.debate.domain.subject.repository.SubjectJPARepository;
import com.jumunseo.debate.domain.subject.repository.SubjectSummaryJPARepository;
import com.jumunseo.debate.domain.subject.service.SubjectServiceImpl;
import com.jumunseo.debate.global.dto.Result;
import com.jumunseo.debate.global.open_ai.OpenAIService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class TestController {

    private final OpinionServiceImpl opinionService;
    private final OpinionJPARepository opinionRepository;
    private final SubjectServiceImpl subjectService;
    private final SubjectJPARepository subjectRepository;
    private final SubjectSummaryJPARepository subjectSummaryRepository;

    @MessageMapping("/test/{channel}")
    // 웹소켓으로 메시지 받는거
    public String handleMessage(@DestinationVariable String channel, String message) {
        System.out.println("컨트롤러 진입");
        OpinionDto opinionDto = OpinionDto.builder()
                .content(message)
                .type(MessageType.TALK)
                .side(MessageSide.LEFT)
                .subjectId(1L)
                .userId(1L)
                .userName(channel)
                .build();
        opinionService.test(opinionDto);

        return message;
    }

    // 종합 테스트.
    // 1. 주제를 하나만 만듬.
    // 2. 해당 주제가 살아있는 동안(30초) opinion 들을 각각의 좌, 우 진영에 추가.
    // 3. 주제가 만료되고 나서 주제를 종료, 요약된 정보들을 반환.
    @GetMapping("/test")
    public ResponseEntity<Result<?>> test() {
        System.out.println("0");

        // 1. 주제 생성 일반적으로 주제 번호는 1이다.
        subjectService.addSubject();
        Subject sub = subjectRepository.findById(1L).get();
        System.out.println("1");

        // 2. opinion 생성 좌, 우 3개씩.
        Opinion opinionDtoL1 = Opinion.builder().content("맞다고 생각한다").type(MessageType.TALK).side(MessageSide.LEFT).subject(sub).userId(1L).build();
        Opinion opinionDtoL2 = Opinion.builder().content("당연하지. 당연히 그래야한다.").type(MessageType.TALK).side(MessageSide.LEFT).subject(sub).userId(1L).build();
        Opinion opinionDtoL3 = Opinion.builder().content("아닐수도 있지만 맞다고 생각한다.").type(MessageType.TALK).side(MessageSide.LEFT).subject(sub).userId(1L).build();

        Opinion opinionDtoR1 = Opinion.builder().content("절대 아니다.").type(MessageType.TALK).side(MessageSide.RIGHT).subject(sub).userId(2L).build();
        Opinion opinionDtoR2 = Opinion.builder().content("이게 왜?").type(MessageType.TALK).side(MessageSide.RIGHT).subject(sub).userId(2L).build();
        Opinion opinionDtoR3 = Opinion.builder().content("그럴리가 없다").type(MessageType.TALK).side(MessageSide.RIGHT).subject(sub).userId(2L).build();
        Opinion opinionDtoR4 = Opinion.builder().content("맞을수도 있지만 아니라고 생각한다.").type(MessageType.TALK).side(MessageSide.RIGHT).subject(sub).userId(6L).build();


        opinionRepository.save(opinionDtoL1);
        opinionRepository.save(opinionDtoL2);
        opinionRepository.save(opinionDtoL3);
        opinionRepository.save(opinionDtoR1);
        opinionRepository.save(opinionDtoR2);
        opinionRepository.save(opinionDtoR3);
        opinionRepository.save(opinionDtoR4);

        System.out.println("2");

        System.out.println("살이있는 주제" + subjectService.getLiveSubject());
        // 3. 주제 만료까지 대기. 요약 메소드를 호출.
        try {
            Thread.sleep(6000);
        }
        catch (InterruptedException e){
            System.out.println("Interrupted");
        }

        subjectService.summarySubject();

        System.out.println("3");
        // 4. 요약된 정보 반환.
        SubjectSummary subjectSummary = subjectSummaryRepository.findById(1L).get();
        System.out.println("4");

        return ResponseEntity.ok(Result.successResult(subjectSummary));
    }

    @GetMapping("/test/makesub")
    public ResponseEntity<Result<?>> makesub(){
        subjectService.addSubject();
        return ResponseEntity.ok(Result.successResult(""));
    }
}
