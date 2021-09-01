package com.example.tmall;

import com.xq.tmall.TmallApplication;
import com.xq.tmall.dao.PropertyMapper;
import com.xq.tmall.entity.Property;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest(classes = {TmallApplication.class})

class TmallApplicationTests {

    @Autowired
    private PropertyMapper propertyMapper;

    @Test
    void contextLoads() {

        String[] args = {"智能类型", "传输半径", "防尘性能", "品牌", "耳机材质",
        "颜色", "耳级类别", "保修期", "型号", "声道", "待机时间"};
        Integer cid = 18;
        Property property = new Property();

        for(int i = 0; i < args.length; i++){
            propertyMapper.addProperty(cid, args[i]);
        }
    }

}
