package com.bgs.examinationbackstage;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;


@MapperScan("com.bgs.examinationbackstage.mapper")
@EnableTransactionManagement(proxyTargetClass=true)
@SpringBootApplication
public class ExaminationbackstageApplication {

    public static void main(String[] args) {
        SpringApplication.run(ExaminationbackstageApplication.class, args);
    }
}
