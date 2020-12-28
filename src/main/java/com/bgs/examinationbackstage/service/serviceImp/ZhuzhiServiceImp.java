package com.bgs.examinationbackstage.service.serviceImp;

import com.bgs.examinationbackstage.mapper.ZhuzhiMapper;
import com.bgs.examinationbackstage.service.ZhuzhiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ZhuzhiServiceImp  implements ZhuzhiService {

    @Autowired
    ZhuzhiMapper zhuzhiMapper;


    @Override
    public List<Map<String, Object>> Kaoshi() {
        return zhuzhiMapper.Kaoshi();
    }
}
