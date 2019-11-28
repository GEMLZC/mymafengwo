package cn.wolfcode.luowowo;

import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@EnableDubbo
@MapperScan("cn.wolfcode.luowowo.member.mapper")
public class MemberServer {
    public static void main(String[] args) {
        SpringApplication.run(MemberServer.class, args);
    }
}
