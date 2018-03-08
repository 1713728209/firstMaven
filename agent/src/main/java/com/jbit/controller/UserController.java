package com.jbit.controller;
import com.jbit.entity.*;
import com.jbit.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
/**
 * Created by Administrator on 2018/1/31.
 */
@Controller
public class UserController {
    @Resource
    private SysUserService sysUserService;

    @Resource
    private AsRoleService asRoleService;

    @Resource
    private AsLogsService asLogsService;

    @Resource
    private AsAccountdetailService asAccountdetailService;

    @Resource
    private AsAccountService asAccountService;

    @Resource
    private AsFunctionService asFunctionService;

    @Resource
    private AsRolePremissionService asRolePremissionService;

    @Resource
    private AsSystemconfigService asSystemconfigService;

    @Resource
    private AsCustomsService asCustomsService;

    @Resource
    private HatAreaService hatAreaService;

    @Resource
    private HatCitySerivce hatCitySerivce;

    @Resource
    private HatProvinceService hatProvinceService;

    @Resource
    private AsKeywordsService asKeywordsService;

    @Resource
    private AsContactsService asContactsService;

    //用户登录
    @RequestMapping(value = "login",method = RequestMethod.POST)
    public String login(Model model, String userCode, String userPassword, HttpSession session){
        List<AsUser> list=sysUserService.findByLogin(userCode,userPassword);
        if(!list.isEmpty()){
            session.setAttribute("user",list.get(0));
            sysUserService.updateLastLoginTime(new Date(),list.get(0).getId());

            //省 、市、区
            List<HatArea> areaList=hatAreaService.findAll();
            List<HatCity> cityList=hatCitySerivce.findAll();
            List<HatProvince> provinceList=hatProvinceService.findList();
            session.setAttribute("areaList",areaList);
            session.setAttribute("cityList",cityList);
            session.setAttribute("provinceList",provinceList);
            return "redirect:mainData";
        }else{
            return "pages/login";
        }
    }

    //查询对应登录用户的角色的权限
    @RequestMapping(value = "mainData")
    public String mainData(Model model,HttpSession session,Integer roleId2){
        AsUser user= (AsUser) session.getAttribute("user");
        Double count=asAccountService.findMoneyByid(user.getId());
        model.addAttribute("count",count);

        List<Integer> idlist=new ArrayList<Integer>();
        Integer roleId=null;
        if(roleId2!=null){
            model.addAttribute("roleId",roleId2);
            roleId=roleId2;
        }else {
            roleId=user.getRoleid();
        }
        List<AsRolePremission>  permissionList=asRolePremissionService.findFunctionIdListByRoleId(roleId);//通过登录用户的角色id获取角色权限的集合
        for(AsRolePremission premission :permissionList){
            idlist.add(premission.getFunctionid());
        }
        List<AsFunction> functionList=asFunctionService.findAllFunction(idlist);
        List<AsFunction> parentFunctionList=new ArrayList<AsFunction>();//父节点集合
        List<AsFunction> childFunctionList=new ArrayList<AsFunction>();//子节点集合
        for (AsFunction function : functionList){
            if(function.getParentid()>0){
                childFunctionList.add(function);
            }
        }
        parentFunctionList=asFunctionService.findParentFunction();
        session.setAttribute("functionList",functionList);//角色权限
        session.setAttribute("parentFunctionList",parentFunctionList);
        session.setAttribute("childFunctionList",childFunctionList);//所有权限
//        for (AsFunction asFunction:functionList) {
//            childFunctionList.remove(asFunction);
//        }
//        List<AsFunction> leftList=childFunctionList;
//        model.addAttribute("leftList",leftList);
        if(roleId2!=null){
            return "pages/functionlist";
        }else{
            return "pages/main";
        }
    }

    @RequestMapping(value = "findkeyWordsServiceType")
    public String getkeyWordsServiceType(Model model){
        List<AsSystemconfig> list=asSystemconfigService.findkeyWordsServiceType();
        model.addAttribute("list",list);
        return "pages/keyword";
    }

