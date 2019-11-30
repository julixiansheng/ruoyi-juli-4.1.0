package com.ruoyi.moudels.test.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.service.BaseService;
import com.ruoyi.moudels.test.domain.Person;
import java.util.List;

/**
 * 人员Service接口
 * 
 * @author ruoyi
 * @date 2019-11-26
 */
public interface IPersonService extends BaseService<Person>
{
    /**
     * 查询人员
     * 
     * @param id 人员ID
     * @return 人员
     */
    public Person getPersonById(Long id);

    /**
     * 查询人员列表
     *
     * @param person 人员
     * @param page 分页
     * @return 人员集合
     */
    public TableDataInfo getPersonList(Person person, Page page);

    /**
     * 查询人员列表
     * 
     * @param person 人员
     * @return 人员集合
     */
    public List<Person> getPersonList(Person person);

    /**
     * 新增人员
     * 
     * @param person 人员
     * @return 结果
     */
    public int insertPerson(Person person);

    /**
     * 修改人员
     * 
     * @param person 人员
     * @return 结果
     */
    public int updatePerson(Person person);

    /**
     * 批量删除人员
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deletePersonByIds(String[] ids);

}
