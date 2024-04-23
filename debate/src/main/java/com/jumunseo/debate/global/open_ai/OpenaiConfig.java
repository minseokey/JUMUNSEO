package com.jumunseo.debate.global.open_ai;

import io.netty.channel.ChannelOption;
import io.netty.handler.timeout.ReadTimeoutHandler;
import io.netty.handler.timeout.WriteTimeoutHandler;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.client.reactive.ReactorClientHttpConnector;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.netty.http.client.HttpClient;
import java.util.concurrent.TimeUnit;

@Configuration
public class OpenaiConfig {

    @Value("${openai.api.key}")
    private String API_KEY;

    @Bean
    public WebClient webclient() {
        // 연결 타임아웃, 읽기 타임아웃, 쓰기 타임아웃 설정
        HttpClient httpClient = HttpClient.create()
                // 연결시간 타임아웃.
                .option(ChannelOption.CONNECT_TIMEOUT_MILLIS, 5000)
                // 응답 대기시간 이는 서버로부터 데이터를 받기 시작한 후 전체 응답을 받기까지의 시간을 제한.
                .responseTimeout(java.time.Duration.ofMillis(20000))
                .doOnConnected(conn ->
                        // 읽기 타임아웃 설정. 서버로부터 데이터를 읽는 작업이 지정된 시간 동안 데이터를 받지 못하면 타임아웃을 발생.
                        conn.addHandlerLast(new ReadTimeoutHandler(20000, TimeUnit.MILLISECONDS))
                                // 쓰기 타임아웃 설정. 클라이언트가 데이터를 서버에 전송하는 작업이 지정된 시간 동안 데이터를 전송하지 못하면 타임아웃을 발생.
                                .addHandlerLast(new WriteTimeoutHandler(20000, TimeUnit.MILLISECONDS)));

        return WebClient.builder()
                .defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
                .defaultHeader("Authorization", "Bearer " + API_KEY)
                .clientConnector(new ReactorClientHttpConnector(httpClient))
                .build();
    }
}
