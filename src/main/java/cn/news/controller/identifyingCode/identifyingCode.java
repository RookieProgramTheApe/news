package cn.news.controller.identifyingCode;

import javax.imageio.ImageIO;
import javax.servlet.annotation.WebServlet;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;


@WebServlet(urlPatterns = "/identifyingCode")
public class identifyingCode extends javax.servlet.http.HttpServlet {

    @Override
    protected void doGet(javax.servlet.http.HttpServletRequest req, javax.servlet.http.HttpServletResponse resp) throws javax.servlet.ServletException, IOException {
        //图片大小
        int width = 120;
        int height = 50;
        //等同于response.setHeader("Content-Type", "image/jpeg");
        resp.setContentType("image/jpeg");
        //设置响应头控制浏览器不要缓存
        resp.setDateHeader("expries", -1);
        resp.setHeader("Cache-Control", "no-cache");
        resp.setHeader("Pragma", "no-cache");

        //将内存中的图片写入页面中
        ImageIO.write(drawImg(new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB),req,resp),"jpg",resp.getOutputStream());
    }

    /**
     * 验证码图片绘制及对应验证码文字session存储
     * @param bufferedImage
     * @param request
     * @param resp
     * @return
     */
    private BufferedImage drawImg(BufferedImage bufferedImage,javax.servlet.http.HttpServletRequest request,javax.servlet.http.HttpServletResponse resp){
        request.getSession().removeAttribute("securityCode");
        StringBuffer securityCode = new StringBuffer();
        class Position{
            private int width;
            private int height;

            public Position(int width, int height) {
                this.width = width;
                this.height = height;
            }

            public int getWidth() {
                return width;
            }

            public void setWidth(int width) {
                this.width = width;
            }

            public int getHeight() {
                return height;
            }

            public void setHeight(int height) {
                this.height = height;
            }
        }
        Graphics graphics = bufferedImage.getGraphics();
//        设置图片背景颜色
        graphics.setColor(new Color(200, 200, 200));
        graphics.fillRect(0,0,bufferedImage.getWidth(),bufferedImage.getHeight());


        int width = bufferedImage.getWidth() - 20;
        int height = bufferedImage.getHeight() - 20;
        graphics.setFont(new Font("宋体",Font.BOLD,bufferedImage.getHeight() - 30));
        //画笔颜色数组
        Color[] colors = {new Color(229, 99, 99),new Color(23,35,23),new Color(255,0,0),new Color(0,254,20),new Color(0,0,255)};
        Position[] positions = {new Position(bufferedImage.getWidth()/6,height/2+graphics.getFont().getSize()/2),new Position((bufferedImage.getWidth()/6)*2,height/2+graphics.getFont().getSize()/2),
                new Position((bufferedImage.getWidth()/6)*3,height/2+graphics.getFont().getSize()/2),new Position((bufferedImage.getWidth()/6)*4,height/2+graphics.getFont().getSize()/2)};
        String text = "abDFcdefOPQRSTUVWXYghklABC3456ijDEHImnopqrstuvwxyzJKLMNZ12789";


        for (int i = 0;i < 4; i++){
            int index = new Random().nextInt(text.length());
            securityCode.append(text.substring(index,index+1));
            graphics.setColor(colors[new Random().nextInt(colors.length)]);
            graphics.drawString(text.substring(index,index+1),positions[i].getWidth(),positions[i].getHeight());
        }
        request.getSession().setAttribute("securityCode",securityCode.toString());
        System.out.println("session中存储的验证码值：" + request.getSession().getAttribute("securityCode"));
        return bufferedImage;
    }
}