    @RequestMapping(value = "loadCustoms")
    @ResponseBody
    public List<AsCustoms> loadCustoms(){
        List<AsCustoms> list=asCustomsService.findAsCustomsList(null,null,null);
        return list;
    }

    @RequestMapping(value = "valikeyword")
    @ResponseBody
    public String valikeyword(String keywords){
        List<AsKeywords> list=asKeywordsService.findAll();
        for (AsKeywords askeywords:list){
            if(askeywords.getKeywords().equals(keywords)){
                return "falied";
            }
        }
        return "success";
    }

    @RequestMapping(value = "jisuan")
    @ResponseBody
    public String jisuan(Integer serviceType,Integer years ){
        Integer count=null;
       if(serviceType==12){
           //上传苹果商城1000元/年
           count=1000*years;
       }
        if(serviceType==13){
            //上传苹果商城2000元/年
            count=2000*years;
        }
        return Integer.toString(count);
    }

    @RequestMapping(value = "submitkeyword")
    @ResponseBody
    public String submitkeyword(Integer serviceType,Integer years ,Integer customid,String customname,String keywords,HttpSession session){
        Double count=null;//计算申请关键词所需的钱
        if(serviceType==12){
            //上传苹果商城1000元/年
            count=(1000.0*years);
        }
        if(serviceType==13){
            //上传苹果商城2000元/年
            count=2000.0*years;
        }
        AsUser user= (AsUser) session.getAttribute("user");
        Double countUser=asAccountService.findMoneyByid(user.getId());//用户帐户上的钱
        if(count>countUser){
            return "nomoney";
        }else{
            return count.toString();
        }
    }

    @RequestMapping(value = "addKeywords")
    @ResponseBody
    public String addKeywords(String count,Integer serviceType,Integer years ,Integer customid,String customname,String keywords,HttpSession session){
        AsUser user= (AsUser) session.getAttribute("user");
        Double userCount=asAccountService.findMoneyByid(user.getId());//用户余额
        AsKeywords asKeywords=new AsKeywords();
        asKeywords.setSystemconfigid(serviceType);
        asKeywords.setCustomid(customid);
        asKeywords.setAgentid(user.getId());
        asKeywords.setPrice(Double.parseDouble(count));//关键词花费的钱
        asKeywords.setOpenapp(1);
        asKeywords.setRegdatetime(new Date());
        asKeywords.setIspass(1);
        asKeywords.setCheckstatus(1);
        asKeywords.setIsuse(2);
        asKeywords.setKeywords(keywords);
        asKeywordsService.insertAsKeywords(asKeywords);
        asAccountService.updateMoney((userCount-Double.parseDouble(count)),user.getId());//更新用户余额
        return "申请成功";
    }

    @RequestMapping(value = "exit")
    public String exit(HttpSession session){
        session.removeAttribute("user");
        return "pages/login";
    }

    @RequestMapping(value = "modifypwd")
    @ResponseBody
    public String modifypwd(HttpSession session,String oldpwd,String newpwd,Integer isStart,String newpwd2){
        AsUser user= (AsUser) session.getAttribute("user");
        if(!oldpwd.equals(user.getUserpassword())){
            return  "oldpwddif";
        }
        if(!newpwd.equals(newpwd2)){
            return "2pwddif";
        }
        AsUser asUser=new AsUser();
        asUser.setId(user.getId());
        asUser.setIsstart(1);
        asUser.setUserpassword(newpwd);
        sysUserService.updatePassword(asUser);
        return "success";
    }

