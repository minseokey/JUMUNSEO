package com.jumunseo.compositeservice.global.exception;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomErrorController implements ErrorController {

    @RequestMapping("/jwt-error")
    public ResponseEntity<?> handleError(HttpServletRequest req) {
        // 필터단계의 커스텀 에러 처리. 얘는 ExceptionHandler로 처리 불가.
        Result<?> error = Result.failResult(req.getAttribute("error").toString());
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(error);
    }
}
