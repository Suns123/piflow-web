package cn.cnic.controller;

import cn.cnic.base.util.ReturnMapUtils;
import cn.cnic.base.util.SessionUserUtil;
import cn.cnic.component.dashboard.service.IResourceService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("/dashboard")
public class DashboardCtrl {

    @Resource
    private IResourceService resourceServiceImpl;

    /**
     * resource info,include cpu,memory,disk
     *
     * @return
     */
    @RequestMapping("/resource")
    @ResponseBody
    public String getResourceInfo() {
        String username = SessionUserUtil.getCurrentUsername();
        String resourceInfo = resourceServiceImpl.getResourceInfo();
        return ReturnMapUtils.setSucceededCustomParamRtnJsonStr("resourceInfo", resourceInfo);
    }
}