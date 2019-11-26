package com.ruoyi.moudels.test.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.moudels.test.domain.Training;
import com.ruoyi.moudels.test.service.ITrainingService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 训练Controller
 *
 * @author yuanxy
 * @date 2019-11-25
 */
@Controller
@RequestMapping("/test/training")
public class TrainingController extends BaseController {
    private String prefix = "test/training";

    @Autowired
    private ITrainingService trainingService;

    @RequiresPermissions("test:training:view")
    @GetMapping()
    public String training() {
        return prefix + "/training";
    }

    /**
     * 查询训练列表
     */
    @RequiresPermissions("test:training:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Training training) {
        return trainingService.getTrainingList(training, getPage());
    }

    /**
     * 导出训练列表
     */
    @RequiresPermissions("test:training:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Training training) {
        List<Training> list = trainingService.getTrainingList(training);
        ExcelUtil<Training> util = new ExcelUtil<Training>(Training.class);
        return util.exportExcel(list, "training");
    }

    /**
     * 新增训练
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存训练
     */
    @RequiresPermissions("test:training:add")
    @Log(title = "训练", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Training training) {
        return toAjax(trainingService.insertTraining(training));
    }

    /**
     * 修改训练
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {
        Training training = trainingService.getTrainingById(id);
        mmap.put("training", training);
        return prefix + "/edit";
    }

    /**
     * 修改保存训练
     */
    @RequiresPermissions("test:training:edit")
    @Log(title = "训练", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Training training) {
        return toAjax(trainingService.updateTraining(training));
    }

    /**
     * 删除训练
     */
    @RequiresPermissions("test:training:remove")
    @Log(title = "训练", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String[] ids) {
        return toAjax(trainingService.deleteTrainingByIds(ids));
    }
}
