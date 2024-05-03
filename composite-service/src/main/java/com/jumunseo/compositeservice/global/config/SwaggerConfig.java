package com.jumunseo.compositeservice.global.config;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import lombok.RequiredArgsConstructor;
import org.springdoc.core.models.GroupedOpenApi;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@RequiredArgsConstructor
public class SwaggerConfig {
    @Bean
    public OpenAPI customOpenAPI() {
        return new OpenAPI()
                .info(new Info().title("Jumunseo API")
                        .version("1.0")
                        .description("캡스톤 프로젝트 API 문서입니다."));
    }

    @Bean
    public GroupedOpenApi api(){
        String[] paths = {"/**"};
        String[] packagesToScan = {"com.jumunseo.compositeservice"};
        return GroupedOpenApi.builder()
                .group("api")
                .pathsToMatch(paths)
                .packagesToScan(packagesToScan)
                .build();
    }
}
