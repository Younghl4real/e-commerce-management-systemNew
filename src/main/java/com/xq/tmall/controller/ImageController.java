package com.xq.tmall.controller;

import com.google.code.kaptcha.impl.DefaultKaptcha;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;

//
//import com.google.code.kaptcha.impl.DefaultKaptcha;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import javax.imageio.ImageIO;
//import javax.servlet.ServletOutputStream;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.awt.image.BufferedImage;
//import java.io.IOException;
//
///**
// * 图形验证码
// *
// * @author zwp
// * @since 1.0.0
// */
@Controller
@RequestMapping("/image")
public class ImageController {

    @Autowired
    private DefaultKaptcha defaultKaptcha;

    @RequestMapping("/getKaptchaImage")
    public void getKaptchaImage(HttpServletRequest request, HttpServletResponse response){
    // 定义response输出类型为image/jpeg类型
        response.setDateHeader("Expires", 0);
    // Set standard HTTP/1.1 no-cache headers.
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
    // Set IE extended HTTP/1.1 no-cache headers (use addHeader).
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");
    // Set standard HTTP/1.0 no-cache header.
        response.setHeader("Pragma", "no-cache");
    // return a jpeg
        response.setContentType("image/jpeg");
//-------------------生成验证码 begin --------------------------
    //获取验证码文本内容
        String text = defaultKaptcha.createText();
        System.out.println("验证码内容："+text);
    //将验证码放入session中
        request.getSession().setAttribute("pictureVerifyKey",text);
    //根据文本内容创建图形验证码
        BufferedImage image = defaultKaptcha.createImage(text);
        ServletOutputStream outputStream = null;
        try {
            outputStream = response.getOutputStream();
            //输出流输出图片，格式jpg
            ImageIO.write(image,"jpg",outputStream);
            outputStream.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if (null!=outputStream){
                try {
                    outputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
//-------------------生成验证码 end ----------------------------
    }
}
