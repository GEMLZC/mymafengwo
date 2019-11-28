package cn.wolfcode.luowowo.common.domain;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Setter@Getter
public abstract class BaseDomain implements Serializable {
    protected Long id;
}
