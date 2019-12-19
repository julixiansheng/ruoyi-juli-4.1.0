package com.ruoyi.moudels.test.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.moudels.test.domain.Person;
import com.ruoyi.moudels.test.service.IPersonService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 人员Controller
 * 
 * @author julisir
 * @date 2019-11-26
 */
@Controller
@RequestMapping("/test/person")
public class PersonController extends BaseController
{
    private String prefix = "test/person";

    @Autowired
    private IPersonService personService;

    @RequiresPermissions("test:person:view")
    @GetMapping()
    public String person()
    {
        return prefix + "/person";
    }

    /**
     * 查询人员列表
     */
    @RequiresPermissions("test:person:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Person person)
    {
        return personService.getPersonList(person, getPage());
    }

    /**
     * 导出人员列表
     */
    @RequiresPermissions("test:person:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Person person)
    {
        List<Person> list = personService.getPersonList(person);
        ExcelUtil<Person> util = new ExcelUtil<Person>(Person.class);
        return util.exportExcel(list, "person");
    }

    /**
     * 新增人员
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存人员
     */
    @RequiresPermissions("test:person:add")
    @Log(title = "人员", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Person person)
    {
        return toAjax(personService.insertPerson(person));
    }

    /**
     * 修改人员
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        Person person = personService.getPersonById(id);
        mmap.put("person", person);
        return prefix + "/edit";
    }

    /**
     * 修改保存人员
     */
    @RequiresPermissions("test:person:edit")
    @Log(title = "人员", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Person person)
    {
        return toAjax(personService.updatePerson(person));
    }

    /**
     * 删除人员
     */
    @RequiresPermissions("test:person:remove")
    @Log(title = "人员", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String[] ids)
    {
        return toAjax(personService.deletePersonByIds(ids));
    }
}
