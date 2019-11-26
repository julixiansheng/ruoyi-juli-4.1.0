package com.ruoyi.moudels.test.service;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.service.BaseService;
import com.ruoyi.moudels.test.domain.Training;
import java.util.List;

/**
 * 训练Service接口
 * 
 * @author yuanxy
 * @date 2019-11-25
 */
public interface ITrainingService extends BaseService<Training>
{
    /**
     * 查询训练
     * 
     * @param id 训练ID
     * @return 训练
     */
    public Training getTrainingById(Long id);

    /**
     * 查询训练列表
     * 
     * @param training 训练
     * @param page 分页
     * @return 训练集合
     */
    public TableDataInfo getTrainingList(Training training, Page page);

    /**
     * 查询训练列表 (导出用)
     *
     * @param training  训练
     * @return  训练集合
     */
    public List<Training> getTrainingList(Training training);

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
     * 批量删除训练
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteTrainingByIds(String[] ids);

}
