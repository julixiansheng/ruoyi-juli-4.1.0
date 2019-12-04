package com.ruoyi.system.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.service.BaseService;
import com.ruoyi.system.domain.SysFile;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.List;

/**
 * 文件Service接口
 * 
 * @author yuanxy
 * @date 2019-12-03
 */
public interface ISysFileService extends BaseService<SysFile>
{

    /**
     * 查询文件
     * 
     * @param id 文件ID
     * @return 文件
     */
    public SysFile getSysFileById(Long id);

    /**
     * 查询文件列表
     *
     * @param sysFile 文件
     * @param page 分页
     * @return 文件集合
     */
    public TableDataInfo getSysFileList(SysFile sysFile, Page page);

    /**
     * 查询文件列表
     * 
     * @param sysFile 文件
     * @return 文件集合
     */
    public List<SysFile> getSysFileList(SysFile sysFile);


    /**
     * 批量删除文件
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteSysFileByIds(String[] ids);

    /**
     * 保存文件到jackrabbit
     *
     * @param file  文件
     * @return  文件id
     */
    public Long saveFile(MultipartFile file);

    /**
     * 删除文件
     *
     * @param fileId
     */
    public void deleteFile(Long fileId);

    /**
     * 得到文件输入流
     *
     * @param fileId 文件id
     * @return 文件流
     */
    public InputStream getFileById(Long fileId);
}