    //分页显示关键词
    @RequestMapping(value = "keywordsList")
    public String keywordsList( Model model,Integer pageIndex,String opt,String keywords){
        PageFactory pageFactory=new PageFactory();
        pageFactory.setTotalCount(asKeywordsService.findAsKeywordsCount(keywords));
        pageFactory.setPageIndex(pageIndex);
        pageFactory.init();
        List<AsKeywords> list=asKeywordsService.findListBySearch((pageFactory.getPageIndex()-1)*pageFactory.getPageSize(),pageFactory.getPageSize(),keywords);
        model.addAttribute("list",list);
        model.addAttribute("pageIndex",pageFactory.getPageIndex());
        model.addAttribute("pageFactory",pageFactory);
        model.addAttribute("keywords",keywords);
        if(opt==null){
            return "pages/keywordmanage";
        }else{
            model.addAttribute("opt",opt);
            return "pages/checkkeyword";
        }
    }

    @RequestMapping(value = "deletekeyword")
    @ResponseBody
    public String deletekeyword(Integer id){
        asKeywordsService.deleteById(id);
        return "success";
    }

    @RequestMapping(value = "getById")
    public String getById(Integer id, String opt, Model model){
       List<AsKeywords> list=asKeywordsService.findAll();
       for (AsKeywords asKeywords:list){
           if(asKeywords.getId()==id){
               model.addAttribute("keywords",asKeywords);
           }
       }
        if(opt=="open"){
            return "pages/openapp";
        }else{
            return "pages/xufei";
        }
    }

    @RequestMapping(value = "searchKeyword")
    public String searchKeyword(String keywords, Integer pageIndex, Model model){
        PageFactory pageFactory=new PageFactory();
        pageFactory.setTotalCount(asKeywordsService.findAsKeywordsCount(keywords));
        pageFactory.setPageIndex(pageIndex);
        pageFactory.init();
        List<AsKeywords> list= asKeywordsService.findListBySearch((pageFactory.getPageIndex()-1)*pageFactory.getPageSize(),pageFactory.getPageSize(),keywords);
        model.addAttribute("list",list);
        model.addAttribute("pageIndex",pageFactory.getPageIndex());
        model.addAttribute("pageFactory",pageFactory);
        model.addAttribute("keywords",keywords);
        return "pages/keywordmanage";
    }

    @RequestMapping(value = "customlist")
    public String customlist(Integer pageIndex, Model model,String cname){
        PageFactory pageFactory=new PageFactory();
        if(cname==null){
            pageFactory.setTotalCount(asCustomsService.findCount(null));
        }else{
            pageFactory.setTotalCount(asCustomsService.findCount(cname));
        }
        pageFactory.setPageIndex(pageIndex);
        pageFactory.init();
        List<AsCustoms> list=null;
        if(cname==null){
           list= asCustomsService.findAsCustomsList((pageFactory.getPageIndex()-1)*pageFactory.getPageSize(),pageFactory.getPageSize(),null);
        }else {
            list= asCustomsService.findAsCustomsList((pageFactory.getPageIndex()-1)*pageFactory.getPageSize(),pageFactory.getPageSize(),cname);
        }
        model.addAttribute("list",list);
        model.addAttribute("pageIndex",pageFactory.getPageIndex());
        model.addAttribute("pageFactory",pageFactory);
        model.addAttribute("cname",cname);
        return "pages/customlist";
    }

    @RequestMapping(value = "getCustomById")
    public String getCustomById(Integer id, Model model,String opt,HttpSession session){
        List<AsCustoms> list=asCustomsService.findAsCustomsList(null,null,null);
        for (AsCustoms custom :list){
            if(custom.getId()==id){
                model.addAttribute("custom",custom);
            }
        }
        List<AsContacts> contactsList= asContactsService.findListByCustOmId(id);
        model.addAttribute("contactsList",contactsList);
        if(opt.equals("view")){
            return "pages/viewcustom";
        }else{
            return "pages/modifycustom";
        }
    }

    @RequestMapping(value = "loadcity")
    @ResponseBody
    public List<HatCity> loadcity(Integer provinceId, Model model,HttpSession session){
        List<HatCity> hatCityList=hatCitySerivce.findCityListByProviceId(provinceId);
        return hatCityList;
    }

