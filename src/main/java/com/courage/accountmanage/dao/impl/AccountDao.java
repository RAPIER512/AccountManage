package com.courage.accountmanage.dao.impl;

import com.courage.accountmanage.dao.IAccountDao;
import com.courage.accountmanage.model.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by courage on 2016/7/2.
 */
@Component
public class AccountDao implements IAccountDao {

    @Autowired
    NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    public int addAccount(Account account) {
        String sql = "insert into account values(NULL,:code,:name,:note,:state,:createtime,:lastlogtime,:type)";
        SqlParameterSource sqlParameterSource = new BeanPropertySqlParameterSource(account);
        return namedParameterJdbcTemplate.update(sql,sqlParameterSource);
    }

    public int deleteAccount(String code) {
        String sql = "delete from account where code = :code";
        Map<String,Object> paramMap = new HashMap<String, Object>();
        paramMap.put("code",code);
        return namedParameterJdbcTemplate.update(sql,paramMap);
    }

    public int updateAccount(Account account) {
        String sql = "update account set name=:name,note =:note,state =:state,createtime=:createtime," +
                "lastlogtime=:lastlogtime,type=:type where code=:code";
        SqlParameterSource sqlParameterSource = new BeanPropertySqlParameterSource(account);
        return namedParameterJdbcTemplate.update(sql,sqlParameterSource);
    }

    public int updateAccountState(String code,String state) {
        String sql = "UPDATE account set state=:state where code=:code";
        Map<String,Object> paramMap = new HashMap<String, Object>();
        paramMap.put("code",code);
        paramMap.put("state",state);
        return namedParameterJdbcTemplate.update(sql,paramMap);
    }

    //查询过所有
    public List<Account> selectAccounts() {
        String sql = "select * from account";
        RowMapper<Account> rowMapper = new BeanPropertyRowMapper<Account>(Account.class);
        return namedParameterJdbcTemplate.query(sql, rowMapper);
    }

    //条件查询
    public List<Account> selectAccountsByContidtions(Account account) {

        String sql1="select * from account ";
        String sql = "";
        if(account.getCode()!=null && !(account.getCode().equals("")) ){
            account.setCode("%"+account.getCode()+"%");
            if(!sql.equals("")){
                sql= sql + " and ";
            }
            sql =sql+ "code like :code ";
        }
        if(account.getName()!=null&& !(account.getName().equals(""))){
            account.setName("%"+account.getName()+"%");
            if(!sql.equals("")){
                sql= sql + " and ";
            }
            sql =sql+ "name like :name ";
        }
        if(account.getNote()!=null&& !(account.getNote().equals(""))){
            account.setName("%"+account.getNote()+"%");
            if(!sql.equals("")){
                sql= sql + " and ";
            }
            sql =sql+ "note like :note ";
        }
        if(account.getCreatetime()!=null && !(account.getCreatetime().equals(""))){
            if(!sql.equals("")){
                sql= sql + " and ";
            }
            sql =sql+ "createtime>:createtime ";
        }
        if(account.getLastlogtime()!=null && !(account.getLastlogtime().equals(""))){
            if(!sql.equals("")){
                sql= sql + " and ";
            }
            sql =sql+ "lastlogtime < :lastlogtime ";
        }
        if(account.getType()!=null && !(account.getType().equals(""))&& !(account.getType().equals("null"))){
            if(!sql.equals("")){
                sql= sql + " and ";
            }
            sql =sql+ "type=:type";
        }
        if(!sql.equals("")){
            sql = sql1+" where "+sql;
        }else {
            sql = sql1;
        }
        System.out.println("sql="+sql);
        RowMapper<Account> rowMapper = new BeanPropertyRowMapper<Account>(Account.class);
        SqlParameterSource sqlParameterSource = new BeanPropertySqlParameterSource(account);
        System.out.println(namedParameterJdbcTemplate.query(sql,sqlParameterSource,rowMapper));
        return namedParameterJdbcTemplate.query(sql,sqlParameterSource,rowMapper);
    }
}
