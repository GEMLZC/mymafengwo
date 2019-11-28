package cn.wolfcode.luowowo.mgrsite.controller;

import cn.wolfcode.luowowo.mgrsite.util.UploadUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.Map;

@Controller
public class UploadController {
    @Value("${file.dir}")
    private String fileDir;

    @ResponseBody
    @RequestMapping("/uploadImg")
    public Object uploadImg(MultipartFile pic) {
        return UploadUtil.upload(pic, fileDir);
    }

    @ResponseBody
    @RequestMapping("/uploadImg_ck")
    public Object uploadImgCk(MultipartFile upload) {
        Map<String, Object> map = new HashMap<>();
        if (upload.getContentType().startsWith("image") && upload.getSize() > 0) {
            String path = UploadUtil.upload(upload, fileDir);
            map.put("uploaded", "1");
            map.put("url", "/"+path);
        } else {
            map.put("uploaded", "0");
        }
        return map;
    }
}