    @RequestMapping(value = "loadarea")
    @ResponseBody
    public List<HatArea> loadarea(Integer cityId, Model model,HttpSession session){
        List<HatArea> hatAreaList=hatAreaService.findAreaListByCityId(cityId);
        return hatAreaList;
    }

    @RequestMapping(value = "isExitCustomName")
    @ResponseBody
    public String isExitCustomName(String customName, Model model,HttpSession session){
        List<AsCustoms> list=asCustomsService.findAsCustomsList(null,null,null);
        for (AsCustoms asCustoms:list){
            if(asCustoms.getCustomname().equals(customName)){
                return "peat";
            }
        }
        return "nopeat";
    }

    @RequestMapping(value = "modifysavecustom",method = RequestMethod.POST)
    public String modifysavecustom(AsCustoms asCustoms){
        asCustomsService.updateAscustom(asCustoms);
        return "redirect:customlist";
    }

    @RequestMapping(value = "modifycustomstatus")
    @ResponseBody
    public String modifycustomstatus(Integer id,Integer customStatus){
        asCustomsService.updateStatus(id, customStatus);
        if(customStatus==1){
            asCustomsService.updateStatus(id, 2);
        }else if(customStatus==2){
            asCustomsService.updateStatus(id, 1);
        }
        return "success";
    }

    @RequestMapping(value = "addsavecustom",method = RequestMethod.POST)
    public String addsavecustom(AsCustoms asCustoms,HttpSession session){
        AsUser user=(AsUser) session.getAttribute("user");
        asCustoms.setAgentid(user.getId());
        asCustomsService.insertAscustom(asCustoms);
        return "redirect:customlist";
    }

    //预付款分页
    @RequestMapping(value = "yfk")
    public String yfk(HttpSession session, Model model,Integer pageIndex,String detailtype, String starttime, String endtime,Integer userId){
        List<AsSystemconfig> list=asSystemconfigService.findYfkServiceType();
        model.addAttribute("list",list);

        PageFactory pageFactory=new PageFactory();
        pageFactory.setTotalCount(asAccountdetailService.findCount(detailtype, starttime, endtime,userId));
        pageFactory.setPageIndex(pageIndex);
        pageFactory.init();
        List<AsAccountdetail> detaillist=asAccountdetailService.findPageList((pageFactory.getPageIndex()-1)*pageFactory.getPageSize(),pageFactory.getPageSize(),detailtype, starttime, endtime,userId);
        model.addAttribute("pageFactory",pageFactory);
        model.addAttribute("detaillist",detaillist);
        model.addAttribute("pageIndex",pageFactory.getPageIndex());
        model.addAttribute("detailtype",detailtype);
        model.addAttribute("starttime",starttime);
        model.addAttribute("endtime",endtime);
        model.addAttribute("userId",userId);
        return "pages/yfk";
    }

    //日志分页
    @RequestMapping(value = "findAsLogsList")
    public String findAsLogsList(Model model,Integer pageIndex,Integer userId){
        PageFactory pageFactory=new PageFactory();
        pageFactory.setTotalCount(asLogsService.findCount(userId));
        pageFactory.setPageIndex(pageIndex);
        pageFactory.init();
        List<AsLogs> list=asLogsService.findPageList((pageFactory.getPageIndex()-1)*pageFactory.getPageSize(),pageFactory.getPageSize(),userId);
        model.addAttribute("pageFactory",pageFactory);
        model.addAttribute("list",list);
        model.addAttribute("pageIndex",pageFactory.getPageIndex());
        model.addAttribute("userId",userId);
        return "pages/logs";
    }

