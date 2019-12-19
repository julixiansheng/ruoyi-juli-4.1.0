package com.ruoyi.system.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.common.annotation.DataScope;
import com.ruoyi.common.config.JackRabbitConfig;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.service.impl.BaseServiceImpl;
import com.ruoyi.common.utils.sql.SqlUtil;
import com.ruoyi.system.domain.SysFile;
import com.ruoyi.system.mapper.SysFileMapper;
import com.ruoyi.system.service.ISysFileService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.jcr.*;
import java.io.InputStream;
import java.util.List;

/**
 * 文件Service业务层处理
 *
 * @author julisir
 * @date 2019-12-03
 */
@Slf4j
@Service
public class SysFileServiceImpl extends BaseServiceImpl<SysFileMapper, SysFile> implements ISysFileService {

    @Resource
    private JackRabbitConfig jackRabbitConfig;

    /**
     * 查询文件
     *
     * @param id 文件ID
     * @return 文件
     */
    @Override
    public SysFile getSysFileById(Long id) {
        return baseMapper.selectById(id);
    }

    /**
     * 查询文件列表
     *
     * @param sysFile 文件
     * @param page    分页
     * @return 文件
     */
    @DataScope
    @Override
    public TableDataInfo getSysFileList(SysFile sysFile, Page page) {
        IPage iPage = baseMapper.selectPage(page, getWrapper(sysFile));
        return getDataTable(page);
    }

    /**
     * 查询文件列表
     *
     * @param sysFile 文件
     * @return 文件
     */
    @DataScope
    @Override
    public List<SysFile> getSysFileList(SysFile sysFile) {
        return baseMapper.selectList(getWrapper(sysFile));
    }

    /**
     * 删除文件对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteSysFileByIds(String[] ids) {
        for (String id : ids) {
            deleteFile(Long.valueOf(id));
        }
        return 1;
    }

    /**
     * 保存文件
     *
     * @param file 文件
     * @return
     */
    @Transactional(rollbackFor = {RuntimeException.class})
    @Override
    public Long saveFile(MultipartFile file) {
        SysFile sysFile = new SysFile();
        sysFile.setFileName(file.getOriginalFilename());
        sysFile.setMimeType(file.getContentType());
        sysFile.setFileSize(file.getSize());

        baseMapper.insert(sysFile);

        try {
            InputStream is = file.getInputStream();

            //获取Session
            Session session = jackRabbitConfig.getSession();
            //获取根节点
            Node root = session.getRootNode();

            //给根节点添加一个文件节点
            Node filenode = root.addNode(sysFile.getId().toString());

            //给文件节点添加一个资源节点
            Node resourcenode = filenode.addNode("content");

            //设置资源节点的MIME类型
            resourcenode.setProperty("jcr:mimeType", "application/octest-stream");

            //设置待存入文件的输入流
            resourcenode.setProperty("file", is);

            //设置编码
            resourcenode.setProperty("jcr:encoding", "UTF-8");

            //保存文件
            session.save();

            //关闭输入流
            is.close();

            //注销Session
            session.logout();
        } catch (Exception e) {
            throw new RuntimeException("文件上传过程中出现异常，上传失败！", e);
        }

        return sysFile.getId();
    }

    /**
     * 删除文件
     *
     * @param fileId 文件id
     */
    @Transactional(rollbackFor = {RuntimeException.class})
    @Override
    public void deleteFile(Long fileId) {

        //获取Session
        Session session = jackRabbitConfig.getSession();

        try {
            //获取根节点
            Node root = session.getRootNode();

            //删除文件id对应节点
            root.getNode(fileId.toString()).remove();

            session.save();

            //注销Session
            session.logout();
        } catch (PathNotFoundException e) {
            log.warn("文件不存在，文件Id:" + fileId);
        } catch (Exception e) {
            throw new RuntimeException("文件删除过程中出现异常，删除失败！", e);
        }

        baseMapper.deleteById(fileId);
    }

    /**
     * 根据文件id从jackrabbit获取对应文件
     *
     * @param fileId 文件id
     * @return
     */
    @Override
    public InputStream getFileById(Long fileId) {

        //用于读取文件的输入流对象
        InputStream is = null;

        //获取Session
        Session session = jackRabbitConfig.getSession();

        try {
            //获取根节点
            Node root = session.getRootNode();
            Node node = root.getNode(fileId + "/content");
            is = node.getProperty("file").getStream();

        } catch (PathNotFoundException p) {
            log.warn("文件不存在，文件Id:" + fileId);
        } catch (RepositoryException e) {
            log.error("获取文件异常，文件Id:" + fileId, e);
        }
        return is;
    }


    /**
     * 根据实体获得 Wrapper
     *
     * @param sysFile 文件
     * @return 查询条件
     */
    private QueryWrapper<SysFile> getWrapper(SysFile sysFile) {

        QueryWrapper<SysFile> wrapper = new QueryWrapper<>();

        wrapper.like(StrUtil.isNotBlank(sysFile.getFileName()), "file_name", SqlUtil.dealSpecialCharUseLike(sysFile.getFileName()));
        //数据过滤
        Object scope = sysFile.getParams().get("dataScope");
        if (ObjectUtil.isNotNull(scope)) {
            wrapper.apply(scope.toString());
        }

        return wrapper;
    }


}
