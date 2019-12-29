package com.ruoyi.web.controller.system;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.file.FileUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.SysFile;
import com.ruoyi.system.service.ISysFileService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.util.List;

/**
 * 文件Controller
 *
 * @author julisir
 * @date 2019-12-03
 */
@Controller
@RequestMapping("/system/file")
public class SysFileController extends BaseController {
    private String prefix = "system/file";

    @Autowired
    private ISysFileService sysFileService;

    @RequiresPermissions("system:file:view")
    @GetMapping()
    public String file() {
        return prefix + "/file";
    }

    /**
     * 查询文件列表
     */
    @RequiresPermissions("system:file:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SysFile sysFile) {
        return sysFileService.getSysFileList(sysFile, getPage());
    }

    /**
     * 导出文件列表
     */
    @RequiresPermissions("system:file:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SysFile sysFile) {
        List<SysFile> list = sysFileService.getSysFileList(sysFile);
        ExcelUtil<SysFile> util = new ExcelUtil<SysFile>(SysFile.class);
        return util.exportExcel(list, "file");
    }

    /**
     * 删除文件
     */
    @RequiresPermissions("system:file:remove")
    @Log(title = "文件", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String[] ids) {
        return toAjax(sysFileService.deleteSysFileByIds(ids));
    }

    /**
     * 文件预览、下载
     *
     * @param fileId
     */
    @Log(title = "文件", businessType = BusinessType.OTHER)
    @GetMapping("/download/{fileId}")
    public void download(@PathVariable(value = "fileId") Long fileId, HttpServletRequest request, HttpServletResponse response) {

        SysFile sysFile = sysFileService.getSysFileById(fileId);

        try(InputStream is = sysFileService.getFileById(fileId)){

            response.setCharacterEncoding("utf-8");
            response.setContentType(sysFile.getMimeType());
            response.setHeader("Content-Disposition",
                    "attachment;fileName=" + FileUtils.setFileDownloadHeader(request, sysFile.getFileName()));

            ServletOutputStream outputStream = response.getOutputStream();
            byte[] bytes = new byte[is.available()];
            is.read(bytes);
            outputStream.write(bytes);

            outputStream.close();
        } catch (Exception e) {
            logger.error("下载文件失败", e);
        }
    }
}
