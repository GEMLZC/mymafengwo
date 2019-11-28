package cn.wolfcode.luowowo.hotel;

import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@EnableDubbo
@MapperScan("cn.wolfcode.luowowo.hotel.mapper")
public class HotelServer {
    public static void main(String[] args) {
        SpringApplication.run(HotelServer.class, args);
    }
}
