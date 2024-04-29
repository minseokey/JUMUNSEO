package com.jumunseo.community.global.config;

import java.sql.Connection;
import java.sql.Statement;

import javax.sql.DataSource;

import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@AllArgsConstructor
public class PostgreSQLConfig implements ApplicationRunner {

    private final DataSource dataSource;
    private final JdbcTemplate jdbcTemplate;

    @Override
    public void run(ApplicationArguments args) throws Exception {
        try (Connection connection = dataSource.getConnection()) {
            log.info("DATASOURCE = " + dataSource);
            log.info("JDBCTEMPLATE = " + jdbcTemplate);
            log.info("Connection = " + connection);
            log.info("URL = " + connection.getMetaData().getURL());
            log.info("UserName = " + connection.getMetaData().getUserName());
            log.info("DatabaseProductName = " + connection.getMetaData().getDatabaseProductName());
            log.info("DatabaseProductVersion = " + connection.getMetaData().getDatabaseProductVersion());
            log.info("DriverName = " + connection.getMetaData().getDriverName());
            log.info("DriverVersion = " + connection.getMetaData().getDriverVersion());
            log.info("JDBC MajorVersion = " + connection.getMetaData().getJDBCMajorVersion());
            Statement statement = connection.createStatement();
        }
        jdbcTemplate.execute("CREATE TABLE IF NOT EXISTS community (id SERIAL, title VARCHAR(255), content TEXT)");
    }

}
