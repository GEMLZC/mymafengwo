package cn.wolfcode.luowowo.hotel.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import lombok.Getter;
import lombok.Setter;
import org.springframework.util.StringUtils;

@Setter@Getter
public class DestinationTheme extends BaseDomain{
    //主题名字
    private String name;
    //目的地列(字符串)
    private String dests;
    //目的地列(id)
    private Long [] destIds;

    public String getDests() {
        if (destIds == null) {
            return null;
        }

        StringBuilder sb = new StringBuilder();
        for (Long id : destIds) {
            sb.append(id).append(",");
        }
        sb.deleteCharAt(sb.length() - 1);
        dests = sb.toString();
        return dests;
    }

    public Long[] getDestIds() {
        if (!StringUtils.hasLength(dests)) {
            return null;
        }
        String[] vals = dests.split(",");
        destIds = new Long[vals.length];
        for (int i = 0; i < vals.length; i++) {
            destIds[i] = Long.valueOf(vals[i]);
        }
        return destIds;
    }
}
