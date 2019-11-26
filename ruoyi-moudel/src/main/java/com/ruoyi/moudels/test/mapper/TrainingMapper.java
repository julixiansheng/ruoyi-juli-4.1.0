package com.ruoyi.moudels.test.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.moudels.test.domain.Training;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 训练Mapper接口
 * 
 * @author yuanxy
 * @date 2019-11-25
 */
public interface TrainingMapper extends BaseMapper<Training>
{
    /**
     * 查询训练
     * 
     * @param id 训练ID
     * @return 训练
     */
    public Training selectTrainingById(Long id);

    /**
     * 查询训练列表
     * 
     * @param training 训练
     * @return 训练集合
     */
    public List<Training> selectTrainingList(Training training);

    /**
     * 新增训练
     * 
     * @param training 训练
     * @return 结果
     */
    public int insertTraining(Training training);

    /**
     * 修改训练
     * 
     * @param training 训练
     * @return 结果
     */
    public int updateTraining(Training training);

    /**
     * 删除训练
     * 
     * @param id 训练ID
     * @return 结果
     */
    public int deleteTrainingById(Long id);

    /**
     * 批量删除训练
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteTrainingByIds(String[] ids);
}
