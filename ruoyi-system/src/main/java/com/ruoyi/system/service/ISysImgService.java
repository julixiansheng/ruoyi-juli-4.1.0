package com.ruoyi.system.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.service.BaseService;
import com.ruoyi.system.domain.SysImg;
import java.util.List;

/**
 * 轮播图片Service接口
 * 
 * @author julisir
 * @date 2019-12-03
 */
public interface ISysImgService extends BaseService<SysImg>
{

    /**
     * 查询轮播图片
     * 
     * @param id 轮播图片ID
     * @return 轮播图片
     */
    public SysImg getSysImgById(Long id);

    /**
     * 查询轮播图片列表
     *
     * @param sysImg 轮播图片
     * @param page 分页
     * @return 轮播图片集合
     */
    public TableDataInfo getSysImgList(SysImg sysImg, Page page);

    /**
     * 查询轮播图片列表
     * 
     * @param sysImg 轮播图片
     * @return 轮播图片集合
     */
    public List<SysImg> getSysImgList(SysImg sysImg);

    /**
     * 新增轮播图片
     * 
     * @param sysImg 轮播图片
     * @return 结果
     */
    public int insertSysImg(SysImg sysImg);

    /**
     * 修改轮播图片
     * 
     * @param sysImg 轮播图片
     * @return 结果
     */
    public int updateSysImg(SysImg sysImg);

    /**
     * 批量删除轮播图片
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteSysImgByIds(String[] ids);

}
