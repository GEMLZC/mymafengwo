package cn.wolfcode.luowowo.flight;

import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@EnableDubbo
@MapperScan("cn.wolfcode.luowowo.flight.mapper")
public class FlightServer {
    public static void main(String[] args) {
        SpringApplication.run(FlightServer.class, args);
    }
}
