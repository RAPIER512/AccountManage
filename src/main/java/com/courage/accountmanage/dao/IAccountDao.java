package com.courage.accountmanage.dao;

import com.courage.accountmanage.model.Account;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by courage on 2016/7/2.
 */

@Repository
public interface IAccountDao {

    //增加
    public int addAccount(Account account);

    //删除
    public int deleteAccount(String code);

    //修改
    public int updateAccount(Account account);

    //封存 启封
    public int updateAccountState(String code,String state);

    //查询所有
    public List<Account> selectAccounts();

    //条件查询
    public List<Account> selectAccountsByContidtions(Account account);
}
