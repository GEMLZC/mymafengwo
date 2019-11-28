package cn.wolfcode.luowowo.common.util;

import java.util.Calendar;
import java.util.Date;

public abstract class DateUtil {

    public static Date getEndDate(Date now) {
        if (now == null) {
            return null;
        }
        Calendar c = Calendar.getInstance();
        c.setTime(now);
        c.set(Calendar.HOUR_OF_DAY, 23);
        c.set(Calendar.MINUTE, 59);
        c.set(Calendar.SECOND, 59);
        c.set(Calendar.MILLISECOND, 999);
        return c.getTime();
    }

    public static long getDateBetween(Date d1, Date d2) {
        return Math.abs(d1.getTime() - d2.getTime());
    }
}
