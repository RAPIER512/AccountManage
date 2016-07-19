package com.courage.accountmanage.model;

import java.io.Serializable;

/**
 * Created by courage on 2016/7/1.
 */
public class Account implements Serializable{

    private String code;

    private String name;

    private String note;

    private String state;

    private String createtime;

    private String lastlogtime;

    private String type;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public String getLastlogtime() {
        return lastlogtime;
    }

    public void setLastlogtime(String lastlogtime) {
        this.lastlogtime = lastlogtime;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "Account{" +
                "code='" + code + '\'' +
                ", name='" + name + '\'' +
                ", note='" + note + '\'' +
                ", state=" + state +
                ", createtime='" + createtime + '\'' +
                ", lastlogtime='" + lastlogtime + '\'' +
                ", type=" + type +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Account account = (Account) o;

        if (state != account.state) return false;
        if (type != account.type) return false;
        if (code != null ? !code.equals(account.code) : account.code != null) return false;
        if (name != null ? !name.equals(account.name) : account.name != null) return false;
        if (note != null ? !note.equals(account.note) : account.note != null) return false;
        if (createtime != null ? !createtime.equals(account.createtime) : account.createtime != null) return false;
        return lastlogtime != null ? lastlogtime.equals(account.lastlogtime) : account.lastlogtime == null;

    }

    @Override
    public int hashCode() {
        int result = code != null ? code.hashCode() : 0;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (note != null ? note.hashCode() : 0);
        result = 31 * result + (state != null ? state.hashCode() : 0);
        result = 31 * result + (createtime != null ? createtime.hashCode() : 0);
        result = 31 * result + (lastlogtime != null ? lastlogtime.hashCode() : 0);
        result = 31 * result + (type != null ? type.hashCode() : 0);
        return result;
    }
}
