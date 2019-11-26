package com.ruoyi.moudels.test.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.service.impl.BaseServiceImpl;
import com.ruoyi.common.utils.sql.SqlUtil;
import com.ruoyi.framework.aspectj.DataScopeAspect;
import com.ruoyi.moudels.test.domain.Training;
import com.ruoyi.moudels.test.mapper.TrainingMapper;
import com.ruoyi.moudels.test.service.ITrainingService;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

/**
 * 训练Service业务层处理
 *
 * @author yuanxy
 * @date 2019-11-25
 */
@Service
public class TrainingServiceImpl extends BaseServiceImpl<TrainingMapper, Training> implements ITrainingService {

    /**
     * 查询训练
     *
     * @param id 训练ID
     * @return 训练
     */
    @Override
    public Training getTrainingById(Long id) {
        return baseMapper.selectById(id);
    }

    /**
     * 查询训练列表
     *
     * @param training 训练
     * @param page 分页
     * @return 训练
     */
    @Override
    public TableDataInfo getTrainingList(Training training, Page page) {
        IPage iPage = baseMapper.selectPage(page, getWrapper(training));
        return getDataTable(iPage);
    }

    /**
     * 查询训练列表
     *
     * @param training 训练
     * @return 训练
     */
    @Override
    public List<Training> getTrainingList(Training training) {
        return baseMapper.selectList(getWrapper(training));
    }

    /**
     * 新增训练
     *
     * @param training 训练
     * @return 结果
     */
    @Override
    public int insertTraining(Training training) {
        return baseMapper.insert(training);
    }

    /**
     * 修改训练
     *
     * @param training 训练
     * @return 结果
     */
    @Override
    public int updateTraining(Training training) {
        return baseMapper.updateById(training);
    }

    /**
     * 删除训练对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteTrainingByIds(String[] ids) {
        return baseMapper.deleteBatchIds(Arrays.asList(ids));
    }

    /**
     * 根据实体获得 Wrapper
     *
     * @param training
     * @return
     */
    private QueryWrapper<Training> getWrapper(Training training) {

        QueryWrapper<Training> wrapper = new QueryWrapper<>();
        wrapper.like(StrUtil.isNotBlank(training.getTrainingName()), "training_name", SqlUtil.dealSpecialCharUseLike(training.getTrainingName()));
        wrapper.eq(StrUtil.isNotBlank(training.getTrainingNo()), "training_no", training.getTrainingNo());
        wrapper.eq(StrUtil.isNotBlank(training.getTrainingType()), "training_type", training.getTrainingType());
        wrapper.eq(StrUtil.isNotBlank(training.getTrainingState()), "training_state", training.getTrainingState());

        //若查询条件来源于实体中的params，则需要手动补全查询条件
        String beginTrainingDate = (String) training.getParams().get("beginTrainingDate");
        String endTrainingDate = (String) training.getParams().get("endTrainingDate");
        wrapper.ge(StrUtil.isNotBlank(beginTrainingDate), "training_date", beginTrainingDate);
        wrapper.le(StrUtil.isNotBlank(endTrainingDate), "training_date", endTrainingDate);

        //数据过滤
        Object scope = training.getParams().get(DataScopeAspect.DATA_SCOPE);
        if(null != scope){
            wrapper.apply(ObjectUtil.isNotNull(scope), scope.toString());
        }

        return wrapper;
    }
}
