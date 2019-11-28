package cn.wolfcode.luowowo.article;

import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@EnableDubbo
@MapperScan("cn.wolfcode.luowowo.article.mapper")
public class ArticleServer {
    public static void main(String[] args) {
        SpringApplication.run(ArticleServer.class, args);
    }
}