    //报表管理
    @RequestMapping(value = "report")
    public String report(Model model){
        List<AsAccountdetail> firstList=new ArrayList<AsAccountdetail>();
        List<AsAccountdetail> secondList=new ArrayList<AsAccountdetail>();
        List<AsAccountdetail> thirdList=new ArrayList<AsAccountdetail>();
        List<AsAccountdetail> fouthList=new ArrayList<AsAccountdetail>();
        List<AsAccountdetail> list=asAccountdetailService.findPageList(null,null,null,null,null,null);
        System.out.println(list);
         for (AsAccountdetail asAccountdetail:list){
             if(asAccountdetail.getSystemconfigid()>=1  && asAccountdetail.getSystemconfigid()<=4){
                 firstList.add(asAccountdetail);
             }else if(asAccountdetail.getSystemconfigid()>=5 && asAccountdetail.getSystemconfigid()<=7){
                 secondList.add(asAccountdetail);
             }else if(asAccountdetail.getSystemconfigid()>=8 && asAccountdetail.getSystemconfigid()<=9){
                 thirdList.add(asAccountdetail);
             } else if(asAccountdetail.getSystemconfigid()>=10 && asAccountdetail.getSystemconfigid()<=11){
                 fouthList.add(asAccountdetail);
             }
         }
        model.addAttribute("firstList",firstList);
        model.addAttribute("secondList",secondList);
        model.addAttribute("thirdList",thirdList);
        model.addAttribute("fouthList",fouthList);
        return "pages/report";
    }

    //报表管理
    @RequestMapping(value = "caiwu")
    public String caiwu(Model model){
        List<AsSystemconfig> list=asSystemconfigService.findYfkServiceType();
        model.addAttribute("list",list);
        return "pages/caiwu";
    }

    @RequestMapping(value = "searchuser")
    @ResponseBody
    public List<AsUser> searchuser(Model model){
        List<AsUser> list=sysUserService.findAll();
        return list;
    }

    @RequestMapping(value = "opeaccount")
    @ResponseBody
    public String opeaccount(Model model,AsAccountdetail asAccountdetail,HttpSession session){
        AsUser user=(AsUser) session.getAttribute("user");
        asAccountdetail.setDetaildatetime(new Date());
        asAccountdetailService.insertAsAccountdetail(asAccountdetail);//添加数据
        //修改用户余额
        asAccountService.updateMoney(asAccountService.findMoneyByid(user.getId())+asAccountdetail.getMoney(),user.getId());
        return  "success";
    }

    @RequestMapping(value = "rolelist")
    public String rolelist(Model model){
        List<AsRole> roleList=asRoleService.findAll();
        model.addAttribute("roleList",roleList);
        return  "pages/rolelist";
    }

    @RequestMapping(value = "editrole")
    @ResponseBody
    public String editrole(Model model,String type,AsRole role,HttpSession session){
        AsUser user= (AsUser)session.getAttribute("user");
        List<AsRole> list=asRoleService.findAll();
        for (AsRole asRole:list){
            if(asRole.getRolename().equals(role.getRolename())){
                return "repeat";//角色名称重复，无法修改
            }
        }
        if(type.equals("add")){
            role.setCreationtime(new Date());
            role.setCreatedby(user.getUsercode());
            asRoleService.insertRole(role);
            return "success";//添加角色
        }else {
            role.setLastupdatetime(new Date());
            asRoleService.updateAsRole(role);
            return  "success";//修改角色
        }
    }

    @RequestMapping(value = "delrole")
    @ResponseBody
    public String delrole(Integer id){
        //角色对应的用户存在，无法删除
       List<AsUser> list= sysUserService.findAll();
       for (AsUser asUser:list){
           if(asUser.getRoleid()==id){
               return asUser.getUsercode();//返回用户帐号
           }
       }
       try {
           asRoleService.deleteRole(id);
       }catch (Exception e){
           e.printStackTrace();
           return "failed";
       }
        return  "success";
    }

    @RequestMapping(value = "premission")
    public String premission(Model model){
        List<AsRole> list=asRoleService.findAll();
        model.addAttribute("list",list);
        return  "pages/premission";
    }

