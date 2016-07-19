package com.courage.accountmanage.controller;

import com.alibaba.fastjson.JSON;
import com.courage.accountmanage.dao.IAccountDao;
import com.courage.accountmanage.model.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by courage on 2016/7/2.
 */

@RestController
@RequestMapping("/accountmanage")
public class AccoutManageCtr {

    @Autowired
    IAccountDao accountDao;

    @RequestMapping("/addAccount.do")
    @ResponseBody
    public int addAccount(@RequestBody Account account) {
        System.out.println(account.toString());
        return accountDao.addAccount(account);
    }

    @RequestMapping("/deleteAccount.do")
    @ResponseBody
    public int deleteAccount(@RequestParam String code) {
        return accountDao.deleteAccount(code);
    }

    @RequestMapping("/updateAccount.do")
    @ResponseBody
    public int updateAccount(@RequestBody Account account) {
        return accountDao.updateAccount(account);
    }

    @RequestMapping("/updateAccountState.do")
    @ResponseBody
    public int updateAccountState(@RequestParam String code, @RequestParam String state) {

        System.out.println("state="+state+"     "+"code="+ code);
        if(state.equals("封存")){
            state = "锁定";
        }else if(state.equals("启封")){
            state = "离线";
        }
        return accountDao.updateAccountState(code, state);
    }

    @RequestMapping("/selectAccounts.do")
    @ResponseBody
    public Map<String, Object> selectAccounts() {
        System.out.println("----------------------selct Accounts");
        List<Account> accounts = accountDao.selectAccounts();
        System.out.println(accounts.get(1).toString());
        System.out.println("----------------------end");
        Map<String,Object> map= new HashMap<String, Object>();
        map.put("data",JSON.toJSON(accounts));
        return map;
    }

//    @RequestMapping("/selectAccountsByContidtions.do")
//    public Map<String, Object> selectAccountsByContidtions(@RequestBody Account account) {
//        System.out.println("----------------------selct Accounts");
//
//        System.out.println("-------------selectAccountsByContidtions");
//        List<Account> accounts = accountDao.selectAccountsByContidtions(account);
//        System.out.println("----------------------end");
//        Map<String,Object> map= new HashMap<String, Object>();
//        map.put("data",JSON.toJSON(accounts));
//        return map;
//    }
    @RequestMapping(value = "/selectAccountsByContidtions.do",produces = "application/json;charset=utf-8")
    public Map<String, Object> selectAccountsByContidtions(@RequestParam(value = "code",required = false) String code,@RequestParam(value = "name",required = false) String name
    ,@RequestParam(value = "note",required = false) String note,@RequestParam(value = "daterange",required = false) String daterange,@RequestParam(value = "type",required = false) String type) {
        String [] str={"",""};
        if(!(daterange.equals(""))&&daterange!=null){
            System.out.println(daterange);
            String [] str1 = daterange.split(",");
            str[1]=str1[1];
            str[0]=str1[0];
        }

        Account account = new Account();
        account.setName(name);
        account.setCode(code);
        account.setNote(note);
        account.setCreatetime(str[0]);
        account.setLastlogtime(str[1]);
        account.setType(type);
        System.out.println("type="+ type);
        System.out.println("-------------selectAccountsByContidtions");
        List<Account> accounts = accountDao.selectAccountsByContidtions(account);
        System.out.println("----------------------end");
        Map<String,Object> map= new HashMap<String, Object>();
        map.put("data",JSON.toJSON(accounts));
        return map;
    }
}
