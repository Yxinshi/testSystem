/**
 * ClassName: SwaggerConfig <br/>
 * Description: <br/>
 * date: 2020/11/24 22:12<br/>
 *
 * @author lz<br />
 */
package com.bgs.examinationbackstage.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import springfox.bean.validators.configuration.BeanValidatorPluginsConfiguration;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.util.ArrayList;

/**
 * 1 引入依赖
 * 2 配置配置类@EnableSwagger2
 */

@Configuration //配置类
@EnableSwagger2// 开启Swagger2的自动配置
@Import(BeanValidatorPluginsConfiguration.class)
public class SwaggerConfig {

    @Bean //配置docket以配置Swagger具体参数
    public Docket docket() {
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.taizhou.taizhou_back.controller"))
                .build();
    }


    //配置文档信息
    private ApiInfo apiInfo() {
        Contact contact = new Contact("长江", "https://www.baidu.com", "1161268455@qq.com");
        return new ApiInfo(
                "TZHT接口文档",
                "台州公共资源后台系统接口文档",
                "v1.0",
                "https://www.baidu.com",
                contact,
                "XXX",
                "XXX",
                new ArrayList()
        );
    }

    @Bean
    public Docket docket2() {
        return new Docket(DocumentationType.SWAGGER_2).groupName("group2");
    }

    @Bean
    public Docket docket3() {
        return new Docket(DocumentationType.SWAGGER_2).groupName("group3");
    }

}