    @RequestMapping(value = "funclist")
    public String funclist(Model model,Integer roleId){
        List<AsRole> list=asRoleService.findAll();
        model.addAttribute("list",list);
        return  "pages/premission";
    }

    @RequestMapping(value = "saverolefunc")
    @ResponseBody
    public String saverolefunc(Integer roleId,String checkFuncList,HttpSession session){
        //用户原来修改前的权限
        List<AsRolePremission> zijiPremission=asRolePremissionService.findFunctionIdListByRoleId(roleId);
        for (AsRolePremission asRolePremission:zijiPremission){
            //删除所有用户原来的权限
            asRolePremissionService.deleteAsRolePremission(asRolePremission);
        }
        //所有的权限
        List<AsRolePremission> allPremission=asRolePremissionService.findAll();
        //用户修改后的权限集合functionid
        Integer[] idlist=null;
       String[] strList=checkFuncList.split(",");
       System.out.println(strList);
       for (int i=0;i<strList.length;i++){
          idlist[i]=Integer.parseInt(strList[i]);
        }
        //用户修改后的权限集合
        List<AsRolePremission> updatePremission=asRolePremissionService.findByFunctionIdList(idlist);
        for (AsRolePremission asRolePremission:updatePremission){
            asRolePremission.setLastupdatetime(new Date());
            //添加所有用户修改后的权限
            asRolePremissionService.insertAsRolePremission(asRolePremission);
        }
        return  "success";
    }

    //用户分页
    @RequestMapping(value = "userlist")
    public String userlist(Model model,Integer pageIndex,String username, Integer roleid, String isstart){
        PageFactory pageFactory=new PageFactory();
        pageFactory.setTotalCount(sysUserService.findCount( username,  roleid,  isstart));
        pageFactory.setPageIndex(pageIndex);
        pageFactory.init();
        List<AsUser> list=sysUserService.findPageList((pageFactory.getPageIndex()-1)*pageFactory.getPageSize(),pageFactory.getPageSize(), username,  roleid,  isstart);
        model.addAttribute("list",list);
        model.addAttribute("pageFactory",pageFactory);
        model.addAttribute("pageIndex",pageFactory.getPageIndex());
        List<AsRole> roleList=asRoleService.findAll();
        model.addAttribute("roleList",roleList);
        model.addAttribute("username",username);
        model.addAttribute("roleid",roleid);
        model.addAttribute("isstart",isstart);
        return  "pages/userlist";
    }

    //添加用户
    @RequestMapping(value = "edituser")
    @ResponseBody
    public String edituser(String type,AsUser asUser,HttpSession session){
        List<AsUser> list=sysUserService.findAll();
        for (AsUser asUser1 :list){
            if(asUser1.getUsercode().equals(asUser.getUsercode())){
                return  "repeat";
            }
        }
        if(!type.equals("modify")){
            AsUser user=(AsUser)session.getAttribute("user");
            asUser.setCreationtime(new Date());
            asUser.setCreatedby(user.getUsercode());
            sysUserService.insertUser(asUser);
            return  "success";
        }else{
            asUser.setLastupdatetime(new Date());
            sysUserService.updateUser(asUser);
            return "success";
        }
    }

    @RequestMapping(value = "deluser")
    @ResponseBody
    public String deluser(Integer id){
        sysUserService.deleteUser(id);
        return "success";
    }

    @RequestMapping(value = "checkkeyword")
    public String checkkeyword(Model model){
        List<AsKeywords> list=asKeywordsService.findAll();
        model.addAttribute("list",list);
        return "pages/checkkeyword";
    }

    //修改关键词状态
    @RequestMapping(value = "updatekeyword")
    @ResponseBody
    public String updatekeyword(AsKeywords asKeywords){
       asKeywordsService.updateAskeywords(asKeywords);
        return "success";
    }

}
