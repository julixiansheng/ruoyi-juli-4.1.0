package com.ruoyi.moudels.test.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.common.annotation.DataScope;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.service.impl.BaseServiceImpl;
import com.ruoyi.common.utils.sql.SqlUtil;
import com.ruoyi.framework.aspectj.DataScopeAspect;
import com.ruoyi.moudels.test.domain.Person;
import com.ruoyi.moudels.test.mapper.PersonMapper;
import com.ruoyi.moudels.test.service.IPersonService;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

/**
 * 人员Service业务层处理
 *
 * @author ruoyi
 * @date 2019-11-26
 */
@Service
public class PersonServiceImpl extends BaseServiceImpl<PersonMapper, Person> implements IPersonService {

    /**
     * 查询人员
     *
     * @param id 人员ID
     * @return 人员
     */
    @Override
    public Person getPersonById(Long id) {
        return baseMapper.selectById(id);
    }


    /**
     * 查询人员列表
     *
     * @param person 人员
     * @param page   分页
     * @return 人员
     */
    @DataScope
    @Override
    public TableDataInfo getPersonList(Person person, Page page) {
        IPage iPage = baseMapper.selectPage(page, getWrapper(person));
        return getDataTable(page);
    }

    /**
     * 查询人员列表
     *
     * @param person 人员
     * @return 人员
     */
    @DataScope
    @Override
    public List<Person> getPersonList(Person person) {
        return baseMapper.selectList(getWrapper(person));
    }

    /**
     * 新增人员
     *
     * @param person 人员
     * @return 结果
     */
    @Override
    public int insertPerson(Person person) {
        return baseMapper.insert(person);
    }

    /**
     * 修改人员
     *
     * @param person 人员
     * @return 结果
     */
    @Override
    public int updatePerson(Person person) {
        return baseMapper.updateById(person);
    }

    /**
     * 删除人员对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deletePersonByIds(String[] ids) {
        return baseMapper.deleteBatchIds(Arrays.asList(ids));
    }


    /**
     * 根据实体获得 Wrapper
     *
     * @param person 人员
     * @return 查询条件
     */
    private QueryWrapper<Person> getWrapper(Person person) {

        QueryWrapper<Person> wrapper = new QueryWrapper<>();

        wrapper.like(StrUtil.isNotBlank(person.getName()), "name" , SqlUtil.dealSpecialCharUseLike(person.getName()));
        wrapper.eq(ObjectUtil.isNotNull(person.getAge()), "age" , person.getAge());
        wrapper.eq(ObjectUtil.isNotNull(person.getSex()), "sex" , person.getSex());
        wrapper.eq(ObjectUtil.isNotNull(person.getJob()), "job" , person.getJob());

        String beginJobDate = (String) person.getParams().get("beginJobDate");
        String endJobDate = (String) person.getParams().get("endJobDate");
        wrapper.ge(StrUtil.isNotBlank(beginJobDate), "job_date", beginJobDate);
        wrapper.le(StrUtil.isNotBlank(endJobDate), "job_date", endJobDate);
        //数据过滤
        Object scope = person.getParams().get(DataScopeAspect.DATA_SCOPE);
        if (ObjectUtil.isNotNull(scope)) {
            wrapper.apply(scope.toString());
        }

        return wrapper;
    }
}
