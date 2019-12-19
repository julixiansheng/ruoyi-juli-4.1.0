package com.ruoyi.system.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.service.impl.BaseServiceImpl;
import com.ruoyi.common.utils.sql.SqlUtil;
import com.ruoyi.system.domain.SysImg;
import com.ruoyi.system.mapper.SysImgMapper;
import com.ruoyi.system.service.ISysFileService;
import com.ruoyi.system.service.ISysImgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 轮播图片Service业务层处理
 *
 * @author julisir
 * @date 2019-12-03
 */
@Service
public class SysImgServiceImpl extends BaseServiceImpl<SysImgMapper, SysImg> implements ISysImgService {

    @Autowired
    private ISysFileService sysFileService;

    /**
     * 查询轮播图片
     *
     * @param id 轮播图片ID
     * @return 轮播图片
     */
    @Override
    public SysImg getSysImgById(Long id) {
        return baseMapper.selectById(id);
    }

    /**
     * 查询轮播图片列表
     *
     * @param sysImg 轮播图片
     * @param page   分页
     * @return 轮播图片
     */
    @Override
    public TableDataInfo getSysImgList(SysImg sysImg, Page page) {
        IPage iPage = baseMapper.selectPage(page, getWrapper(sysImg));
        return getDataTable(iPage);
    }

    /**
     * 查询轮播图片列表
     *
     * @param sysImg 轮播图片
     * @return 轮播图片
     */
    @Override
    public List<SysImg> getSysImgList(SysImg sysImg) {
        return baseMapper.selectList(getWrapper(sysImg));
    }

    /**
     * 新增轮播图片
     *
     * @param sysImg 轮播图片
     * @return 结果
     */
    @Override
    public int insertSysImg(SysImg sysImg) {
        return baseMapper.insert(sysImg);
    }

    /**
     * 修改轮播图片
     *
     * @param sysImg 轮播图片
     * @return 结果
     */
    @Override
    public int updateSysImg(SysImg sysImg) {
        return baseMapper.updateById(sysImg);
    }

    /**
     * 删除轮播图片对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteSysImgByIds(String[] ids) {
        List<SysImg> sysImgs = baseMapper.selectBatchIds(Arrays.asList(ids));
        //文件id
        List<Long> fileIdList = sysImgs.stream().map(SysImg::getFileId).collect(Collectors.toList());
        List<String> fileIds = new ArrayList<>();
        fileIdList.forEach(fileId->{
            fileIds.add(String.valueOf(fileId));
        });
        sysFileService.deleteSysFileByIds(fileIds.toArray(new String[fileIds.size()]));
        return baseMapper.deleteBatchIds(Arrays.asList(ids));
    }


    /**
     * 根据实体获得 Wrapper
     *
     * @param sysImg 轮播图片
     * @return 查询条件
     */
    private QueryWrapper<SysImg> getWrapper(SysImg sysImg) {

        QueryWrapper<SysImg> wrapper = new QueryWrapper<>();

        wrapper.like(StrUtil.isNotBlank(sysImg.getImgName()), "img_name", SqlUtil.dealSpecialCharUseLike(sysImg.getImgName()));
        wrapper.eq(StrUtil.isNotBlank(sysImg.getIsDisplay()), "is_display", sysImg.getIsDisplay());
        wrapper.orderByAsc("img_order");
        //数据过滤
        Object scope = sysImg.getParams().get("dataScope");
        if (ObjectUtil.isNotNull(scope)) {
            wrapper.apply(scope.toString());
        }

        return wrapper;
    }
}
