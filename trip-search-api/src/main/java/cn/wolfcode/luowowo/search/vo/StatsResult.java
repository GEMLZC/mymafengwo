package cn.wolfcode.luowowo.search.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;

@Setter@Getter
@NoArgsConstructor
@AllArgsConstructor
public class StatsResult implements Serializable {
    public static final Long CHINA_ID = 1L;

    private Long id;
    private String name;
    private Long count;

    public boolean equals(Object obj) {
        if (!(obj instanceof StatsResult)) {
            return false;
        }

        StatsResult sr = (StatsResult) obj;
        return id.equals(sr.id);
    }

    public int hashCode() {
        return id.hashCode();
    }
}
