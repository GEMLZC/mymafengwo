package cn.wolfcode.luowowo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling//定时器
public class Mgrsite {
    public static void main(String[] args) {
        SpringApplication.run(Mgrsite.class, args);
    }
}
