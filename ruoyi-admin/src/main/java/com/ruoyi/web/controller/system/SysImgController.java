package com.ruoyi.web.controller.system;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.exception.file.FileSizeLimitExceededException;
import com.ruoyi.common.exception.file.InvalidExtensionException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.common.utils.file.MimeTypeUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.SysFile;
import com.ruoyi.system.domain.SysImg;
import com.ruoyi.system.service.ISysFileService;
import com.ruoyi.system.service.ISysImgService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * 轮播图片Controller
 *
 * @author julisir
 * @date 2019-12-03
 */
@Controller
@RequestMapping("/system/img")
public class SysImgController extends BaseController {
    private String prefix = "system/img";

    @Autowired
    private ISysImgService sysImgService;

    @Autowired
    private ISysFileService sysFileService;

    @RequiresPermissions("system:img:view")
    @GetMapping()
    public String img() {
        return prefix + "/img";
    }

    /**
     * 查询轮播图片列表
     */
    @RequiresPermissions("system:img:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SysImg sysImg) {
        return sysImgService.getSysImgList(sysImg, getPage());
    }

    /**
     * 导出轮播图片列表
     */
    @RequiresPermissions("system:img:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SysImg sysImg) {
        List<SysImg> list = sysImgService.getSysImgList(sysImg);
        ExcelUtil<SysImg> util = new ExcelUtil<SysImg>(SysImg.class);
        return util.exportExcel(list, "img");
    }

    /**
     * 新增轮播图片
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存轮播图片
     */
    @RequiresPermissions("system:img:add")
    @Log(title = "轮播图片", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(@RequestParam("file") MultipartFile file, SysImg sysImg) {

        try {
            FileUploadUtils.assertAllowed(file, MimeTypeUtils.IMAGE_EXTENSION);
        } catch (FileSizeLimitExceededException ignored) {
            return AjaxResult.error("文件大小超出限制(" + ignored.getMessage() + "M)");
        } catch (InvalidExtensionException e) {
            return AjaxResult.error("文件扩展名无效");
        }
        Long fileId = sysFileService.saveFile(file);
        sysImg.setFileId(fileId);
        sysImg.setImgName(file.getOriginalFilename());
        sysImg.setImgUrl("/system/file/download/" + fileId);
        return toAjax(sysImgService.insertSysImg(sysImg));
    }

    /**
     * 修改轮播图片
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {
        SysImg sysImg = sysImgService.getSysImgById(id);
        SysFile sysFile = sysFileService.getSysFileById(sysImg.getFileId());
        mmap.put("sysFile", sysFile);
        mmap.put("sysImg", sysImg);
        return prefix + "/edit";
    }

    /**
     * 修改保存轮播图片
     */
    @RequiresPermissions("system:img:edit")
    @Log(title = "轮播图片", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(@RequestParam("file") MultipartFile file, SysImg sysImg) {
        try {
            //当文件存在并且文件名不为空时候进行后缀名和文件大小校验
            if (!file.isEmpty() && StringUtils.isNotBlank(file.getOriginalFilename())) {
                FileUploadUtils.assertAllowed(file, MimeTypeUtils.IMAGE_EXTENSION);
            }
        } catch (FileSizeLimitExceededException ignored) {
            return AjaxResult.error("文件大小超出限制(" + ignored.getMessage() + "M)");
        } catch (InvalidExtensionException e) {
            return AjaxResult.error("文件扩展名无效");
        }
        if (!file.isEmpty()) {
            //删除源文件和文件记录
            sysFileService.deleteFile(sysImg.getFileId());
            //上传新文件
            Long fileId = sysFileService.saveFile(file);
            sysImg.setFileId(fileId);
            sysImg.setImgName(file.getOriginalFilename());
            sysImg.setImgUrl("/system/file/download/" + fileId);
        }
        return toAjax(sysImgService.updateSysImg(sysImg));
    }

    /**
     * 删除轮播图片
     */
    @RequiresPermissions("system:img:remove")
    @Log(title = "轮播图片", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String[] ids) {
        return toAjax(sysImgService.deleteSysImgByIds(ids));
    }
}
