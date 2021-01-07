package com.bgs.examinationbackstage.service.serviceImp;

import com.bgs.examinationbackstage.config.ResultEntity;
import com.bgs.examinationbackstage.mapper.ShujuMapper;
import com.bgs.examinationbackstage.pojo.ExaminationPaper;
import com.bgs.examinationbackstage.pojo.User;
import com.bgs.examinationbackstage.service.ShujuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Iterator;
import java.util.List;

@Service
public class ShujuServiceImpl implements ShujuService {
    @Autowired
    private ShujuMapper shujuMapper;
    @Override
    public ResultEntity findAll(@RequestParam("page") Integer page, @RequestParam("limit") Integer limit, @RequestParam("testPaperName")String testPaperName,
                                @RequestParam("testPaperStartTime") String testPaperStartTime,
                                @RequestParam("testPaperEndTime") String testPaperEndTime ) {
        ResultEntity resultEntity=new ResultEntity();
        int pageNum= (page-1)*5;
        List<ExaminationPaper> examinationPapers=null;
        examinationPapers=shujuMapper.findAll1();
        Iterator<ExaminationPaper> iterator = examinationPapers.iterator();
        while (iterator.hasNext()){
            ExaminationPaper next = iterator.next();
            System.out.println(next.getTestPaperId());
          int canjia=shujuMapper.selectCount(next.getTestPaperId()); //参加人数
            int tongguo=shujuMapper.selectCount1(next.getTestPaperId());//通过人数
            String lv= (float) (tongguo/canjia*100)+"%";
            int zong=shujuMapper.selectCount2(next.getTestPaperId());
            int avg= zong/canjia;
            shujuMapper.insert(String.valueOf(canjia),String.valueOf(tongguo),lv,String.valueOf(avg),String.valueOf(next.getTestPaperId()));
        }
       examinationPapers=shujuMapper.findAll(pageNum,limit,testPaperName,testPaperStartTime,testPaperEndTime);
       int counts=examinationPapers.size();
        if(examinationPapers!=null){
            resultEntity.setCount(counts);
            resultEntity.setMessage("");
            resultEntity.setCode(0);
            resultEntity.setData(examinationPapers);
        }
        return resultEntity;
    }
    @Override
    public ExaminationPaper findAllParameter(Integer testPaperId,Integer uId) {
        ExaminationPaper paper=shujuMapper.findAllParameter(testPaperId,uId);
        return paper;
    }
    //应参加人数
    @Override
    public int canjia() {
        int canjia =shujuMapper.selectCanjiaCount();
        return canjia;
    }
    //查询所有参加试卷人正确的题数
    @Override
    public int selectTestOk(Integer testPaperId) {
        int ok=shujuMapper.selectTestOk(testPaperId);
        return ok;
    }
    //查询总题数
    @Override
    public int zongti(Integer testPaperId) {
        int zongti=shujuMapper.zongti(testPaperId);
        return zongti;
    }
    //最高分
    @Override
    public int zuigao(Integer testPaperId) {
        int zuigao=shujuMapper.zuigao(testPaperId);
        return zuigao;
    }
    //最低分
    @Override
    public int zuidi(Integer testPaperId) {
        int zuidi=shujuMapper.zuidi(testPaperId);
        return zuidi;
    }
    //缺考人数
    @Override
    public List<User> quekao(Integer testPaperId) {
        List<User> users=shujuMapper.quekao(testPaperId);
        return users;
    }
    //人员详情
    @Override
    public ResultEntity detail(Integer testPaperId, Integer page, Integer limit) {
        ResultEntity resultEntity=new ResultEntity();
        int pageNum= (page-1)*5;
       int count = shujuMapper.selectCounts(testPaperId,pageNum,limit);
        List<ExaminationPaper>  examinationPapers=shujuMapper.detail(pageNum,limit,testPaperId);
        if(examinationPapers!=null){
            resultEntity.setCode(0);
            resultEntity.setMessage("");
            resultEntity.setCount(count);
            resultEntity.setData(examinationPapers);
        }
        return resultEntity;
    }
}
